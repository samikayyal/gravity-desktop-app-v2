import 'package:drift/drift.dart' hide isNotNull, isNull;
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gravity_desktop_app_v2/app/localization/app_supported_locales.dart';
import 'package:gravity_desktop_app_v2/app/providers.dart';
import 'package:gravity_desktop_app_v2/app/theme/app_theme.dart';
import 'package:gravity_desktop_app_v2/core/database/local_database.dart';
import 'package:gravity_desktop_app_v2/features/setup/presentation/setup_notifier.dart';
import 'package:gravity_desktop_app_v2/features/setup/presentation/setup_wizard_screen.dart';
import 'package:gravity_desktop_app_v2/l10n/app_localizations.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late AppDatabase database;

  setUp(() {
    database = AppDatabase.forTesting(
      DatabaseConnection(NativeDatabase.memory()),
    );
  });

  tearDown(() async {
    await database.close();
  });

  Widget buildHarness() {
    return ProviderScope(
      overrides: [
        databaseProvider.overrideWithValue(database),
        gcpSetupProbeProvider.overrideWithValue(() async => false),
      ],
      child: MaterialApp(
        locale: AppSupportedLocales.english,
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        theme: AppTheme.light,
        home: const SetupWizardScreen(),
      ),
    );
  }

  Finder editableTextByFieldKey(String key) {
    return find.descendant(
      of: find.byKey(Key(key)),
      matching: find.byType(EditableText),
    );
  }

  testWidgets('password next button stays disabled until valid inputs match', (
    tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(1200, 900));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(buildHarness());
    await tester.pumpAndSettle();

    FilledButton nextButton() {
      return tester.widget<FilledButton>(
        find.widgetWithText(FilledButton, 'Next'),
      );
    }

    expect(nextButton().onPressed, isNull);

    await tester.enterText(
      editableTextByFieldKey('setup.adminPassword'),
      'AdminGravity',
    );
    await tester.enterText(
      editableTextByFieldKey('setup.confirmPassword'),
      'nope',
    );
    await tester.pump();
    expect(nextButton().onPressed, isNull);

    await tester.enterText(
      editableTextByFieldKey('setup.confirmPassword'),
      'AdminGravity',
    );
    await tester.pump();
    expect(nextButton().onPressed, isNotNull);

    await tester.tap(find.widgetWithText(FilledButton, 'Next'));
    await tester.pumpAndSettle();
    expect(find.text('Restore Existing Database'), findsOneWidget);
  });

  testWidgets('skip cloud setup moves directly to catalog step', (
    tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(1200, 900));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(buildHarness());
    await tester.pumpAndSettle();

    await tester.enterText(
      editableTextByFieldKey('setup.adminPassword'),
      'AdminGravity',
    );
    await tester.enterText(
      editableTextByFieldKey('setup.confirmPassword'),
      'AdminGravity',
    );
    await tester.pump();
    await tester.tap(find.widgetWithText(FilledButton, 'Next'));
    await tester.pumpAndSettle();
    expect(find.text('Restore Existing Database'), findsOneWidget);
    await tester.tap(find.widgetWithText(FilledButton, 'Next'));
    await tester.pumpAndSettle();

    expect(find.text('Cloud Config Check'), findsOneWidget);
    await tester.tap(find.widgetWithText(FilledButton, 'Skip Cloud Setup'));
    await tester.pumpAndSettle();

    expect(find.text('Initial Product Catalog'), findsOneWidget);
    expect(find.text('Grippy Socks'), findsOneWidget);
    expect(find.text('Bottled Water'), findsOneWidget);
  });
}
