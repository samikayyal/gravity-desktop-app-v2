import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gravity_desktop_app_v2/core/backup/database_restore_helper.dart';
import 'package:gravity_desktop_app_v2/core/config/app_settings.dart';
import 'package:gravity_desktop_app_v2/core/database/local_database.dart';
import 'package:path/path.dart' as p;
import 'package:sqlite3/sqlite3.dart';

void main() {
  late Directory tempDir;

  setUp(() async {
    tempDir = await Directory.systemTemp.createTemp('gravity_restore_test_');
  });

  tearDown(() async {
    if (await tempDir.exists()) {
      await tempDir.delete(recursive: true);
    }
  });

  test(
    'valid database replaces the active file and creates a safety copy',
    () async {
      final activeFile = File(p.join(tempDir.path, 'gravity.db'));
      final uploadedFile = File(p.join(tempDir.path, 'uploaded.db'));
      final safetyFile = File(p.join(tempDir.path, 'safety_copy.db'));

      await _createDatabaseWithSetting(activeFile, 'active_marker', 'old');
      await _createDatabaseWithSettings(uploadedFile, {
        SettingKeys.setupComplete: '1',
        SettingKeys.adminPassword: 'AdminGravity',
      });

      final helper = DatabaseRestoreHelper(
        activeDatabaseFile: activeFile,
        safetyCopyFile: safetyFile,
      );

      await helper.verifyAndRestore(uploadedFile);

      expect(await safetyFile.exists(), isTrue);
      expect(await _readSetting(activeFile, SettingKeys.setupComplete), '1');
      expect(await _readSetting(safetyFile, 'active_marker'), 'old');
    },
  );

  test(
    'corrupted file is rejected and leaves active database untouched',
    () async {
      final activeFile = File(p.join(tempDir.path, 'gravity.db'));
      final uploadedFile = File(p.join(tempDir.path, 'corrupted.db'));
      final safetyFile = File(p.join(tempDir.path, 'safety_copy.db'));

      await _createDatabaseWithSetting(activeFile, 'active_marker', 'old');
      await uploadedFile.writeAsString('not a sqlite database');

      final helper = DatabaseRestoreHelper(
        activeDatabaseFile: activeFile,
        safetyCopyFile: safetyFile,
      );

      await expectLater(
        helper.verifyAndRestore(uploadedFile),
        throwsA(isA<CorruptedDatabaseException>()),
      );

      expect(await _readSetting(activeFile, 'active_marker'), 'old');
      expect(await safetyFile.exists(), isFalse);
    },
  );

  test('sqlite file missing required tables is rejected', () async {
    final activeFile = File(p.join(tempDir.path, 'gravity.db'));
    final uploadedFile = File(p.join(tempDir.path, 'wrong_schema.db'));

    await _createDatabaseWithSetting(activeFile, 'active_marker', 'old');
    final rawDatabase = sqlite3.open(uploadedFile.path);
    rawDatabase.execute('CREATE TABLE unrelated (id INTEGER PRIMARY KEY)');
    rawDatabase.dispose();

    final helper = DatabaseRestoreHelper(activeDatabaseFile: activeFile);

    await expectLater(
      helper.verifyAndRestore(uploadedFile),
      throwsA(isA<CorruptedDatabaseException>()),
    );

    expect(await _readSetting(activeFile, 'active_marker'), 'old');
  });

  test('setup-complete database missing admin password is rejected', () async {
    final activeFile = File(p.join(tempDir.path, 'gravity.db'));
    final uploadedFile = File(p.join(tempDir.path, 'missing_admin.db'));

    await _createDatabaseWithSetting(activeFile, 'active_marker', 'old');
    await _createDatabaseWithSetting(
      uploadedFile,
      SettingKeys.setupComplete,
      '1',
    );

    final helper = DatabaseRestoreHelper(activeDatabaseFile: activeFile);

    await expectLater(
      helper.verifyAndRestore(uploadedFile),
      throwsA(isA<CorruptedDatabaseException>()),
    );

    expect(await _readSetting(activeFile, 'active_marker'), 'old');
  });
}

Future<void> _createDatabaseWithSetting(File file, String key, String value) {
  return _createDatabaseWithSettings(file, {key: value});
}

Future<void> _createDatabaseWithSettings(
  File file,
  Map<String, String> settings,
) async {
  final database = AppDatabase.forTesting(
    DatabaseConnection(NativeDatabase(file)),
  );
  for (final entry in settings.entries) {
    await database
        .into(database.systemSettings)
        .insert(
          SystemSettingsCompanion.insert(
            key: entry.key,
            value: entry.value,
            updatedAt: DateTime.utc(2026, 5, 28).toIso8601String(),
          ),
        );
  }
  await database.close();
}

Future<String?> _readSetting(File file, String key) async {
  final database = AppDatabase.forTesting(
    DatabaseConnection(NativeDatabase(file)),
  );
  final row = await (database.select(
    database.systemSettings,
  )..where((table) => table.key.equals(key))).getSingleOrNull();
  await database.close();
  return row?.value;
}
