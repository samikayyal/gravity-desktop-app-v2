import 'package:drift/drift.dart' hide isNull;
import 'package:drift/native.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gravity_desktop_app_v2/app/app.dart';
import 'package:gravity_desktop_app_v2/app/layout/scaled_app_shell.dart';
import 'package:gravity_desktop_app_v2/app/providers.dart';
import 'package:gravity_desktop_app_v2/core/config/app_settings.dart';
import 'package:gravity_desktop_app_v2/core/database/local_database.dart';

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

  Future<void> insertSetting(String key, String value) async {
    await database
        .into(database.systemSettings)
        .insert(
          SystemSettingsCompanion.insert(
            key: key,
            value: value,
            updatedAt: DateTime.utc(2026, 5, 27).toIso8601String(),
          ),
        );
  }

  testWidgets('applies persisted cashier screen scale to the app shell', (
    tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(1280, 800));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await insertSetting('setup_complete', '1');
    await insertSetting(SettingKeys.adminPassword, 'AdminGravity');
    await insertSetting(SettingKeys.screenScale, '1.2');

    await tester.pumpWidget(
      ProviderScope(
        overrides: [databaseProvider.overrideWithValue(database)],
        child: const GravityApp(),
      ),
    );
    await tester.pumpAndSettle();

    final transform = tester.widget<Transform>(
      find.byKey(ScaledAppShell.transformKey),
    );

    expect(transform.transform.storage[0], closeTo(1.2, 0.001));
    expect(transform.transform.storage[5], closeTo(1.2, 0.001));
    expect(tester.takeException(), isNull);
  });
}
