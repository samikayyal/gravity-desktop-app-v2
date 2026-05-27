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

  /// No description provided for @msgNoActiveSelectionInstructions.
  ///
  /// In en, this message translates to:
  /// **'Select a player session from the Active Board or select a sidebar module to load cashier tasks.'**
  String get msgNoActiveSelectionInstructions;

  /// No description provided for @msgFirstRunSetupIntro.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Gravity Cashier. Initialize your local administrator password, verify backup bucket configurations, and seed the default product catalogs.'**
  String get msgFirstRunSetupIntro;

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

  /// No description provided for @msgInvalidPricingMatrix.
  ///
  /// In en, this message translates to:
  /// **'Check pricing values before saving.'**
  String get msgInvalidPricingMatrix;

  /// No description provided for @msgLocalizationFallbackSample.
  ///
  /// In en, this message translates to:
  /// **'Pending Arabic translation fallback text.'**
  String get msgLocalizationFallbackSample;

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
