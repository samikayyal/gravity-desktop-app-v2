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
  String labelPlayerProfilePlaceholder(int playerNumber) {
    return 'Player Profile Placeholder $playerNumber';
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
  String get msgLocalizationFallbackSample =>
      'Pending Arabic translation fallback text.';

  @override
  String get btnRetryConnection => 'Retry Connection';

  @override
  String get btnImportGcpBackup => 'Import GCP Backup';

  @override
  String get btnOk => 'OK';

  @override
  String get btnLaunchSetupWizard => 'Launch Setup Wizard';

  @override
  String get chipActive => 'Active';

  @override
  String get prodSocks => 'Socks';

  @override
  String get prodWaterBottle => 'Water Bottle (0.5L)';
}
