import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gravity_desktop_app_v2/core/database/local_database.dart';
import 'package:gravity_desktop_app_v2/data/repositories/startup_repository.dart';
import 'package:gravity_desktop_app_v2/domain/entities/startup_state.dart';

/// Provider for the AppDatabase singleton instance.
final databaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(() => db.close());
  return db;
});

/// Provider for the StartupRepository instance.
final startupRepositoryProvider = Provider<StartupRepository>((ref) {
  return StartupRepository(ref.watch(databaseProvider));
});

/// FutureProvider that evaluates the startup state of the application.
/// Exceptions are allowed to bubble up to be caught by Riverpod and handled as database errors.
final startupStateProvider = FutureProvider<StartupState>((ref) async {
  final repository = ref.watch(startupRepositoryProvider);
  return await repository.checkStartupState();
});
