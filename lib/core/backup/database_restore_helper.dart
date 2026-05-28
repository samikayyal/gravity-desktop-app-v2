import 'dart:io';

import 'package:gravity_desktop_app_v2/core/config/app_settings.dart';
import 'package:path/path.dart' as p;
import 'package:sqlite3/sqlite3.dart';

class CorruptedDatabaseException implements Exception {
  const CorruptedDatabaseException(this.message);

  final String message;

  @override
  String toString() => 'CorruptedDatabaseException: $message';
}

class DatabaseRestoreException implements Exception {
  const DatabaseRestoreException(this.message, [this.cause]);

  final String message;
  final Object? cause;

  @override
  String toString() {
    if (cause == null) {
      return 'DatabaseRestoreException: $message';
    }
    return 'DatabaseRestoreException: $message ($cause)';
  }
}

class DatabaseRestoreHelper {
  DatabaseRestoreHelper({
    required this.activeDatabaseFile,
    File? safetyCopyFile,
    Future<void> Function()? closeActiveConnections,
  }) : safetyCopyFile =
           safetyCopyFile ??
           File(p.join(activeDatabaseFile.parent.path, 'safety_copy.db')),
       _closeActiveConnections = closeActiveConnections;

  static const requiredTables = <String>{
    'players',
    'player_phones',
    'sessions',
    'subscriptions',
    'subscription_usage_logs',
    'products',
    'product_sales',
    'sale_items',
    'payments',
    'debts',
    'debt_payments',
    'inventory_movements',
    'end_day_closes',
    'audit_events',
    'backup_runs',
    'system_settings',
    'corrections',
  };

  final File activeDatabaseFile;
  final File safetyCopyFile;
  final Future<void> Function()? _closeActiveConnections;

  Future<void> verifyAndRestore(File uploadedFile) async {
    await _validateDatabaseFile(uploadedFile);
    await activeDatabaseFile.parent.create(recursive: true);
    await safetyCopyFile.parent.create(recursive: true);

    final hadActiveDatabase = await activeDatabaseFile.exists();

    if (_closeActiveConnections != null) {
      await _closeActiveConnections();
    }

    if (hadActiveDatabase) {
      await activeDatabaseFile.copy(safetyCopyFile.path);
    } else if (await safetyCopyFile.exists()) {
      await safetyCopyFile.delete();
    }

    try {
      await uploadedFile.copy(activeDatabaseFile.path);
      await _validateDatabaseFile(activeDatabaseFile);
    } catch (error) {
      if (hadActiveDatabase && await safetyCopyFile.exists()) {
        await safetyCopyFile.copy(activeDatabaseFile.path);
      } else if (await activeDatabaseFile.exists()) {
        await activeDatabaseFile.delete();
      }
      throw DatabaseRestoreException(
        'Restore failed and the safety copy was restored.',
        error,
      );
    }
  }

  Future<void> _validateDatabaseFile(File file) async {
    if (!await file.exists()) {
      throw const CorruptedDatabaseException(
        'Selected database file does not exist.',
      );
    }

    Database? candidateDatabase;
    try {
      candidateDatabase = sqlite3.open(file.path, mode: OpenMode.readOnly);

      final integrityRow = candidateDatabase
          .select('PRAGMA integrity_check')
          .first;
      final integrityResult = integrityRow['integrity_check'] as String;
      if (integrityResult.toLowerCase() != 'ok') {
        throw CorruptedDatabaseException(
          'SQLite integrity check failed: $integrityResult',
        );
      }

      final tableRows = candidateDatabase.select(
        "SELECT name FROM sqlite_master WHERE type = 'table'",
      );
      final tableNames = tableRows.map((row) => row['name'] as String).toSet();
      final missingTables = requiredTables.difference(tableNames);
      if (missingTables.isNotEmpty) {
        throw CorruptedDatabaseException(
          'Database is missing required tables: ${missingTables.join(', ')}',
        );
      }

      final settings = _readSystemSettings(candidateDatabase);
      if (settings[SettingKeys.setupComplete] != '1') {
        throw const CorruptedDatabaseException(
          'Database restore requires setup_complete to be 1.',
        );
      }
      final adminPassword = settings[SettingKeys.adminPassword]?.trim();
      if (adminPassword == null || adminPassword.isEmpty) {
        throw const CorruptedDatabaseException(
          'Database restore requires an explicit admin_password setting.',
        );
      }
    } on CorruptedDatabaseException {
      rethrow;
    } catch (error) {
      throw const CorruptedDatabaseException(
        'Selected file is not a readable Gravity SQLite database.',
      );
    } finally {
      try {
        candidateDatabase?.dispose();
      } catch (_) {
        // The candidate may fail before Drift opens it.
      }
    }
  }

  Map<String, String> _readSystemSettings(Database database) {
    final rows = database.select(
      'SELECT key, value FROM system_settings WHERE key IN (?, ?)',
      [SettingKeys.setupComplete, SettingKeys.adminPassword],
    );
    return {
      for (final row in rows) row['key'] as String: row['value'] as String,
    };
  }
}
