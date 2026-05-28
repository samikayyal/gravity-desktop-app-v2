import 'package:gravity_desktop_app_v2/core/config/app_settings.dart';
import 'package:gravity_desktop_app_v2/core/database/local_database.dart';

class AdminAuthRepository {
  const AdminAuthRepository(this._database);

  final AppDatabase _database;

  Future<bool> verifyPlaintextPassword(String password) async {
    final setting =
        await (_database.select(_database.systemSettings)
              ..where((table) => table.key.equals(SettingKeys.adminPassword)))
            .getSingleOrNull();

    return setting != null && setting.value == password;
  }
}
