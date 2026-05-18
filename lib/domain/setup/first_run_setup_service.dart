import 'dart:math';

import '../../core/backup/initial_backup_runner.dart';
import 'first_run_setup.dart';
import 'setup_state_repository.dart';

class FirstRunSetupService {
  FirstRunSetupService({
    required SetupStateRepository setupRepository,
    required InitialBackupRunner initialBackupRunner,
    DateTime Function()? nowUtc,
    Random? random,
  }) : _setupRepository = setupRepository,
       _initialBackupRunner = initialBackupRunner,
       _nowUtc = nowUtc ?? (() => DateTime.now().toUtc()),
       _random = random ?? Random.secure();

  final SetupStateRepository _setupRepository;
  final InitialBackupRunner _initialBackupRunner;
  final DateTime Function() _nowUtc;
  final Random _random;

  Future<SetupCompletionResult> completeNewInstallation(
    NewInstallationSetupDraft draft,
  ) async {
    final issues = validateNewInstallation(draft);
    if (issues.isNotEmpty) {
      throw SetupValidationException(issues);
    }

    final completedAtUtc = _nowUtc();

    await _setupRepository.completeNewInstallation(
      draft: draft,
      installationId: _newInstallationId(completedAtUtc),
      completedAtUtc: completedAtUtc,
    );

    final backupStartedAtUtc = _nowUtc();
    final backupAttempt = await _attemptInitialBackup();
    await _setupRepository.recordInitialBackupResult(
      result: backupAttempt,
      startedAtUtc: backupStartedAtUtc,
      completedAtUtc: _nowUtc(),
    );

    return SetupCompletionResult(backupAttempt: backupAttempt);
  }

  List<SetupValidationIssue> validateNewInstallation(
    NewInstallationSetupDraft draft,
  ) {
    final issues = <SetupValidationIssue>[];

    if (draft.adminPassword.trim().isEmpty) {
      issues.add(SetupValidationIssue.adminPasswordRequired);
    }
    if (draft.adminPassword != draft.confirmAdminPassword) {
      issues.add(SetupValidationIssue.adminPasswordConfirmationMismatch);
    }
    if (draft.backupBucketName.trim().isEmpty) {
      issues.add(SetupValidationIssue.backupBucketRequired);
    }
    if (draft.backupBucketPrefix.trim().isEmpty) {
      issues.add(SetupValidationIssue.backupPrefixRequired);
    }
    if (!draft.backupCredentialsConfigured) {
      issues.add(SetupValidationIssue.backupCredentialsRequired);
    }
    _validateProduct(
      product: draft.socks,
      priceIssue: SetupValidationIssue.socksPriceInvalid,
      startingStockIssue: SetupValidationIssue.socksStartingStockInvalid,
      lowStockIssue: SetupValidationIssue.socksLowStockThresholdInvalid,
      issues: issues,
    );
    _validateProduct(
      product: draft.waterBottle,
      priceIssue: SetupValidationIssue.waterBottlePriceInvalid,
      startingStockIssue: SetupValidationIssue.waterBottleStartingStockInvalid,
      lowStockIssue: SetupValidationIssue.waterBottleLowStockThresholdInvalid,
      issues: issues,
    );
    if (draft.backupIntervalMinutes <= 0) {
      issues.add(SetupValidationIssue.backupIntervalInvalid);
    }
    if (draft.staleSessionThresholdMinutes <= 0) {
      issues.add(SetupValidationIssue.staleSessionThresholdInvalid);
    }

    return issues;
  }

  Future<BackupAttemptResult> _attemptInitialBackup() async {
    try {
      return await _initialBackupRunner.attemptInitialBackup();
    } on Object catch (error) {
      return BackupAttemptResult.failure('Initial backup failed: $error');
    }
  }

  void _validateProduct({
    required ProductSetupDraft product,
    required SetupValidationIssue priceIssue,
    required SetupValidationIssue startingStockIssue,
    required SetupValidationIssue lowStockIssue,
    required List<SetupValidationIssue> issues,
  }) {
    if (product.priceSyp < 0) {
      issues.add(priceIssue);
    }
    if (product.startingStock < 0) {
      issues.add(startingStockIssue);
    }
    if (product.lowStockThreshold < 0) {
      issues.add(lowStockIssue);
    }
  }

  String _newInstallationId(DateTime completedAtUtc) {
    final suffix = List<int>.generate(
      8,
      (_) => _random.nextInt(16),
    ).map((value) => value.toRadixString(16)).join();
    return 'gravity-${completedAtUtc.microsecondsSinceEpoch}-$suffix';
  }
}
