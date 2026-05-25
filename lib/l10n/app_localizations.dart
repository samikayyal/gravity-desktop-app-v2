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
