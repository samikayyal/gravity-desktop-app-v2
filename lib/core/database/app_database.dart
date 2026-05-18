import 'package:drift/drift.dart';

import 'database_connection.dart';

part 'app_database.g.dart';

class AppSetupStates extends Table {
  IntColumn get id => integer().withDefault(const Constant(1))();
  TextColumn get installationId => text()();
  TextColumn get businessTimezone =>
      text().withDefault(const Constant('Asia/Damascus'))();
  BoolColumn get setupCompleted =>
      boolean().withDefault(const Constant(false))();
  BoolColumn get backupConfigured =>
      boolean().withDefault(const Constant(false))();
  IntColumn get backupIntervalMinutes =>
      integer().withDefault(const Constant(120))();
  IntColumn get staleSessionThresholdMinutes =>
      integer().withDefault(const Constant(720))();
  TextColumn get firstBackupStatus => text().nullable()();
  TextColumn get firstBackupMessage => text().nullable()();
  DateTimeColumn get createdAtUtc => dateTime()();
  DateTimeColumn get completedAtUtc => dateTime().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class AdminCredentials extends Table {
  IntColumn get id => integer().withDefault(const Constant(1))();
  TextColumn get passwordPlaintext => text()();
  DateTimeColumn get createdAtUtc => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class BackupConfigurations extends Table {
  IntColumn get id => integer().withDefault(const Constant(1))();
  TextColumn get bucketName => text()();
  TextColumn get bucketPrefix => text()();
  BoolColumn get credentialsConfigured =>
      boolean().withDefault(const Constant(false))();
  DateTimeColumn get configuredAtUtc => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class BackupRuns extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get runType => text()();
  TextColumn get status => text()();
  TextColumn get message => text().nullable()();
  DateTimeColumn get startedAtUtc => dateTime()();
  DateTimeColumn get completedAtUtc => dateTime()();
}

class Products extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get code => text().unique()();
  TextColumn get name => text()();
  IntColumn get priceSyp => integer()();
  IntColumn get lowStockThreshold => integer()();
  BoolColumn get active => boolean().withDefault(const Constant(true))();
  DateTimeColumn get createdAtUtc => dateTime()();
  DateTimeColumn get updatedAtUtc => dateTime()();
}

class InventoryMovements extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get productId => integer().references(Products, #id)();
  IntColumn get quantityDelta => integer()();
  TextColumn get reason => text()();
  DateTimeColumn get createdAtUtc => dateTime()();
}

@DriftDatabase(
  tables: [
    AppSetupStates,
    AdminCredentials,
    BackupConfigurations,
    BackupRuns,
    Products,
    InventoryMovements,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? openAppDatabase());

  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (migrator) async {
      await migrator.createAll();
    },
    onUpgrade: (migrator, from, to) async {
      if (from < 2) {
        await migrator.createAll();
      } else if (from < 3) {
        await migrator.deleteTable('admin_credentials');
        await migrator.createTable(adminCredentials);
        await customStatement('''
          UPDATE app_setup_states
          SET setup_completed = 0,
              completed_at_utc = NULL,
              first_backup_status = NULL,
              first_backup_message = 'Admin password must be re-entered after plaintext storage migration.'
          WHERE id = 1;
          ''');
      }
    },
  );
}
