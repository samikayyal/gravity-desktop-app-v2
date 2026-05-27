import 'dart:convert';

import 'package:drift/drift.dart' hide isNull;
import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gravity_desktop_app_v2/app/providers.dart';
import 'package:gravity_desktop_app_v2/core/config/app_settings.dart';
import 'package:gravity_desktop_app_v2/core/config/system_settings_provider.dart';
import 'package:gravity_desktop_app_v2/core/database/local_database.dart';
import 'package:gravity_desktop_app_v2/core/security/admin_auth_notifier.dart';
import 'package:gravity_desktop_app_v2/data/repositories/settings_repository.dart';

void main() {
  late AppDatabase database;
  late SettingsRepository repository;

  DateTime fixedNow() => DateTime.utc(2026, 5, 27, 0, 0);

  setUp(() {
    database = AppDatabase.forTesting(
      DatabaseConnection(NativeDatabase.memory()),
    );
    repository = SettingsRepository(database, now: fixedNow);
  });

  tearDown(() async {
    await database.close();
  });

  Future<AdminAuthorization> unlockAdmin() async {
    final container = ProviderContainer(
      overrides: [databaseProvider.overrideWithValue(database)],
    );
    addTearDown(container.dispose);

    final unlocked = await container
        .read(adminAuthControllerProvider.notifier)
        .unlockWithPassword('admin123');

    expect(unlocked, isTrue);
    return container.read(adminAuthControllerProvider).authorization!;
  }

  group('SettingsRepository', () {
    test('seeds missing default settings in system_settings', () async {
      final settings = await repository.loadOrSeedSettings();

      final rows = await database.select(database.systemSettings).get();
      final rowValues = {for (final row in rows) row.key: row.value};

      expect(settings, AppSettings.defaults);
      expect(rowValues[SettingKeys.adminPassword], 'admin123');
      expect(rowValues[SettingKeys.leewayMinutes], '10');
      expect(rowValues[SettingKeys.staleThresholdMinutes], '240');
      expect(rowValues[SettingKeys.defaultSocksPriceSyp], '5000');
      expect(rowValues[SettingKeys.defaultWaterPriceSyp], '2000');
      expect(
        rowValues[SettingKeys.pricingMatrixJson],
        AppSettings.defaults.pricingMatrix.toStorageJson(),
      );
      expect(
        rows.every((row) => row.updatedAt == fixedNow().toIso8601String()),
        isTrue,
      );
    });

    test('splits protected settings audit rows by event type', () async {
      final initial = await repository.loadOrSeedSettings();
      final updated = initial.copyWith(
        adminPassword: 'changed-password',
        leewayMinutes: 12,
        defaultWaterPriceSyp: 2500,
        pricingMatrix: initial.pricingMatrix.copyWith(
          fixedDurationRates: initial.pricingMatrix.fixedDurationRates.copyWith(
            block60Min: 19000,
          ),
        ),
      );

      final saved = await repository.saveAdminSettings(
        requestedSettings: updated,
        authorization: await unlockAdmin(),
      );

      final leewayRow =
          await (database.select(database.systemSettings)
                ..where((table) => table.key.equals(SettingKeys.leewayMinutes)))
              .getSingle();
      final auditRows = await database.select(database.auditEvents).get();
      final auditByType = {for (final row in auditRows) row.eventType: row};
      final settingsMetadata =
          jsonDecode(auditByType['settings_update']!.metadata!)
              as Map<String, dynamic>;
      final priceMetadata =
          jsonDecode(auditByType['price_change']!.metadata!)
              as Map<String, dynamic>;
      final settingsChangedFields =
          settingsMetadata['changed_fields'] as Map<String, dynamic>;
      final priceChangedFields =
          priceMetadata['changed_fields'] as Map<String, dynamic>;
      final settingsTargets =
          settingsMetadata['target_records'] as Map<String, dynamic>;
      final priceTargets =
          priceMetadata['target_records'] as Map<String, dynamic>;

      expect(saved.leewayMinutes, 12);
      expect(saved.defaultWaterPriceSyp, 2500);
      expect(leewayRow.value, '12');
      expect(auditRows, hasLength(2));
      expect(
        auditByType.keys,
        containsAll(['settings_update', 'price_change']),
      );
      expect(
        auditByType['settings_update']!.description,
        contains(SettingKeys.leewayMinutes),
      );
      expect(
        auditByType['price_change']!.description,
        contains(SettingKeys.pricingMatrixJson),
      );
      expect(settingsChangedFields[SettingKeys.adminPassword], {
        'old': '<redacted>',
        'new': '<redacted>',
      });
      expect(settingsChangedFields[SettingKeys.leewayMinutes], {
        'old': 10,
        'new': 12,
      });
      expect(settingsTargets['setting_keys'], [
        SettingKeys.adminPassword,
        SettingKeys.leewayMinutes,
      ]);
      expect(priceChangedFields[SettingKeys.defaultWaterPriceSyp], {
        'old': 2000,
        'new': 2500,
      });
      expect(priceChangedFields[SettingKeys.pricingMatrixJson], {
        'old': AppSettings.defaults.pricingMatrix.toJson(),
        'new': updated.pricingMatrix.toJson(),
      });
      expect(priceTargets['setting_keys'], [
        SettingKeys.defaultWaterPriceSyp,
        SettingKeys.pricingMatrixJson,
      ]);
      expect(settingsMetadata['actor'], 'Admin');
      expect(priceMetadata['actor'], 'Admin');
      expect(settingsMetadata['reason'], 'Protected settings save');
      expect(priceMetadata['reason'], 'Protected settings save');
      expect(
        settingsChangedFields.keys,
        isNot(contains(SettingKeys.pricingMatrixJson)),
      );
    });

    test('saves public settings without creating audit rows', () async {
      final initial = await repository.loadOrSeedSettings();

      final saved = await repository.savePublicSettings(
        initial.copyWith(
          overdueAudioMuted: true,
          notificationVolumePercent: 70,
          screenScale: 1.1,
        ),
      );

      final rows = await database.select(database.systemSettings).get();
      final rowValues = {for (final row in rows) row.key: row.value};
      final auditRows = await database.select(database.auditEvents).get();

      expect(saved.overdueAudioMuted, isTrue);
      expect(saved.notificationVolumePercent, 70);
      expect(saved.screenScale, 1.1);
      expect(rowValues[SettingKeys.overdueAudioMuted], '1');
      expect(rowValues[SettingKeys.notificationVolumePercent], '70');
      expect(rowValues[SettingKeys.screenScale], '1.1');
      expect(auditRows, isEmpty);
    });

    test('admin auth controller rejects incorrect passwords', () async {
      await repository.loadOrSeedSettings();
      final container = ProviderContainer(
        overrides: [databaseProvider.overrideWithValue(database)],
      );
      addTearDown(container.dispose);

      final unlocked = await container
          .read(adminAuthControllerProvider.notifier)
          .unlockWithPassword('wrong-password');

      expect(unlocked, isFalse);
      expect(
        container
            .read(adminAuthControllerProvider)
            .isAuthenticatedAt(DateTime.now()),
        isFalse,
      );
    });

    test(
      'repository rejects authorization after admin session is locked',
      () async {
        final initial = await repository.loadOrSeedSettings();
        final container = ProviderContainer(
          overrides: [databaseProvider.overrideWithValue(database)],
        );
        addTearDown(container.dispose);

        final unlocked = await container
            .read(adminAuthControllerProvider.notifier)
            .unlockWithPassword('admin123');
        final authorization = container
            .read(adminAuthControllerProvider)
            .authorization!;
        container.read(adminAuthControllerProvider.notifier).lock();

        expect(unlocked, isTrue);
        await expectLater(
          repository.saveAdminSettings(
            requestedSettings: initial.copyWith(leewayMinutes: 18),
            authorization: authorization,
          ),
          throwsA(isA<AdminAuthorizationException>()),
        );

        final leewayRow =
            await (database.select(database.systemSettings)..where(
                  (table) => table.key.equals(SettingKeys.leewayMinutes),
                ))
                .getSingle();
        final auditRows = await database.select(database.auditEvents).get();

        expect(leewayRow.value, '10');
        expect(auditRows, isEmpty);
      },
    );

    test('settings controller updates cache only after SQLite save', () async {
      final container = ProviderContainer(
        overrides: [databaseProvider.overrideWithValue(database)],
      );
      addTearDown(container.dispose);

      final initial = await container.read(
        systemSettingsControllerProvider.future,
      );
      final unlocked = await container
          .read(adminAuthControllerProvider.notifier)
          .unlockWithPassword('admin123');
      expect(unlocked, isTrue);

      await container
          .read(systemSettingsControllerProvider.notifier)
          .saveAdminSettings(initial.copyWith(leewayMinutes: 14));

      final cached = container.read(systemSettingsControllerProvider).value;
      final leewayRow =
          await (database.select(database.systemSettings)
                ..where((table) => table.key.equals(SettingKeys.leewayMinutes)))
              .getSingle();

      expect(cached?.leewayMinutes, 14);
      expect(leewayRow.value, '14');
    });

    test(
      'settings controller does not bypass admin password verification',
      () async {
        final container = ProviderContainer(
          overrides: [databaseProvider.overrideWithValue(database)],
        );
        addTearDown(container.dispose);

        final initial = await container.read(
          systemSettingsControllerProvider.future,
        );

        await expectLater(
          container
              .read(systemSettingsControllerProvider.notifier)
              .saveAdminSettings(initial.copyWith(leewayMinutes: 18)),
          throwsA(isA<AdminAuthorizationException>()),
        );

        final cached = container.read(systemSettingsControllerProvider).value;
        final leewayRow =
            await (database.select(database.systemSettings)..where(
                  (table) => table.key.equals(SettingKeys.leewayMinutes),
                ))
                .getSingle();

        expect(cached?.leewayMinutes, 10);
        expect(leewayRow.value, '10');
      },
    );
  });
}
