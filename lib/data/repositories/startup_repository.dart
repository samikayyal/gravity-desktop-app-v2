import 'package:gravity_desktop_app_v2/core/config/app_settings.dart';
import 'package:gravity_desktop_app_v2/core/database/local_database.dart';
import 'package:gravity_desktop_app_v2/domain/entities/startup_state.dart';

class StartupRepository {
  final AppDatabase _db;

  StartupRepository(this._db);

  /// Checks if the first-run cashier setup is complete.
  /// Any open or query exceptions are allowed to bubble up naturally
  /// to represent database corruption or lock errors.
  Future<StartupState> checkStartupState() async {
    final rows =
        await (_db.select(_db.systemSettings)..where(
              (tbl) => tbl.key.isIn([
                SettingKeys.setupComplete,
                SettingKeys.adminPassword,
              ]),
            ))
            .get();
    final values = {for (final row in rows) row.key: row.value};

    final setupComplete = values[SettingKeys.setupComplete] == '1';
    final hasAdminPassword =
        values[SettingKeys.adminPassword]?.trim().isNotEmpty ?? false;

    if (setupComplete && hasAdminPassword) {
      return StartupState.complete;
    } else {
      return StartupState.needsSetup;
    }
  }
}
