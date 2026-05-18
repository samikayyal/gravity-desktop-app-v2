import '../../domain/setup/first_run_setup.dart';

abstract interface class InitialBackupRunner {
  Future<BackupAttemptResult> attemptInitialBackup();
}

class UnavailableInitialBackupRunner implements InitialBackupRunner {
  const UnavailableInitialBackupRunner();

  @override
  Future<BackupAttemptResult> attemptInitialBackup() async {
    return const BackupAttemptResult.failure(
      'Initial cloud backup is not available yet. Setup is complete and offline cashier work can continue.',
    );
  }
}
