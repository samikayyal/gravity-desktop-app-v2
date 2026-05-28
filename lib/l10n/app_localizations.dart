import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @titleApp.
  ///
  /// In en, this message translates to:
  /// **'Gravity Cashier Desk'**
  String get titleApp;

  /// No description provided for @titleActiveBoard.
  ///
  /// In en, this message translates to:
  /// **'Active Board'**
  String get titleActiveBoard;

  /// No description provided for @titleActionPanel.
  ///
  /// In en, this message translates to:
  /// **'Action Panel'**
  String get titleActionPanel;

  /// No description provided for @titleSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get titleSettings;

  /// No description provided for @titleNoActiveSelection.
  ///
  /// In en, this message translates to:
  /// **'No Active Selection'**
  String get titleNoActiveSelection;

  /// No description provided for @titleFirstRunSetupWizard.
  ///
  /// In en, this message translates to:
  /// **'First-Run Setup Wizard'**
  String get titleFirstRunSetupWizard;

  /// No description provided for @titleDatabaseRescueConsole.
  ///
  /// In en, this message translates to:
  /// **'Database Rescue Console'**
  String get titleDatabaseRescueConsole;

  /// No description provided for @titleCriticalDatabaseStartupFailure.
  ///
  /// In en, this message translates to:
  /// **'Critical Database Startup Failure'**
  String get titleCriticalDatabaseStartupFailure;

  /// No description provided for @titleManualRestoreGuide.
  ///
  /// In en, this message translates to:
  /// **'Manual Restore Guide'**
  String get titleManualRestoreGuide;

  /// No description provided for @titleCashierOptions.
  ///
  /// In en, this message translates to:
  /// **'Cashier Options'**
  String get titleCashierOptions;

  /// No description provided for @titleAdminOperations.
  ///
  /// In en, this message translates to:
  /// **'Admin Operations'**
  String get titleAdminOperations;

  /// No description provided for @titleAdminSettingsLocked.
  ///
  /// In en, this message translates to:
  /// **'Admin Settings Locked'**
  String get titleAdminSettingsLocked;

  /// No description provided for @titleAdminUnlockDialog.
  ///
  /// In en, this message translates to:
  /// **'Unlock Admin Settings'**
  String get titleAdminUnlockDialog;

  /// No description provided for @titleAdminPassword.
  ///
  /// In en, this message translates to:
  /// **'Admin Password'**
  String get titleAdminPassword;

  /// No description provided for @titleLeewayAndStaleTimers.
  ///
  /// In en, this message translates to:
  /// **'Leeway & Stale Timers'**
  String get titleLeewayAndStaleTimers;

  /// No description provided for @titleJumpPricingMatrix.
  ///
  /// In en, this message translates to:
  /// **'Jump Sessions Pricing Matrix'**
  String get titleJumpPricingMatrix;

  /// No description provided for @titleFixedBlocks.
  ///
  /// In en, this message translates to:
  /// **'Fixed Blocks'**
  String get titleFixedBlocks;

  /// No description provided for @titleOpenTime.
  ///
  /// In en, this message translates to:
  /// **'Open Time'**
  String get titleOpenTime;

  /// No description provided for @titleDefaultInventoryPrices.
  ///
  /// In en, this message translates to:
  /// **'Default Inventory Prices'**
  String get titleDefaultInventoryPrices;

  /// No description provided for @titleAuditEvents.
  ///
  /// In en, this message translates to:
  /// **'Recent Audit Events'**
  String get titleAuditEvents;

  /// No description provided for @titleSetupPasswordStep.
  ///
  /// In en, this message translates to:
  /// **'Create Administrator Password'**
  String get titleSetupPasswordStep;

  /// No description provided for @titleSetupRestoreStep.
  ///
  /// In en, this message translates to:
  /// **'Restore Existing Database'**
  String get titleSetupRestoreStep;

  /// No description provided for @titleSetupCloudStep.
  ///
  /// In en, this message translates to:
  /// **'Cloud Config Check'**
  String get titleSetupCloudStep;

  /// No description provided for @titleSetupCatalogStep.
  ///
  /// In en, this message translates to:
  /// **'Initial Product Catalog'**
  String get titleSetupCatalogStep;

  /// No description provided for @labelBoard.
  ///
  /// In en, this message translates to:
  /// **'Board'**
  String get labelBoard;

  /// No description provided for @labelPlayers.
  ///
  /// In en, this message translates to:
  /// **'Players'**
  String get labelPlayers;

  /// No description provided for @labelProducts.
  ///
  /// In en, this message translates to:
  /// **'Products'**
  String get labelProducts;

  /// No description provided for @labelInventory.
  ///
  /// In en, this message translates to:
  /// **'Inventory'**
  String get labelInventory;

  /// No description provided for @labelReports.
  ///
  /// In en, this message translates to:
  /// **'Reports'**
  String get labelReports;

  /// No description provided for @labelSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get labelSettings;

  /// No description provided for @labelLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get labelLanguage;

  /// No description provided for @labelEnglishUs.
  ///
  /// In en, this message translates to:
  /// **'English (US)'**
  String get labelEnglishUs;

  /// No description provided for @labelArabicSyria.
  ///
  /// In en, this message translates to:
  /// **'العربية (Syria)'**
  String get labelArabicSyria;

  /// No description provided for @labelErrorDetails.
  ///
  /// In en, this message translates to:
  /// **'Error Details:'**
  String get labelErrorDetails;

  /// No description provided for @labelDatabaseFileLocation.
  ///
  /// In en, this message translates to:
  /// **'Database File Location:'**
  String get labelDatabaseFileLocation;

  /// No description provided for @labelCopyFilePath.
  ///
  /// In en, this message translates to:
  /// **'Copy File Path'**
  String get labelCopyFilePath;

  /// No description provided for @labelNotificationVolume.
  ///
  /// In en, this message translates to:
  /// **'Notification Volume'**
  String get labelNotificationVolume;

  /// No description provided for @labelPercentValue.
  ///
  /// In en, this message translates to:
  /// **'{percent}%'**
  String labelPercentValue(int percent);

  /// No description provided for @labelMuteOverdueAudios.
  ///
  /// In en, this message translates to:
  /// **'Mute overdue audios'**
  String get labelMuteOverdueAudios;

  /// No description provided for @labelScreenScale.
  ///
  /// In en, this message translates to:
  /// **'Screen scaling'**
  String get labelScreenScale;

  /// No description provided for @labelScaleOption.
  ///
  /// In en, this message translates to:
  /// **'{scale}x'**
  String labelScaleOption(String scale);

  /// No description provided for @labelAdminPassword.
  ///
  /// In en, this message translates to:
  /// **'Admin password'**
  String get labelAdminPassword;

  /// No description provided for @labelConfirmAdminPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm admin password'**
  String get labelConfirmAdminPassword;

  /// No description provided for @labelLeewayGracePeriod.
  ///
  /// In en, this message translates to:
  /// **'Leeway grace period'**
  String get labelLeewayGracePeriod;

  /// No description provided for @labelStaleThreshold.
  ///
  /// In en, this message translates to:
  /// **'Stale threshold'**
  String get labelStaleThreshold;

  /// No description provided for @labelFixed30Mins.
  ///
  /// In en, this message translates to:
  /// **'30 mins'**
  String get labelFixed30Mins;

  /// No description provided for @labelFixed60Mins.
  ///
  /// In en, this message translates to:
  /// **'60 mins'**
  String get labelFixed60Mins;

  /// No description provided for @labelFixed90Mins.
  ///
  /// In en, this message translates to:
  /// **'90 mins'**
  String get labelFixed90Mins;

  /// No description provided for @labelFixed120Mins.
  ///
  /// In en, this message translates to:
  /// **'120 mins'**
  String get labelFixed120Mins;

  /// No description provided for @labelAdditional30.
  ///
  /// In en, this message translates to:
  /// **'Additional 30'**
  String get labelAdditional30;

  /// No description provided for @labelOpenFirstHour.
  ///
  /// In en, this message translates to:
  /// **'First hour'**
  String get labelOpenFirstHour;

  /// No description provided for @labelOpenExtra30.
  ///
  /// In en, this message translates to:
  /// **'Extra 30'**
  String get labelOpenExtra30;

  /// No description provided for @labelWaterBottlePrice.
  ///
  /// In en, this message translates to:
  /// **'Water bottle'**
  String get labelWaterBottlePrice;

  /// No description provided for @labelJumpSocksPrice.
  ///
  /// In en, this message translates to:
  /// **'Jump socks'**
  String get labelJumpSocksPrice;

  /// No description provided for @labelPlayerProfilePlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Player Profile Placeholder {playerNumber}'**
  String labelPlayerProfilePlaceholder(int playerNumber);

  /// No description provided for @labelAdminModeActive.
  ///
  /// In en, this message translates to:
  /// **'Admin Mode Active - {remainingTime}'**
  String labelAdminModeActive(String remainingTime);

  /// No description provided for @labelChecking.
  ///
  /// In en, this message translates to:
  /// **'Checking...'**
  String get labelChecking;

  /// No description provided for @labelAuditTimestamp.
  ///
  /// In en, this message translates to:
  /// **'Timestamp'**
  String get labelAuditTimestamp;

  /// No description provided for @labelAuditActionType.
  ///
  /// In en, this message translates to:
  /// **'Action Type'**
  String get labelAuditActionType;

  /// No description provided for @labelAuditTargetRecord.
  ///
  /// In en, this message translates to:
  /// **'Targeted Record / ID'**
  String get labelAuditTargetRecord;

  /// No description provided for @labelAuditReason.
  ///
  /// In en, this message translates to:
  /// **'Reason'**
  String get labelAuditReason;

  /// No description provided for @labelAuditChangedDetails.
  ///
  /// In en, this message translates to:
  /// **'Changed Details'**
  String get labelAuditChangedDetails;

  /// No description provided for @labelSetupStepPassword.
  ///
  /// In en, this message translates to:
  /// **'1. Password'**
  String get labelSetupStepPassword;

  /// No description provided for @labelSetupStepRestore.
  ///
  /// In en, this message translates to:
  /// **'2. Restore'**
  String get labelSetupStepRestore;

  /// No description provided for @labelSetupStepCloud.
  ///
  /// In en, this message translates to:
  /// **'3. Cloud Config'**
  String get labelSetupStepCloud;

  /// No description provided for @labelSetupStepCatalog.
  ///
  /// In en, this message translates to:
  /// **'4. Catalog'**
  String get labelSetupStepCatalog;

  /// No description provided for @labelOptional.
  ///
  /// In en, this message translates to:
  /// **'Optional'**
  String get labelOptional;

  /// No description provided for @labelRestoring.
  ///
  /// In en, this message translates to:
  /// **'Restoring...'**
  String get labelRestoring;

  /// No description provided for @labelSqliteDatabaseFile.
  ///
  /// In en, this message translates to:
  /// **'SQLite database'**
  String get labelSqliteDatabaseFile;

  /// No description provided for @labelEditableDefaults.
  ///
  /// In en, this message translates to:
  /// **'Editable defaults'**
  String get labelEditableDefaults;

  /// No description provided for @labelProductName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get labelProductName;

  /// No description provided for @labelProductSku.
  ///
  /// In en, this message translates to:
  /// **'SKU'**
  String get labelProductSku;

  /// No description provided for @labelProductPrice.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get labelProductPrice;

  /// No description provided for @labelProductStock.
  ///
  /// In en, this message translates to:
  /// **'Stock'**
  String get labelProductStock;

  /// No description provided for @labelAuditPage.
  ///
  /// In en, this message translates to:
  /// **'Page {pageNumber} of {totalPages}'**
  String labelAuditPage(int pageNumber, int totalPages);

  /// No description provided for @msgNoActiveSelectionInstructions.
  ///
  /// In en, this message translates to:
  /// **'Select a player session from the Active Board or select a sidebar module to load cashier tasks.'**
  String get msgNoActiveSelectionInstructions;

  /// No description provided for @msgFirstRunSetupIntro.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Gravity Cashier. Initialize your local administrator password, check local backup configuration, and seed the default product catalogs.'**
  String get msgFirstRunSetupIntro;

  /// No description provided for @msgSetupPasswordIntro.
  ///
  /// In en, this message translates to:
  /// **'Create the local admin password used for protected setup, restore, price, and correction actions.'**
  String get msgSetupPasswordIntro;

  /// No description provided for @msgSetupRestoreIntro.
  ///
  /// In en, this message translates to:
  /// **'Optionally replace this fresh database with a known-good Gravity SQLite backup. The app verifies the file and creates a local safety copy before replacing anything.'**
  String get msgSetupRestoreIntro;

  /// No description provided for @msgRestoreSkipHint.
  ///
  /// In en, this message translates to:
  /// **'Skip this step for a new installation. Restores are intentional and never automatic.'**
  String get msgRestoreSkipHint;

  /// No description provided for @msgSetupCloudIntro.
  ///
  /// In en, this message translates to:
  /// **'GCP bucket and service-account values are read from the gitignored .env file in the app directory. This setup check only confirms that local configuration is present; cloud backup stays disabled until the backup service performs a real bucket verification.'**
  String get msgSetupCloudIntro;

  /// No description provided for @msgSetupCatalogIntro.
  ///
  /// In en, this message translates to:
  /// **'Review the baseline stock rows before opening cashier operations. Enabled rows seed products and their initial stock ledger movements.'**
  String get msgSetupCatalogIntro;

  /// No description provided for @msgDatabaseStartupFailure.
  ///
  /// In en, this message translates to:
  /// **'The local SQLite database failed to initialize. This error usually occurs due to file corruption, file locking, or incorrect folder write permissions.'**
  String get msgDatabaseStartupFailure;

  /// No description provided for @msgManualRestoreGuide.
  ///
  /// In en, this message translates to:
  /// **'GCP Cloud Backup Restoration tool will be fully integrated in a later backup and restore feature.\n\nTo recover your data for now, copy your backup file over the corrupted local file shown above.'**
  String get msgManualRestoreGuide;

  /// No description provided for @msgDatabasePathCopied.
  ///
  /// In en, this message translates to:
  /// **'Database path copied to clipboard.'**
  String get msgDatabasePathCopied;

  /// No description provided for @msgKeepCorruptedDatabaseCopy.
  ///
  /// In en, this message translates to:
  /// **'TIP: Keep a copy of this corrupted database file before attempting recovery.'**
  String get msgKeepCorruptedDatabaseCopy;

  /// No description provided for @msgSessionSummary.
  ///
  /// In en, this message translates to:
  /// **'Duration: {durationMinutes} min | Check-in: {checkInTime}'**
  String msgSessionSummary(int durationMinutes, String checkInTime);

  /// No description provided for @msgLanguageUpdated.
  ///
  /// In en, this message translates to:
  /// **'Language updated.'**
  String get msgLanguageUpdated;

  /// No description provided for @msgLanguageUpdateFailed.
  ///
  /// In en, this message translates to:
  /// **'Language could not be updated.'**
  String get msgLanguageUpdateFailed;

  /// No description provided for @msgSettingsSaved.
  ///
  /// In en, this message translates to:
  /// **'Settings saved.'**
  String get msgSettingsSaved;

  /// No description provided for @msgSettingsSaveFailed.
  ///
  /// In en, this message translates to:
  /// **'Settings could not be saved.'**
  String get msgSettingsSaveFailed;

  /// No description provided for @msgSettingsLoadFailed.
  ///
  /// In en, this message translates to:
  /// **'Settings could not be loaded.'**
  String get msgSettingsLoadFailed;

  /// No description provided for @msgAdminSettingsLockedDescription.
  ///
  /// In en, this message translates to:
  /// **'Protected pricing, leeway, stale-session, inventory price, and password settings require admin authorization.'**
  String get msgAdminSettingsLockedDescription;

  /// No description provided for @msgAdminSettingsUnlocked.
  ///
  /// In en, this message translates to:
  /// **'Admin settings unlocked.'**
  String get msgAdminSettingsUnlocked;

  /// No description provided for @msgAdminUnlockFailed.
  ///
  /// In en, this message translates to:
  /// **'Admin password did not match.'**
  String get msgAdminUnlockFailed;

  /// No description provided for @msgNoAuditEvents.
  ///
  /// In en, this message translates to:
  /// **'No audit events recorded yet.'**
  String get msgNoAuditEvents;

  /// No description provided for @msgAuditEventsLoadFailed.
  ///
  /// In en, this message translates to:
  /// **'Audit events could not be loaded.'**
  String get msgAuditEventsLoadFailed;

  /// No description provided for @msgRequiredField.
  ///
  /// In en, this message translates to:
  /// **'Required.'**
  String get msgRequiredField;

  /// No description provided for @msgInvalidLeewayRange.
  ///
  /// In en, this message translates to:
  /// **'Use 0 to 60 minutes.'**
  String get msgInvalidLeewayRange;

  /// No description provided for @msgInvalidStaleThreshold.
  ///
  /// In en, this message translates to:
  /// **'Use at least {minimumMinutes} minutes.'**
  String msgInvalidStaleThreshold(int minimumMinutes);

  /// No description provided for @msgInvalidNonNegativePrice.
  ///
  /// In en, this message translates to:
  /// **'Use 0 or higher.'**
  String get msgInvalidNonNegativePrice;

  /// No description provided for @msgInvalidAdminPasswordLength.
  ///
  /// In en, this message translates to:
  /// **'Use at least 4 characters.'**
  String get msgInvalidAdminPasswordLength;

  /// No description provided for @msgInvalidSetupPasswordLength.
  ///
  /// In en, this message translates to:
  /// **'Use at least 6 characters.'**
  String get msgInvalidSetupPasswordLength;

  /// No description provided for @msgAdminPasswordMismatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords must match.'**
  String get msgAdminPasswordMismatch;

  /// No description provided for @msgInvalidCatalogRow.
  ///
  /// In en, this message translates to:
  /// **'Enabled rows need a name, SKU, non-negative price, and non-negative stock.'**
  String get msgInvalidCatalogRow;

  /// No description provided for @msgDuplicateCatalogSku.
  ///
  /// In en, this message translates to:
  /// **'Enabled product rows must use unique SKUs.'**
  String get msgDuplicateCatalogSku;

  /// No description provided for @msgRestoreSuccess.
  ///
  /// In en, this message translates to:
  /// **'Restore verified'**
  String get msgRestoreSuccess;

  /// No description provided for @msgRestoreFailed.
  ///
  /// In en, this message translates to:
  /// **'Restore failed. The active database was left unchanged.'**
  String get msgRestoreFailed;

  /// No description provided for @msgCloudTestSuccess.
  ///
  /// In en, this message translates to:
  /// **'Local cloud config found'**
  String get msgCloudTestSuccess;

  /// No description provided for @msgCloudTestFailed.
  ///
  /// In en, this message translates to:
  /// **'Cloud config was not detected. Make sure your .env file contains GCP bucket and service-account parameters.'**
  String get msgCloudTestFailed;

  /// No description provided for @msgCloudSetupSkipped.
  ///
  /// In en, this message translates to:
  /// **'Cloud setup skipped'**
  String get msgCloudSetupSkipped;

  /// No description provided for @msgInvalidPricingMatrix.
  ///
  /// In en, this message translates to:
  /// **'Check pricing values before saving.'**
  String get msgInvalidPricingMatrix;

  /// No description provided for @msgSetupFinishFailed.
  ///
  /// In en, this message translates to:
  /// **'Setup could not be completed.'**
  String get msgSetupFinishFailed;

  /// No description provided for @msgLocalizationFallbackSample.
  ///
  /// In en, this message translates to:
  /// **'Pending Arabic translation fallback text.'**
  String get msgLocalizationFallbackSample;

  /// No description provided for @btnBack.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get btnBack;

  /// No description provided for @btnNext.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get btnNext;

  /// No description provided for @btnFinish.
  ///
  /// In en, this message translates to:
  /// **'Finish'**
  String get btnFinish;

  /// No description provided for @btnSelectDbFile.
  ///
  /// In en, this message translates to:
  /// **'Choose SQLite .db File'**
  String get btnSelectDbFile;

  /// No description provided for @btnTestGcp.
  ///
  /// In en, this message translates to:
  /// **'Check Cloud Config'**
  String get btnTestGcp;

  /// No description provided for @btnSkipGcp.
  ///
  /// In en, this message translates to:
  /// **'Skip Cloud Setup'**
  String get btnSkipGcp;

  /// No description provided for @btnRetryConnection.
  ///
  /// In en, this message translates to:
  /// **'Retry Connection'**
  String get btnRetryConnection;

  /// No description provided for @btnImportGcpBackup.
  ///
  /// In en, this message translates to:
  /// **'Import GCP Backup'**
  String get btnImportGcpBackup;

  /// No description provided for @btnRetry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get btnRetry;

  /// No description provided for @btnCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get btnCancel;

  /// No description provided for @btnUnlock.
  ///
  /// In en, this message translates to:
  /// **'Unlock'**
  String get btnUnlock;

  /// No description provided for @btnSaveChanges.
  ///
  /// In en, this message translates to:
  /// **'Save Changes'**
  String get btnSaveChanges;

  /// No description provided for @btnTapToEditAdminSettings.
  ///
  /// In en, this message translates to:
  /// **'Tap to Edit Admin Settings'**
  String get btnTapToEditAdminSettings;

  /// No description provided for @btnLockAdminSettings.
  ///
  /// In en, this message translates to:
  /// **'Lock Admin Settings'**
  String get btnLockAdminSettings;

  /// No description provided for @btnLockSystem.
  ///
  /// In en, this message translates to:
  /// **'Lock System'**
  String get btnLockSystem;

  /// No description provided for @btnPreviousPage.
  ///
  /// In en, this message translates to:
  /// **'Previous'**
  String get btnPreviousPage;

  /// No description provided for @btnNextPage.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get btnNextPage;

  /// No description provided for @btnOk.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get btnOk;

  /// No description provided for @btnLaunchSetupWizard.
  ///
  /// In en, this message translates to:
  /// **'Launch Setup Wizard'**
  String get btnLaunchSetupWizard;

  /// No description provided for @tooltipRevealPassword.
  ///
  /// In en, this message translates to:
  /// **'Reveal password'**
  String get tooltipRevealPassword;

  /// No description provided for @tooltipHidePassword.
  ///
  /// In en, this message translates to:
  /// **'Hide password'**
  String get tooltipHidePassword;

  /// No description provided for @helperEnterPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter Password'**
  String get helperEnterPassword;

  /// No description provided for @helperMinutes.
  ///
  /// In en, this message translates to:
  /// **'Minutes'**
  String get helperMinutes;

  /// No description provided for @helperSyp.
  ///
  /// In en, this message translates to:
  /// **'SYP'**
  String get helperSyp;

  /// No description provided for @chipActive.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get chipActive;

  /// No description provided for @prodSocks.
  ///
  /// In en, this message translates to:
  /// **'Socks'**
  String get prodSocks;

  /// No description provided for @prodWaterBottle.
  ///
  /// In en, this message translates to:
  /// **'Water Bottle (0.5L)'**
  String get prodWaterBottle;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
