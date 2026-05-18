import 'first_run_setup.dart';

abstract interface class SetupStateRepository {
  Future<SetupSnapshot> loadSnapshot();

  Future<void> completeNewInstallation({
    required NewInstallationSetupDraft draft,
    required String installationId,
    required DateTime completedAtUtc,
  });

  Future<void> recordInitialBackupResult({
    required BackupAttemptResult result,
    required DateTime startedAtUtc,
    required DateTime completedAtUtc,
  });

  Future<bool> verifyAdminPassword(String password);
}
