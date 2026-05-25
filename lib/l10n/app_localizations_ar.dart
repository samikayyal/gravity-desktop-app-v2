// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get titleApp => 'Gravity Cashier Desk';

  @override
  String get titleActiveBoard => 'لوحة اللاعبين';

  @override
  String get titleActionPanel => 'لوحة الإجراءات';

  @override
  String get titleSettings => 'الإعدادات';

  @override
  String get titleNoActiveSelection => 'لا يوجد تحديد نشط';

  @override
  String get titleFirstRunSetupWizard => 'معالج الإعداد الأول';

  @override
  String get titleDatabaseRescueConsole => 'وحدة إنقاذ قاعدة البيانات';

  @override
  String get titleCriticalDatabaseStartupFailure =>
      'فشل حرج في تشغيل قاعدة البيانات';

  @override
  String get titleManualRestoreGuide => 'دليل الاستعادة اليدوية';

  @override
  String get labelBoard => 'اللوحة';

  @override
  String get labelPlayers => 'اللاعبون';

  @override
  String get labelProducts => 'المنتجات';

  @override
  String get labelInventory => 'المخزون';

  @override
  String get labelReports => 'التقارير';

  @override
  String get labelSettings => 'الإعدادات';

  @override
  String get labelLanguage => 'اللغة';

  @override
  String get labelEnglishUs => 'English (US)';

  @override
  String get labelArabicSyria => 'العربية (سوريا)';

  @override
  String get labelErrorDetails => 'تفاصيل الخطأ:';

  @override
  String get labelDatabaseFileLocation => 'موقع ملف قاعدة البيانات:';

  @override
  String get labelCopyFilePath => 'نسخ مسار الملف';

  @override
  String labelPlayerProfilePlaceholder(int playerNumber) {
    return 'ملف لاعب تجريبي $playerNumber';
  }

  @override
  String get msgNoActiveSelectionInstructions =>
      'اختر جلسة لاعب من لوحة اللاعبين أو اختر وحدة من الشريط الجانبي لتحميل مهام الكاشير.';

  @override
  String get msgFirstRunSetupIntro =>
      'Welcome to Gravity Cashier. Initialize your local administrator password, verify backup bucket configurations, and seed the default product catalogs.';

  @override
  String get msgDatabaseStartupFailure =>
      'تعذر تشغيل قاعدة بيانات SQLite المحلية. يحدث هذا عادة بسبب تلف الملف أو قفل الملف أو صلاحيات كتابة غير صحيحة.';

  @override
  String get msgManualRestoreGuide =>
      'GCP Cloud Backup Restoration tool will be fully integrated in a later backup and restore feature.\n\nTo recover your data for now, copy your backup file over the corrupted local file shown above.';

  @override
  String get msgDatabasePathCopied => 'تم نسخ مسار قاعدة البيانات.';

  @override
  String get msgKeepCorruptedDatabaseCopy =>
      'تلميح: احتفظ بنسخة من ملف قاعدة البيانات التالف قبل محاولة الاستعادة.';

  @override
  String msgSessionSummary(int durationMinutes, String checkInTime) {
    return 'المدة: $durationMinutes دقيقة | الدخول: $checkInTime';
  }

  @override
  String get msgLanguageUpdated => 'تم تحديث اللغة.';

  @override
  String get msgLanguageUpdateFailed => 'تعذر تحديث اللغة.';

  @override
  String get msgLocalizationFallbackSample =>
      'Pending Arabic translation fallback text.';

  @override
  String get btnRetryConnection => 'إعادة المحاولة';

  @override
  String get btnImportGcpBackup => 'استيراد نسخة GCP';

  @override
  String get btnOk => 'موافق';

  @override
  String get btnLaunchSetupWizard => 'بدء معالج الإعداد';

  @override
  String get chipActive => 'نشط';

  @override
  String get prodSocks => 'جوارب';

  @override
  String get prodWaterBottle => 'عبوة ماء 0.5 لتر';
}
