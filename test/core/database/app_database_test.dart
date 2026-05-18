import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gravity_desktop_app/core/database/app_database.dart';

void main() {
  test('opens an in-memory Drift database baseline', () async {
    final database = AppDatabase(NativeDatabase.memory());
    addTearDown(database.close);

    final row = await database.customSelect('SELECT 1 AS value').getSingle();
    final setupRows = await database.select(database.appSetupStates).get();

    expect(database.schemaVersion, 3);
    expect(row.read<int>('value'), 1);
    expect(setupRows, isEmpty);
  });

  test('upgrades the empty v1 schema to setup schema version 3', () async {
    final database = AppDatabase(
      NativeDatabase.memory(
        setup: (rawDatabase) {
          rawDatabase.execute('PRAGMA user_version = 1;');
        },
      ),
    );
    addTearDown(database.close);

    final setupRows = await database.select(database.appSetupStates).get();
    final userVersion = await database
        .customSelect('PRAGMA user_version;')
        .getSingle();

    expect(setupRows, isEmpty);
    expect(userVersion.read<int>('user_version'), 3);
  });

  test('v2 hash credentials migrate to plaintext credential schema', () async {
    final database = AppDatabase(
      NativeDatabase.memory(
        setup: (rawDatabase) {
          rawDatabase
            ..execute('''
              CREATE TABLE app_setup_states (
                id INTEGER NOT NULL DEFAULT 1,
                installation_id TEXT NOT NULL,
                business_timezone TEXT NOT NULL DEFAULT 'Asia/Damascus',
                setup_completed INTEGER NOT NULL DEFAULT 0,
                backup_configured INTEGER NOT NULL DEFAULT 0,
                backup_interval_minutes INTEGER NOT NULL DEFAULT 120,
                stale_session_threshold_minutes INTEGER NOT NULL DEFAULT 720,
                first_backup_status TEXT NULL,
                first_backup_message TEXT NULL,
                created_at_utc INTEGER NOT NULL,
                completed_at_utc INTEGER NULL,
                PRIMARY KEY (id)
              );
            ''')
            ..execute('''
              INSERT INTO app_setup_states (
                id,
                installation_id,
                business_timezone,
                setup_completed,
                backup_configured,
                backup_interval_minutes,
                stale_session_threshold_minutes,
                first_backup_status,
                first_backup_message,
                created_at_utc,
                completed_at_utc
              )
              VALUES (
                1,
                'gravity-dev',
                'Asia/Damascus',
                1,
                1,
                120,
                720,
                'success',
                'ok',
                0,
                0
              );
            ''')
            ..execute('''
              CREATE TABLE admin_credentials (
                id INTEGER NOT NULL DEFAULT 1,
                password_hash TEXT NOT NULL,
                password_salt TEXT NOT NULL,
                password_algorithm TEXT NOT NULL,
                password_iterations INTEGER NOT NULL,
                created_at_utc INTEGER NOT NULL,
                PRIMARY KEY (id)
              );
            ''')
            ..execute('''
              INSERT INTO admin_credentials (
                id,
                password_hash,
                password_salt,
                password_algorithm,
                password_iterations,
                created_at_utc
              )
              VALUES (1, 'hash', 'salt', 'pbkdf2_sha256', 120000, 0);
            ''')
            ..execute('PRAGMA user_version = 2;');
        },
      ),
    );
    addTearDown(database.close);

    final setupRow = await database.select(database.appSetupStates).getSingle();
    final credentials = await database.select(database.adminCredentials).get();
    final userVersion = await database
        .customSelect('PRAGMA user_version;')
        .getSingle();

    expect(setupRow.setupCompleted, isFalse);
    expect(setupRow.firstBackupStatus, isNull);
    expect(
      setupRow.firstBackupMessage,
      'Admin password must be re-entered after plaintext storage migration.',
    );
    expect(credentials, isEmpty);
    expect(userVersion.read<int>('user_version'), 3);
  });
}
