import 'package:drift/drift.dart';

import '../../core/database/app_database.dart';
import '../../domain/setup/first_run_setup.dart';
import '../../domain/setup/setup_state_repository.dart';

class SetupRepository implements SetupStateRepository {
  const SetupRepository(this._database);

  final AppDatabase _database;

  @override
  Future<SetupSnapshot> loadSnapshot() async {
    final row = await (_database.select(
      _database.appSetupStates,
    )..where((table) => table.id.equals(1))).getSingleOrNull();

    if (row == null) {
      return const SetupSnapshot.pending();
    }

    return SetupSnapshot(
      isSetupComplete: row.setupCompleted,
      installationId: row.installationId,
      businessTimezone: row.businessTimezone,
      backupConfigured: row.backupConfigured,
      firstBackupStatus: _parseBackupAttemptStatus(row.firstBackupStatus),
      firstBackupMessage: row.firstBackupMessage,
    );
  }

  @override
  Future<void> completeNewInstallation({
    required NewInstallationSetupDraft draft,
    required String installationId,
    required DateTime completedAtUtc,
  }) async {
    await _database.transaction(() async {
      final existing = await (_database.select(
        _database.appSetupStates,
      )..where((table) => table.id.equals(1))).getSingleOrNull();

      if (existing?.setupCompleted ?? false) {
        throw StateError('First-run setup is already complete.');
      }

      await _database
          .into(_database.appSetupStates)
          .insertOnConflictUpdate(
            AppSetupStatesCompanion.insert(
              id: const Value(1),
              installationId: installationId,
              businessTimezone: Value(draft.businessTimezone),
              setupCompleted: const Value(true),
              backupConfigured: Value(draft.backupCredentialsConfigured),
              backupIntervalMinutes: Value(draft.backupIntervalMinutes),
              staleSessionThresholdMinutes: Value(
                draft.staleSessionThresholdMinutes,
              ),
              createdAtUtc: completedAtUtc,
              completedAtUtc: Value(completedAtUtc),
            ),
          );

      await _database
          .into(_database.adminCredentials)
          .insertOnConflictUpdate(
            AdminCredentialsCompanion.insert(
              id: const Value(1),
              passwordPlaintext: draft.adminPassword,
              createdAtUtc: completedAtUtc,
            ),
          );

      await _database
          .into(_database.backupConfigurations)
          .insertOnConflictUpdate(
            BackupConfigurationsCompanion.insert(
              id: const Value(1),
              bucketName: draft.backupBucketName.trim(),
              bucketPrefix: draft.backupBucketPrefix.trim(),
              credentialsConfigured: Value(draft.backupCredentialsConfigured),
              configuredAtUtc: completedAtUtc,
            ),
          );

      await _storeInitialProduct(draft.socks, completedAtUtc);
      await _storeInitialProduct(draft.waterBottle, completedAtUtc);
    });
  }

  @override
  Future<void> recordInitialBackupResult({
    required BackupAttemptResult result,
    required DateTime startedAtUtc,
    required DateTime completedAtUtc,
  }) async {
    await _database.transaction(() async {
      await _database
          .into(_database.backupRuns)
          .insert(
            BackupRunsCompanion.insert(
              runType: 'initial_setup',
              status: result.status.name,
              message: Value(result.message),
              startedAtUtc: startedAtUtc,
              completedAtUtc: completedAtUtc,
            ),
          );

      await (_database.update(
        _database.appSetupStates,
      )..where((table) => table.id.equals(1))).write(
        AppSetupStatesCompanion(
          firstBackupStatus: Value(result.status.name),
          firstBackupMessage: Value(result.message),
        ),
      );
    });
  }

  @override
  Future<bool> verifyAdminPassword(String password) async {
    final row = await (_database.select(
      _database.adminCredentials,
    )..where((table) => table.id.equals(1))).getSingleOrNull();

    if (row == null) {
      return false;
    }

    return row.passwordPlaintext == password;
  }

  Future<void> _storeInitialProduct(
    ProductSetupDraft product,
    DateTime createdAtUtc,
  ) async {
    final productId = await _database
        .into(_database.products)
        .insertOnConflictUpdate(
          ProductsCompanion.insert(
            code: product.code,
            name: product.name,
            priceSyp: product.priceSyp,
            lowStockThreshold: product.lowStockThreshold,
            active: const Value(true),
            createdAtUtc: createdAtUtc,
            updatedAtUtc: createdAtUtc,
          ),
        );

    if (product.startingStock != 0) {
      await _database
          .into(_database.inventoryMovements)
          .insert(
            InventoryMovementsCompanion.insert(
              productId: productId,
              quantityDelta: product.startingStock,
              reason: 'initial_setup',
              createdAtUtc: createdAtUtc,
            ),
          );
    }
  }

  BackupAttemptStatus? _parseBackupAttemptStatus(String? value) {
    if (value == null) {
      return null;
    }

    for (final status in BackupAttemptStatus.values) {
      if (status.name == value) {
        return status;
      }
    }

    return null;
  }
}
