import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/backup/initial_backup_runner.dart';
import '../core/database/app_database.dart';
import '../data/repositories/setup_repository.dart';
import '../domain/setup/first_run_setup.dart';
import '../domain/setup/first_run_setup_service.dart';

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  final database = AppDatabase();
  ref.onDispose(database.close);
  return database;
});

final initialBackupRunnerProvider = Provider<InitialBackupRunner>((ref) {
  return const UnavailableInitialBackupRunner();
});

final setupRepositoryProvider = Provider<SetupRepository>((ref) {
  return SetupRepository(ref.watch(appDatabaseProvider));
});

final firstRunSetupServiceProvider = Provider<FirstRunSetupService>((ref) {
  return FirstRunSetupService(
    setupRepository: ref.watch(setupRepositoryProvider),
    initialBackupRunner: ref.watch(initialBackupRunnerProvider),
  );
});

final setupSnapshotProvider = FutureProvider<SetupSnapshot>((ref) {
  return ref.watch(setupRepositoryProvider).loadSnapshot();
});
