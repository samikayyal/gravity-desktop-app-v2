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
  String get titleCashierOptions => 'خيارات الكاشير';

  @override
  String get titleAdminOperations => 'عمليات المدير';

  @override
  String get titleAdminSettingsLocked => 'إعدادات المدير مقفلة';

  @override
  String get titleAdminUnlockDialog => 'فتح إعدادات المدير';

  @override
  String get titleAdminPassword => 'كلمة مرور المدير';

  @override
  String get titleLeewayAndStaleTimers => 'فترة السماح والجلسات القديمة';

  @override
  String get titleJumpPricingMatrix => 'أسعار جلسات القفز';

  @override
  String get titleFixedBlocks => 'المدد الثابتة';

  @override
  String get titleOpenTime => 'الوقت المفتوح';

  @override
  String get titleDefaultInventoryPrices => 'أسعار المخزون الافتراضية';

  @override
  String get titleAuditEvents => 'أحداث التدقيق الأخيرة';

  @override
  String get titleSetupPasswordStep => 'إنشاء كلمة مرور المدير';

  @override
  String get titleSetupRestoreStep => 'استعادة قاعدة بيانات موجودة';

  @override
  String get titleSetupCloudStep => 'فحص إعدادات السحابة';

  @override
  String get titleSetupCatalogStep => 'كتالوج المنتجات الأولي';

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
  String get labelNotificationVolume => 'مستوى صوت التنبيهات';

  @override
  String labelPercentValue(int percent) {
    return '$percent%';
  }

  @override
  String get labelMuteOverdueAudios => 'كتم صوت تنبيهات التأخير';

  @override
  String get labelScreenScale => 'تكبير الشاشة';

  @override
  String labelScaleOption(String scale) {
    return '${scale}x';
  }

  @override
  String get labelAdminPassword => 'كلمة مرور المدير';

  @override
  String get labelConfirmAdminPassword => 'تأكيد كلمة مرور المدير';

  @override
  String get labelLeewayGracePeriod => 'فترة السماح';

  @override
  String get labelStaleThreshold => 'حد الجلسة القديمة';

  @override
  String get labelFixed30Mins => '30 دقيقة';

  @override
  String get labelFixed60Mins => '60 دقيقة';

  @override
  String get labelFixed90Mins => '90 دقيقة';

  @override
  String get labelFixed120Mins => '120 دقيقة';

  @override
  String get labelAdditional30 => 'كل 30 إضافية';

  @override
  String get labelOpenFirstHour => 'أول ساعة';

  @override
  String get labelOpenExtra30 => '30 إضافية';

  @override
  String get labelWaterBottlePrice => 'عبوة ماء';

  @override
  String get labelJumpSocksPrice => 'جوارب القفز';

  @override
  String labelPlayerProfilePlaceholder(int playerNumber) {
    return 'ملف لاعب تجريبي $playerNumber';
  }

  @override
  String labelAdminModeActive(String remainingTime) {
    return 'وضع المدير نشط - $remainingTime';
  }

  @override
  String get labelChecking => 'جار التحقق...';

  @override
  String get labelAuditTimestamp => 'الوقت';

  @override
  String get labelAuditActionType => 'نوع الإجراء';

  @override
  String get labelAuditTargetRecord => 'السجل / المعرف';

  @override
  String get labelAuditReason => 'السبب';

  @override
  String get labelAuditChangedDetails => 'تفاصيل التغيير';

  @override
  String get labelSetupStepPassword => '1. كلمة المرور';

  @override
  String get labelSetupStepRestore => '2. الاستعادة';

  @override
  String get labelSetupStepCloud => '3. إعدادات السحابة';

  @override
  String get labelSetupStepCatalog => '4. الكتالوج';

  @override
  String get labelOptional => 'اختياري';

  @override
  String get labelRestoring => 'جار الاستعادة...';

  @override
  String get labelSqliteDatabaseFile => 'قاعدة بيانات SQLite';

  @override
  String get labelEditableDefaults => 'قيم قابلة للتعديل';

  @override
  String get labelProductName => 'الاسم';

  @override
  String get labelProductSku => 'SKU';

  @override
  String get labelProductPrice => 'السعر';

  @override
  String get labelProductStock => 'المخزون';

  @override
  String labelAuditPage(int pageNumber, int totalPages) {
    return 'صفحة $pageNumber من $totalPages';
  }

  @override
  String get msgNoActiveSelectionInstructions =>
      'اختر جلسة لاعب من لوحة اللاعبين أو اختر وحدة من الشريط الجانبي لتحميل مهام الكاشير.';

  @override
  String get msgFirstRunSetupIntro =>
      'Welcome to Gravity Cashier. Initialize your local administrator password, verify backup bucket configurations, and seed the default product catalogs.';

  @override
  String get msgSetupPasswordIntro =>
      'أنشئ كلمة مرور المدير المحلية للإعداد والاستعادة وتعديل الأسعار والتصحيحات المحمية.';

  @override
  String get msgSetupRestoreIntro =>
      'يمكنك اختياريا استبدال قاعدة البيانات الجديدة بنسخة Gravity SQLite سليمة. يتحقق التطبيق من الملف وينشئ نسخة أمان محلية قبل أي استبدال.';

  @override
  String get msgRestoreSkipHint =>
      'تجاوز هذه الخطوة للتثبيت الجديد. الاستعادة مقصودة ولا تتم تلقائيا.';

  @override
  String get msgSetupCloudIntro =>
      'تقرأ قيم GCP bucket وحساب الخدمة من ملف .env غير المتتبع داخل مجلد التطبيق. هذا الفحص يتأكد فقط من وجود الإعدادات المحلية؛ يبقى النسخ السحابي غير مفعل حتى تتحقق خدمة النسخ من bucket فعليا.';

  @override
  String get msgSetupCatalogIntro =>
      'راجع صفوف المخزون الأساسية قبل فتح عمليات الكاشير. الصفوف المفعلة تنشئ المنتجات وحركات المخزون الأولية.';

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
  String get msgSettingsSaved => 'تم حفظ الإعدادات.';

  @override
  String get msgSettingsSaveFailed => 'تعذر حفظ الإعدادات.';

  @override
  String get msgSettingsLoadFailed => 'تعذر تحميل الإعدادات.';

  @override
  String get msgAdminSettingsLockedDescription =>
      'تعديل الأسعار وفترة السماح وحد الجلسات القديمة وأسعار المخزون وكلمة المرور يحتاج صلاحية المدير.';

  @override
  String get msgAdminSettingsUnlocked => 'تم فتح إعدادات المدير.';

  @override
  String get msgAdminUnlockFailed => 'كلمة مرور المدير غير صحيحة.';

  @override
  String get msgNoAuditEvents => 'لا توجد أحداث تدقيق مسجلة بعد.';

  @override
  String get msgAuditEventsLoadFailed => 'تعذر تحميل أحداث التدقيق.';

  @override
  String get msgRequiredField => 'مطلوب.';

  @override
  String get msgInvalidLeewayRange => 'استخدم من 0 إلى 60 دقيقة.';

  @override
  String msgInvalidStaleThreshold(int minimumMinutes) {
    return 'استخدم $minimumMinutes دقيقة على الأقل.';
  }

  @override
  String get msgInvalidNonNegativePrice => 'استخدم 0 أو أكثر.';

  @override
  String get msgInvalidAdminPasswordLength => 'استخدم 4 أحرف على الأقل.';

  @override
  String get msgInvalidSetupPasswordLength => 'استخدم 6 أحرف على الأقل.';

  @override
  String get msgAdminPasswordMismatch => 'يجب أن تتطابق كلمتا المرور.';

  @override
  String get msgInvalidCatalogRow =>
      'الصفوف المفعلة تحتاج اسما و SKU وسعرا ومخزونا بقيم غير سالبة.';

  @override
  String get msgDuplicateCatalogSku =>
      'يجب أن تستخدم صفوف المنتجات المفعلة رموز SKU فريدة.';

  @override
  String get msgRestoreSuccess => 'تم التحقق من الاستعادة';

  @override
  String get msgRestoreFailed =>
      'فشلت الاستعادة. بقيت قاعدة البيانات الحالية بدون تغيير.';

  @override
  String get msgCloudTestSuccess => 'تم العثور على إعدادات السحابة المحلية';

  @override
  String get msgCloudTestFailed =>
      'لم يتم العثور على إعدادات السحابة. تأكد أن ملف .env يحتوي bucket ومعاملات حساب الخدمة.';

  @override
  String get msgCloudSetupSkipped => 'تم تجاوز إعداد السحابة';

  @override
  String get msgInvalidPricingMatrix => 'راجع قيم الأسعار قبل الحفظ.';

  @override
  String get msgSetupFinishFailed => 'تعذر إكمال الإعداد.';

  @override
  String get msgLocalizationFallbackSample =>
      'Pending Arabic translation fallback text.';

  @override
  String get btnBack => 'رجوع';

  @override
  String get btnNext => 'التالي';

  @override
  String get btnFinish => 'إنهاء';

  @override
  String get btnSelectDbFile => 'اختر ملف SQLite .db';

  @override
  String get btnTestGcp => 'فحص إعدادات السحابة';

  @override
  String get btnSkipGcp => 'تجاوز إعداد السحابة';

  @override
  String get btnRetryConnection => 'إعادة المحاولة';

  @override
  String get btnImportGcpBackup => 'استيراد نسخة GCP';

  @override
  String get btnRetry => 'إعادة المحاولة';

  @override
  String get btnCancel => 'إلغاء';

  @override
  String get btnUnlock => 'فتح';

  @override
  String get btnSaveChanges => 'حفظ التغييرات';

  @override
  String get btnTapToEditAdminSettings => 'تعديل إعدادات المدير';

  @override
  String get btnLockAdminSettings => 'قفل إعدادات المدير';

  @override
  String get btnLockSystem => 'قفل النظام';

  @override
  String get btnPreviousPage => 'السابق';

  @override
  String get btnNextPage => 'التالي';

  @override
  String get btnOk => 'موافق';

  @override
  String get btnLaunchSetupWizard => 'بدء معالج الإعداد';

  @override
  String get tooltipRevealPassword => 'إظهار كلمة المرور';

  @override
  String get tooltipHidePassword => 'إخفاء كلمة المرور';

  @override
  String get helperEnterPassword => 'أدخل كلمة المرور';

  @override
  String get helperMinutes => 'دقائق';

  @override
  String get helperSyp => 'ل.س';

  @override
  String get chipActive => 'نشط';

  @override
  String get prodSocks => 'جوارب';

  @override
  String get prodWaterBottle => 'عبوة ماء 0.5 لتر';
}
