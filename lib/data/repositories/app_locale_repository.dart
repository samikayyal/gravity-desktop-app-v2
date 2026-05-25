import 'package:gravity_desktop_app_v2/core/database/local_database.dart';

class AppLocaleRepository {
  AppLocaleRepository(this._database);

  static const String localeSettingKey = 'app_locale';

  final AppDatabase _database;

  Future<String?> loadLocaleCode() async {
    final setting = await (_database.select(
      _database.systemSettings,
    )..where((table) => table.key.equals(localeSettingKey))).getSingleOrNull();
    return setting?.value;
  }

  Future<void> saveLocaleCode(String languageCode) async {
    await _database
        .into(_database.systemSettings)
        .insertOnConflictUpdate(
          SystemSettingsCompanion.insert(
            key: localeSettingKey,
            value: languageCode,
            updatedAt: DateTime.now().toUtc().toIso8601String(),
          ),
        );
  }
}
