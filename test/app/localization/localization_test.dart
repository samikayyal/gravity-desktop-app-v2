import 'package:drift/drift.dart' hide isNull;
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gravity_desktop_app_v2/app/layout/split_panel_layout.dart';
import 'package:gravity_desktop_app_v2/app/localization/app_supported_locales.dart';
import 'package:gravity_desktop_app_v2/app/localization/cashier_formatters.dart';
import 'package:gravity_desktop_app_v2/app/providers.dart';
import 'package:gravity_desktop_app_v2/app/theme/app_theme.dart';
import 'package:gravity_desktop_app_v2/core/database/local_database.dart';
import 'package:gravity_desktop_app_v2/data/repositories/app_locale_repository.dart';
import 'package:gravity_desktop_app_v2/l10n/app_localizations.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Localization infrastructure', () {
    test('loads Arabic dictionary entries without raw key fallback', () async {
      final localizations = await AppLocalizations.delegate.load(
        AppSupportedLocales.arabic,
      );

      expect(
        localizations.msgLocalizationFallbackSample,
        'Pending Arabic translation fallback text.',
      );
      expect(
        localizations.msgLocalizationFallbackSample,
        isNot('msgLocalizationFallbackSample'),
      );
    });

    test('formats timer and SYP values with Western Arabic digits', () {
      final timer = CashierFormatters.formatTimer(
        const Duration(minutes: 45, seconds: 12),
      );
      final arabicCurrency = CashierFormatters.formatSyp(
        5000,
        AppSupportedLocales.arabic,
      );

      expect(timer, '00:45:12');
      expect(arabicCurrency, '5,000 ل.س');
      expect(RegExp(r'[٠-٩۰-۹]').hasMatch(timer), isFalse);
      expect(RegExp(r'[٠-٩۰-۹]').hasMatch(arabicCurrency), isFalse);
    });

    test('uses Cairo and Tajawal typography for Arabic locale', () {
      final theme = AppTheme.lightForLocale(AppSupportedLocales.arabic);

      expect(theme.textTheme.bodyMedium?.fontFamily, AppTheme.cairoFontFamily);
      expect(theme.textTheme.labelMedium?.fontFamily, AppTheme.cairoFontFamily);
      expect(
        theme.textTheme.titleLarge?.fontFamily,
        AppTheme.tajawalFontFamily,
      );
      expect(
        theme.dataTableTheme.dataTextStyle?.fontFamily,
        AppTheme.tajawalFontFamily,
      );
    });

    testWidgets('mirrors split layout and rail position for Arabic locale', (
      tester,
    ) async {
      await tester.binding.setSurfaceSize(const Size(1920, 1080));
      addTearDown(() => tester.binding.setSurfaceSize(null));

      TextDirection? capturedDirection;

      await tester.pumpWidget(
        MaterialApp(
          locale: AppSupportedLocales.arabic,
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          theme: AppTheme.lightForLocale(AppSupportedLocales.arabic),
          home: Builder(
            builder: (context) {
              capturedDirection = Directionality.of(context);
              return const SplitPanelLayout();
            },
          ),
        ),
      );
      await tester.pumpAndSettle();

      final railCenter = tester.getCenter(
        find.byKey(const Key('mainNavigationRail')),
      );

      expect(capturedDirection, TextDirection.rtl);
      expect(railCenter.dx, lessThan(200));
      expect(tester.takeException(), isNull);
    });

    testWidgets('settings language dropdown updates locale and persists it', (
      tester,
    ) async {
      await tester.binding.setSurfaceSize(const Size(1280, 800));
      addTearDown(() => tester.binding.setSurfaceSize(null));

      final database = AppDatabase.forTesting(
        DatabaseConnection(NativeDatabase.memory()),
      );
      addTearDown(database.close);

      await tester.pumpWidget(
        ProviderScope(
          overrides: [databaseProvider.overrideWithValue(database)],
          child: const _LocaleHarness(),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text('Settings'));
      await tester.pumpAndSettle();

      expect(find.text('Language'), findsOneWidget);

      await tester.tap(find.byType(DropdownButtonFormField<Locale>));
      await tester.pumpAndSettle();
      await tester.tap(find.text('العربية (Syria)').last);
      await tester.pumpAndSettle();

      expect(find.text('الإعدادات'), findsWidgets);
      expect(await AppLocaleRepository(database).loadLocaleCode(), 'ar');
      expect(tester.takeException(), isNull);
    });
  });
}

class _LocaleHarness extends ConsumerWidget {
  const _LocaleHarness();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale =
        ref.watch(appLocaleControllerProvider).valueOrNull ??
        AppSupportedLocales.defaultLocale;

    return MaterialApp(
      locale: locale,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      theme: AppTheme.lightForLocale(locale),
      home: const SplitPanelLayout(),
    );
  }
}
