import 'package:drift/drift.dart' hide isNull;
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gravity_desktop_app_v2/app/localization/app_supported_locales.dart';
import 'package:gravity_desktop_app_v2/app/layout/split_panel_layout.dart';
import 'package:gravity_desktop_app_v2/app/providers.dart';
import 'package:gravity_desktop_app_v2/app/theme/app_theme.dart';
import 'package:gravity_desktop_app_v2/core/database/local_database.dart';
import 'package:gravity_desktop_app_v2/l10n/app_localizations.dart';

void main() {
  Widget buildTestableWidget() {
    return MaterialApp(
      theme: AppTheme.light,
      locale: AppSupportedLocales.english,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      home: const SplitPanelLayout(),
    );
  }

  group('SplitPanelLayout Desktop Sizing Tests', () {
    testWidgets(
      'Verify both Left and Right split panels are visible at 1920x1080',
      (WidgetTester tester) async {
        // 1. Arrange - set standard 1080p desktop display size
        await tester.binding.setSurfaceSize(const Size(1920, 1080));

        // 2. Act - render screen layout
        await tester.pumpWidget(buildTestableWidget());

        // 3. Assert - check both left Active Board and right Action Panel header exist
        expect(find.text('Active Board'), findsOneWidget);
        expect(find.text('Action Panel'), findsOneWidget);
        expect(find.text('No Active Selection'), findsOneWidget);

        // Verify that left sidebar navigation buttons are visible
        expect(find.text('Board'), findsOneWidget);
        expect(find.text('Players'), findsOneWidget);
      },
    );

    testWidgets(
      'Verify split layout scales down to 1024x768 minimum constraint without overflow exceptions',
      (WidgetTester tester) async {
        // 1. Arrange - set simulated minimum size
        await tester.binding.setSurfaceSize(const Size(1024, 768));

        // 2. Act - render layout
        await tester.pumpWidget(buildTestableWidget());
        await tester.pumpAndSettle();

        // 3. Assert - check both panels are still visible
        expect(find.text('Active Board'), findsOneWidget);
        expect(find.text('Action Panel'), findsOneWidget);

        // Ensure no debug overflow warning was rendered in this frame
        expect(tester.takeException(), isNull);
      },
    );

    testWidgets('fades between action and settings right-panel modes', (
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
          child: buildTestableWidget(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Action Panel'), findsOneWidget);

      await tester.tap(find.text('Settings'));
      await tester.pump();

      expect(find.text('Action Panel'), findsOneWidget);
      expect(find.text('Settings'), findsWidgets);

      await tester.pumpAndSettle();

      expect(find.text('Action Panel'), findsNothing);
      expect(find.text('Settings'), findsWidgets);
      expect(tester.takeException(), isNull);
    });
  });
}
