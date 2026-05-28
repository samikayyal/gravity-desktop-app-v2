// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get titleApp => 'Gravity Cashier Desk';

  @override
  String get titleActiveBoard => 'Active Board';

  @override
  String get titleActionPanel => 'Action Panel';

  @override
  String get titleSettings => 'Settings';

  @override
  String get titleNoActiveSelection => 'No Active Selection';

  @override
  String get titleFirstRunSetupWizard => 'First-Run Setup Wizard';

  @override
  String get titleDatabaseRescueConsole => 'Database Rescue Console';

  @override
  String get titleCriticalDatabaseStartupFailure =>
      'Critical Database Startup Failure';

  @override
  String get titleManualRestoreGuide => 'Manual Restore Guide';

  @override
  String get titleCashierOptions => 'Cashier Options';

  @override
  String get titleAdminOperations => 'Admin Operations';

  @override
  String get titleAdminSettingsLocked => 'Admin Settings Locked';

  @override
  String get titleAdminUnlockDialog => 'Unlock Admin Settings';

  @override
  String get titleAdminPassword => 'Admin Password';

  @override
  String get titleLeewayAndStaleTimers => 'Leeway & Stale Timers';

  @override
  String get titleJumpPricingMatrix => 'Jump Sessions Pricing Matrix';

  @override
  String get titleFixedBlocks => 'Fixed Blocks';

  @override
  String get titleOpenTime => 'Open Time';

  @override
  String get titleDefaultInventoryPrices => 'Default Inventory Prices';

  @override
  String get titleAuditEvents => 'Recent Audit Events';

  @override
  String get labelBoard => 'Board';

  @override
  String get labelPlayers => 'Players';

  @override
  String get labelProducts => 'Products';

  @override
  String get labelInventory => 'Inventory';

  @override
  String get labelReports => 'Reports';

  @override
  String get labelSettings => 'Settings';

  @override
  String get labelLanguage => 'Language';

  @override
  String get labelEnglishUs => 'English (US)';

  @override
  String get labelArabicSyria => 'العربية (Syria)';

  @override
  String get labelErrorDetails => 'Error Details:';

  @override
  String get labelDatabaseFileLocation => 'Database File Location:';

  @override
  String get labelCopyFilePath => 'Copy File Path';

  @override
  String get labelNotificationVolume => 'Notification Volume';

  @override
  String labelPercentValue(int percent) {
    return '$percent%';
  }

  @override
  String get labelMuteOverdueAudios => 'Mute overdue audios';

  @override
  String get labelScreenScale => 'Screen scaling';

  @override
  String labelScaleOption(String scale) {
    return '${scale}x';
  }

  @override
  String get labelAdminPassword => 'Admin password';

  @override
  String get labelLeewayGracePeriod => 'Leeway grace period';

  @override
  String get labelStaleThreshold => 'Stale threshold';

  @override
  String get labelFixed30Mins => '30 mins';

  @override
  String get labelFixed60Mins => '60 mins';

  @override
  String get labelFixed90Mins => '90 mins';

  @override
  String get labelFixed120Mins => '120 mins';

  @override
  String get labelAdditional30 => 'Additional 30';

  @override
  String get labelOpenFirstHour => 'First hour';

  @override
  String get labelOpenExtra30 => 'Extra 30';

  @override
  String get labelWaterBottlePrice => 'Water bottle';

  @override
  String get labelJumpSocksPrice => 'Jump socks';

  @override
  String labelPlayerProfilePlaceholder(int playerNumber) {
    return 'Player Profile Placeholder $playerNumber';
  }

  @override
  String labelAdminModeActive(String remainingTime) {
    return 'Admin Mode Active - $remainingTime';
  }

  @override
  String get labelChecking => 'Checking...';

  @override
  String get labelAuditTimestamp => 'Timestamp';

  @override
  String get labelAuditActionType => 'Action Type';

  @override
  String get labelAuditTargetRecord => 'Targeted Record / ID';

  @override
  String get labelAuditReason => 'Reason';

  @override
  String get labelAuditChangedDetails => 'Changed Details';

  @override
  String labelAuditPage(int pageNumber, int totalPages) {
    return 'Page $pageNumber of $totalPages';
  }

  @override
  String get msgNoActiveSelectionInstructions =>
      'Select a player session from the Active Board or select a sidebar module to load cashier tasks.';

  @override
  String get msgFirstRunSetupIntro =>
      'Welcome to Gravity Cashier. Initialize your local administrator password, verify backup bucket configurations, and seed the default product catalogs.';

  @override
  String get msgDatabaseStartupFailure =>
      'The local SQLite database failed to initialize. This error usually occurs due to file corruption, file locking, or incorrect folder write permissions.';

  @override
  String get msgManualRestoreGuide =>
      'GCP Cloud Backup Restoration tool will be fully integrated in a later backup and restore feature.\n\nTo recover your data for now, copy your backup file over the corrupted local file shown above.';

  @override
  String get msgDatabasePathCopied => 'Database path copied to clipboard.';

  @override
  String get msgKeepCorruptedDatabaseCopy =>
      'TIP: Keep a copy of this corrupted database file before attempting recovery.';

  @override
  String msgSessionSummary(int durationMinutes, String checkInTime) {
    return 'Duration: $durationMinutes min | Check-in: $checkInTime';
  }

  @override
  String get msgLanguageUpdated => 'Language updated.';

  @override
  String get msgLanguageUpdateFailed => 'Language could not be updated.';

  @override
  String get msgSettingsSaved => 'Settings saved.';

  @override
  String get msgSettingsSaveFailed => 'Settings could not be saved.';

  @override
  String get msgSettingsLoadFailed => 'Settings could not be loaded.';

  @override
  String get msgAdminSettingsLockedDescription =>
      'Protected pricing, leeway, stale-session, inventory price, and password settings require admin authorization.';

  @override
  String get msgAdminSettingsUnlocked => 'Admin settings unlocked.';

  @override
  String get msgAdminUnlockFailed => 'Admin password did not match.';

  @override
  String get msgNoAuditEvents => 'No audit events recorded yet.';

  @override
  String get msgAuditEventsLoadFailed => 'Audit events could not be loaded.';

  @override
  String get msgRequiredField => 'Required.';

  @override
  String get msgInvalidLeewayRange => 'Use 0 to 60 minutes.';

  @override
  String msgInvalidStaleThreshold(int minimumMinutes) {
    return 'Use at least $minimumMinutes minutes.';
  }

  @override
  String get msgInvalidNonNegativePrice => 'Use 0 or higher.';

  @override
  String get msgInvalidAdminPasswordLength => 'Use at least 4 characters.';

  @override
  String get msgInvalidPricingMatrix => 'Check pricing values before saving.';

  @override
  String get msgLocalizationFallbackSample =>
      'Pending Arabic translation fallback text.';

  @override
  String get btnRetryConnection => 'Retry Connection';

  @override
  String get btnImportGcpBackup => 'Import GCP Backup';

  @override
  String get btnRetry => 'Retry';

  @override
  String get btnCancel => 'Cancel';

  @override
  String get btnUnlock => 'Unlock';

  @override
  String get btnSaveChanges => 'Save Changes';

  @override
  String get btnTapToEditAdminSettings => 'Tap to Edit Admin Settings';

  @override
  String get btnLockAdminSettings => 'Lock Admin Settings';

  @override
  String get btnLockSystem => 'Lock System';

  @override
  String get btnPreviousPage => 'Previous';

  @override
  String get btnNextPage => 'Next';

  @override
  String get btnOk => 'OK';

  @override
  String get btnLaunchSetupWizard => 'Launch Setup Wizard';

  @override
  String get tooltipRevealPassword => 'Reveal password';

  @override
  String get tooltipHidePassword => 'Hide password';

  @override
  String get helperEnterPassword => 'Enter Password';

  @override
  String get helperMinutes => 'Minutes';

  @override
  String get helperSyp => 'SYP';

  @override
  String get chipActive => 'Active';

  @override
  String get prodSocks => 'Socks';

  @override
  String get prodWaterBottle => 'Water Bottle (0.5L)';
}
