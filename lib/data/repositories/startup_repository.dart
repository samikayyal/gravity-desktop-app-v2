import 'package:gravity_desktop_app_v2/core/database/local_database.dart';
import 'package:gravity_desktop_app_v2/domain/entities/startup_state.dart';

class StartupRepository {
  final AppDatabase _db;

  StartupRepository(this._db);

  /// Checks if the first-run cashier setup is complete.
  /// Any open or query exceptions are allowed to bubble up naturally
  /// to represent database corruption or lock errors.
  Future<StartupState> checkStartupState() async {
    final query = _db.select(_db.systemSettings)
      ..where((tbl) => tbl.key.equals('admin_password'));
    final result = await query.getSingleOrNull();

    if (result != null && result.value.isNotEmpty) {
      return StartupState.complete;
    } else {
      return StartupState.needsSetup;
    }
  }
}
