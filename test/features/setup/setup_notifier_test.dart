import 'package:drift/drift.dart' hide isNull;
import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gravity_desktop_app_v2/app/providers.dart';
import 'package:gravity_desktop_app_v2/core/database/local_database.dart';
import 'package:gravity_desktop_app_v2/features/setup/presentation/setup_notifier.dart';

void main() {
  late AppDatabase database;
  late ProviderContainer container;

  setUp(() {
    database = AppDatabase.forTesting(
      DatabaseConnection(NativeDatabase.memory()),
    );
    container = ProviderContainer(
      overrides: [databaseProvider.overrideWithValue(database)],
    );
  });

  tearDown(() async {
    container.dispose();
    await database.close();
  });

  test('moves forward and backward while preserving password drafts', () {
    final notifier = container.read(setupNotifierProvider.notifier);

    notifier.updatePassword('AdminGravity');
    notifier.updateConfirmPassword('AdminGravity');
    notifier.goNext();

    expect(container.read(setupNotifierProvider).step, SetupWizardStep.restore);
    expect(container.read(setupNotifierProvider).adminPassword, 'AdminGravity');

    notifier.goBack();

    final state = container.read(setupNotifierProvider);
    expect(state.step, SetupWizardStep.password);
    expect(state.adminPassword, 'AdminGravity');
    expect(state.confirmPassword, 'AdminGravity');
  });

  test('validates admin password length and confirmation match', () {
    expect(validateAdminPassword('short', 'short'), 'admin_password_min_6');
    expect(
      validateAdminPassword('AdminGravity', 'AdminGravity2'),
      'admin_password_mismatch',
    );
    expect(validateAdminPassword('AdminGravity', 'AdminGravity'), isNull);
  });

  test('blocks catalog finish when enabled SKUs are duplicated', () {
    final notifier = container.read(setupNotifierProvider.notifier);
    final state = container.read(setupNotifierProvider);

    notifier.updateCatalogDraft(
      1,
      state.catalogDrafts[1].copyWith(sku: ' socks-grip '),
    );

    final updated = container.read(setupNotifierProvider);
    expect(updated.hasDuplicateEnabledSku, isTrue);
    expect(updated.canFinishCatalog, isFalse);
  });

  test(
    'detected local cloud config does not enable cloud backup during setup',
    () async {
      container.dispose();
      await database.close();
      database = AppDatabase.forTesting(
        DatabaseConnection(NativeDatabase.memory()),
      );
      container = ProviderContainer(
        overrides: [
          databaseProvider.overrideWithValue(database),
          gcpSetupProbeProvider.overrideWithValue(() async => true),
        ],
      );

      final notifier = container.read(setupNotifierProvider.notifier);
      notifier.updatePassword('AdminGravity');
      notifier.updateConfirmPassword('AdminGravity');

      await notifier.checkCloudConfiguration();
      await notifier.finishSetup();

      final gcpRow = await (database.select(
        database.systemSettings,
      )..where((table) => table.key.equals('gcp_enabled'))).getSingle();

      expect(
        container.read(setupNotifierProvider).cloudStatus,
        SetupCloudStatus.configDetected,
      );
      expect(gcpRow.value, '0');
    },
  );
}
