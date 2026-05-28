import 'package:drift/drift.dart' hide isNull;
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gravity_desktop_app_v2/app/localization/app_supported_locales.dart';
import 'package:gravity_desktop_app_v2/app/providers.dart';
import 'package:gravity_desktop_app_v2/app/theme/app_theme.dart';
import 'package:gravity_desktop_app_v2/core/config/app_settings.dart';
import 'package:gravity_desktop_app_v2/core/database/local_database.dart';
import 'package:gravity_desktop_app_v2/features/settings/presentation/settings_screen.dart';
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
      overrides: [databaseProvider.overrideWithValue(database)],
      child: MaterialApp(
        locale: AppSupportedLocales.english,
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        theme: AppTheme.light,
        home: const Scaffold(body: SizedBox.expand(child: SettingsScreen())),
      ),
    );
  }

  Finder editableTextByFieldKey(String key) {
    return find.descendant(
      of: find.byKey(Key(key)),
      matching: find.byType(EditableText),
    );
  }

  testWidgets('unlocks admin settings, saves edits, and audits changes', (
    tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(1000, 1400));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(buildHarness());
    await tester.pumpAndSettle();

    expect(find.text('Cashier Options'), findsWidgets);
    expect(find.text('Notification Volume'), findsOneWidget);

    await tester.tap(find.text('Admin Operations'));
    await tester.pumpAndSettle();

    expect(find.text('Admin Settings Locked'), findsOneWidget);

    await tester.tap(find.text('Tap to Edit Admin Settings'));
    await tester.pumpAndSettle();

    await tester.enterText(
      editableTextByFieldKey('settings.adminUnlockPassword'),
      'admin123',
    );
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();

    expect(find.text('Leeway & Stale Timers'), findsOneWidget);
    expect(find.textContaining('Admin Mode Active -'), findsOneWidget);
    expect(find.text('Lock System'), findsOneWidget);
    expect(find.text('Recent Audit Events'), findsOneWidget);
    expect(find.text('No audit events recorded yet.'), findsOneWidget);
    await tester.pump(const Duration(seconds: 4));

    await tester.enterText(
      editableTextByFieldKey('settings.leewayMinutes'),
      '12',
    );
    await tester.enterText(
      editableTextByFieldKey('settings.fixed60Mins'),
      '19000',
    );

    await tester.ensureVisible(find.text('Save Changes'));
    await tester.drag(find.byType(ListView), const Offset(0, -220));
    await tester.pump();
    await tester.tap(find.text('Save Changes'));
    await tester.pumpAndSettle();

    final leewayRow =
        await (database.select(database.systemSettings)
              ..where((table) => table.key.equals(SettingKeys.leewayMinutes)))
            .getSingle();
    final pricingRow =
        await (database.select(database.systemSettings)..where(
              (table) => table.key.equals(SettingKeys.pricingMatrixJson),
            ))
            .getSingle();
    final auditRows = await database.select(database.auditEvents).get();

    expect(leewayRow.value, '12');
    expect(pricingRow.value, contains('"block_60_min":19000'));
    expect(auditRows, hasLength(2));
    expect(
      auditRows.map((row) => row.eventType),
      containsAll(['price_change', 'settings_update']),
    );
    expect(find.text('price_change'), findsOneWidget);
    expect(find.text('settings_update'), findsOneWidget);
    expect(
      find.textContaining(
        'pricing_matrix_json.fixed_duration_rates.block_60_min: '
        '18000 -> 19000',
      ),
      findsOneWidget,
    );
    expect(tester.takeException(), isNull);
  });
}
