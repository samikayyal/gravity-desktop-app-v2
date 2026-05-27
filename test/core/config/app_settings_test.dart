import 'package:flutter_test/flutter_test.dart';
import 'package:gravity_desktop_app_v2/core/config/app_settings.dart';

void main() {
  group('AppSettings validation', () {
    test('rejects leeway values outside 0 to 60 minutes', () {
      final settings = AppSettings.defaults.copyWith(leewayMinutes: -5);

      final validation = settings.validate();

      expect(validation.isValid, isFalse);
      expect(
        validation.hasIssue(SettingsValidationField.leewayMinutes),
        isTrue,
      );
    });

    test('rejects stale threshold below the active-session safety window', () {
      final settings = AppSettings.defaults.copyWith(
        leewayMinutes: 10,
        staleThresholdMinutes: 5,
      );

      final validation = settings.validate();

      expect(validation.isValid, isFalse);
      expect(
        validation.hasIssue(SettingsValidationField.staleThresholdMinutes),
        isTrue,
      );
    });

    test(
      'allows stale threshold equal to 60 minutes when it meets leeway rule',
      () {
        final settings = AppSettings.defaults.copyWith(
          leewayMinutes: 20,
          staleThresholdMinutes: 60,
        );

        final validation = settings.validate();

        expect(validation.isValid, isTrue);
      },
    );

    test('rejects blank or too-short admin passwords', () {
      final settings = AppSettings.defaults.copyWith(adminPassword: '   ');

      final validation = settings.validate();

      expect(validation.isValid, isFalse);
      expect(
        validation.hasIssue(SettingsValidationField.adminPassword),
        isTrue,
      );
    });

    test('rejects negative pricing in the pricing matrix', () {
      final settings = AppSettings.defaults.copyWith(
        pricingMatrix: AppSettings.defaults.pricingMatrix.copyWith(
          openTimeRates: AppSettings.defaults.pricingMatrix.openTimeRates
              .copyWith(firstHourRate: -1),
        ),
      );

      final validation = settings.validate();

      expect(validation.isValid, isFalse);
      expect(
        validation.hasIssue(SettingsValidationField.pricingMatrix),
        isTrue,
      );
    });

    test('stores settings as string values with JSON pricing matrix', () {
      final storage = AppSettings.defaults.toStorageMap();

      expect(storage[SettingKeys.leewayMinutes], '10');
      expect(storage[SettingKeys.staleThresholdMinutes], '240');
      expect(storage[SettingKeys.defaultSocksPriceSyp], '5000');
      expect(storage[SettingKeys.defaultWaterPriceSyp], '2000');
      expect(
        storage[SettingKeys.pricingMatrixJson],
        '{"currency":"SYP","open_time_rates":{"first_hour_rate":20000,'
        '"additional_30_min_rate":8000},"fixed_duration_rates":'
        '{"block_30_min":10000,"block_60_min":18000,'
        '"block_90_min":25000,"block_120_min":32000,'
        '"additional_block_rate":7000}}',
      );
    });
  });
}
