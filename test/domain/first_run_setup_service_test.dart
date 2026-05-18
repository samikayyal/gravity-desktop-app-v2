import 'dart:math';

import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gravity_desktop_app/core/backup/initial_backup_runner.dart';
import 'package:gravity_desktop_app/core/database/app_database.dart';
import 'package:gravity_desktop_app/data/repositories/setup_repository.dart';
import 'package:gravity_desktop_app/domain/setup/first_run_setup.dart';
import 'package:gravity_desktop_app/domain/setup/first_run_setup_service.dart';

void main() {
  test('new installation validation reports missing required fields', () {
    final service = _newService();

    final issues = service.validateNewInstallation(
      _validDraft(
        adminPassword: '',
        confirmAdminPassword: '',
        bucketName: '',
        backupCredentialsConfigured: false,
        socksPriceSyp: -1,
      ),
    );

    expect(
      issues,
      containsAll([
        SetupValidationIssue.adminPasswordRequired,
        SetupValidationIssue.backupBucketRequired,
        SetupValidationIssue.backupCredentialsRequired,
        SetupValidationIssue.socksPriceInvalid,
      ]),
    );
  });

  test('missing backup configuration blocks setup completion', () async {
    final database = AppDatabase(NativeDatabase.memory());
    addTearDown(database.close);
    final repository = SetupRepository(database);
    final service = _newService(
      repository: repository,
      backupRunner: const _FakeInitialBackupRunner(
        BackupAttemptResult.success(),
      ),
    );

    await expectLater(
      service.completeNewInstallation(
        _validDraft(backupCredentialsConfigured: false),
      ),
      throwsA(isA<SetupValidationException>()),
    );

    final snapshot = await repository.loadSnapshot();
    expect(snapshot.isSetupComplete, isFalse);
  });

  test(
    'first upload failure records a warning without blocking setup',
    () async {
      final database = AppDatabase(NativeDatabase.memory());
      addTearDown(database.close);
      final repository = SetupRepository(database);
      final service = _newService(
        repository: repository,
        backupRunner: const _FakeInitialBackupRunner(
          BackupAttemptResult.failure('network unavailable'),
        ),
      );

      final result = await service.completeNewInstallation(_validDraft());

      final snapshot = await repository.loadSnapshot();
      final products = await database.select(database.products).get();
      final movements = await database
          .select(database.inventoryMovements)
          .get();
      final backupRuns = await database.select(database.backupRuns).get();
      final storedCredential = await database
          .select(database.adminCredentials)
          .getSingle();
      final passwordMatches = await repository.verifyAdminPassword(
        'admin-secret',
      );
      final passwordMismatch = await repository.verifyAdminPassword(
        'wrong-secret',
      );

      expect(result.hasBackupWarning, isTrue);
      expect(snapshot.isSetupComplete, isTrue);
      expect(snapshot.backupConfigured, isTrue);
      expect(snapshot.firstBackupStatus, BackupAttemptStatus.failure);
      expect(snapshot.firstBackupMessage, 'network unavailable');
      expect(
        products.map((product) => product.code),
        containsAll(['socks', 'water_bottle']),
      );
      expect(
        movements.map((movement) => movement.quantityDelta),
        containsAll([40, 24]),
      );
      expect(backupRuns.single.status, BackupAttemptStatus.failure.name);
      expect(storedCredential.passwordPlaintext, 'admin-secret');
      expect(passwordMatches, isTrue);
      expect(passwordMismatch, isFalse);
    },
  );
}

FirstRunSetupService _newService({
  SetupRepository? repository,
  InitialBackupRunner? backupRunner,
}) {
  final effectiveRepository = repository ?? _newRepository();
  return FirstRunSetupService(
    setupRepository: effectiveRepository,
    initialBackupRunner:
        backupRunner ??
        const _FakeInitialBackupRunner(BackupAttemptResult.success()),
    nowUtc: () => DateTime.utc(2026, 5, 17, 12),
    random: Random(1),
  );
}

SetupRepository _newRepository() {
  final database = AppDatabase(NativeDatabase.memory());
  addTearDown(database.close);
  return SetupRepository(database);
}

NewInstallationSetupDraft _validDraft({
  String adminPassword = 'admin-secret',
  String confirmAdminPassword = 'admin-secret',
  String bucketName = 'gravity-backups',
  bool backupCredentialsConfigured = true,
  int socksPriceSyp = 25000,
}) {
  return NewInstallationSetupDraft(
    adminPassword: adminPassword,
    confirmAdminPassword: confirmAdminPassword,
    backupBucketName: bucketName,
    backupBucketPrefix: 'front-desk',
    backupCredentialsConfigured: backupCredentialsConfigured,
    socks: ProductSetupDraft(
      code: 'socks',
      name: 'Socks',
      priceSyp: socksPriceSyp,
      startingStock: 40,
      lowStockThreshold: 8,
    ),
    waterBottle: const ProductSetupDraft(
      code: 'water_bottle',
      name: 'Water Bottle',
      priceSyp: 10000,
      startingStock: 24,
      lowStockThreshold: 6,
    ),
  );
}

class _FakeInitialBackupRunner implements InitialBackupRunner {
  const _FakeInitialBackupRunner(this.result);

  final BackupAttemptResult result;

  @override
  Future<BackupAttemptResult> attemptInitialBackup() async => result;
}
