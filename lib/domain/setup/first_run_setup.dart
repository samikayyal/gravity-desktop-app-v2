enum BackupAttemptStatus { success, failure }

enum SetupValidationIssue {
  adminPasswordRequired,
  adminPasswordConfirmationMismatch,
  backupBucketRequired,
  backupPrefixRequired,
  backupCredentialsRequired,
  socksPriceInvalid,
  socksStartingStockInvalid,
  socksLowStockThresholdInvalid,
  waterBottlePriceInvalid,
  waterBottleStartingStockInvalid,
  waterBottleLowStockThresholdInvalid,
  backupIntervalInvalid,
  staleSessionThresholdInvalid,
}

class ProductSetupDraft {
  const ProductSetupDraft({
    required this.code,
    required this.name,
    required this.priceSyp,
    required this.startingStock,
    required this.lowStockThreshold,
  });

  final String code;
  final String name;
  final int priceSyp;
  final int startingStock;
  final int lowStockThreshold;
}

class NewInstallationSetupDraft {
  const NewInstallationSetupDraft({
    required this.adminPassword,
    required this.confirmAdminPassword,
    required this.backupBucketName,
    required this.backupBucketPrefix,
    required this.backupCredentialsConfigured,
    required this.socks,
    required this.waterBottle,
    this.businessTimezone = 'Asia/Damascus',
    this.backupIntervalMinutes = 120,
    this.staleSessionThresholdMinutes = 720,
  });

  final String adminPassword;
  final String confirmAdminPassword;
  final String backupBucketName;
  final String backupBucketPrefix;
  final bool backupCredentialsConfigured;
  final ProductSetupDraft socks;
  final ProductSetupDraft waterBottle;
  final String businessTimezone;
  final int backupIntervalMinutes;
  final int staleSessionThresholdMinutes;
}

class BackupAttemptResult {
  const BackupAttemptResult({required this.status, this.message});

  const BackupAttemptResult.success([String? message])
    : this(status: BackupAttemptStatus.success, message: message);

  const BackupAttemptResult.failure(String message)
    : this(status: BackupAttemptStatus.failure, message: message);

  final BackupAttemptStatus status;
  final String? message;

  bool get isFailure => status == BackupAttemptStatus.failure;
}

class SetupCompletionResult {
  const SetupCompletionResult({required this.backupAttempt});

  final BackupAttemptResult backupAttempt;

  bool get hasBackupWarning => backupAttempt.isFailure;
}

class SetupValidationException implements Exception {
  const SetupValidationException(this.issues);

  final List<SetupValidationIssue> issues;

  @override
  String toString() => 'SetupValidationException($issues)';
}

class SetupSnapshot {
  const SetupSnapshot({
    required this.isSetupComplete,
    this.installationId,
    this.businessTimezone = 'Asia/Damascus',
    this.backupConfigured = false,
    this.firstBackupStatus,
    this.firstBackupMessage,
  });

  const SetupSnapshot.pending()
    : isSetupComplete = false,
      installationId = null,
      businessTimezone = 'Asia/Damascus',
      backupConfigured = false,
      firstBackupStatus = null,
      firstBackupMessage = null;

  final bool isSetupComplete;
  final String? installationId;
  final String businessTimezone;
  final bool backupConfigured;
  final BackupAttemptStatus? firstBackupStatus;
  final String? firstBackupMessage;

  bool get hasBackupWarning => firstBackupStatus == BackupAttemptStatus.failure;
}
