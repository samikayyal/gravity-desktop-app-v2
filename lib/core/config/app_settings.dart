import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/foundation.dart';

abstract final class SettingKeys {
  static const String adminPassword = 'admin_password';
  static const String setupComplete = 'setup_complete';
  static const String gcpEnabled = 'gcp_enabled';
  static const String leewayMinutes = 'leeway_minutes';
  static const String staleThresholdMinutes = 'stale_threshold_minutes';
  static const String defaultSocksPriceSyp = 'default_socks_price_syp';
  static const String defaultWaterPriceSyp = 'default_water_price_syp';
  static const String pricingMatrixJson = 'pricing_matrix_json';
  static const String overdueAudioMuted = 'overdue_audio_muted';
  static const String notificationVolumePercent = 'notification_volume_percent';
  static const String screenScale = 'screen_scale';

  static const List<String> adminKeys = [
    adminPassword,
    leewayMinutes,
    staleThresholdMinutes,
    defaultSocksPriceSyp,
    defaultWaterPriceSyp,
    pricingMatrixJson,
  ];

  static const List<String> publicKeys = [
    overdueAudioMuted,
    notificationVolumePercent,
    screenScale,
  ];
}

enum SettingsValidationField {
  adminPassword,
  leewayMinutes,
  staleThresholdMinutes,
  defaultSocksPriceSyp,
  defaultWaterPriceSyp,
  pricingMatrix,
  notificationVolumePercent,
  screenScale,
}

@immutable
class SettingsValidationIssue {
  const SettingsValidationIssue({
    required this.field,
    required this.messageCode,
  });

  final SettingsValidationField field;
  final String messageCode;
}

@immutable
class SettingsValidationResult {
  const SettingsValidationResult(this.issues);

  final List<SettingsValidationIssue> issues;

  bool get isValid => issues.isEmpty;

  bool hasIssue(SettingsValidationField field) {
    return issues.any((issue) => issue.field == field);
  }
}

class SettingsValidationException implements Exception {
  SettingsValidationException(this.result);

  final SettingsValidationResult result;

  @override
  String toString() {
    final codes = result.issues.map((issue) => issue.messageCode).join(', ');
    return 'SettingsValidationException($codes)';
  }
}

@immutable
class OpenTimeRates {
  const OpenTimeRates({
    required this.firstHourRate,
    required this.additional30MinRate,
  });

  static const OpenTimeRates defaults = OpenTimeRates(
    firstHourRate: 20000,
    additional30MinRate: 8000,
  );

  final int firstHourRate;
  final int additional30MinRate;

  OpenTimeRates copyWith({int? firstHourRate, int? additional30MinRate}) {
    return OpenTimeRates(
      firstHourRate: firstHourRate ?? this.firstHourRate,
      additional30MinRate: additional30MinRate ?? this.additional30MinRate,
    );
  }

  Map<String, Object> toJson() {
    return {
      'first_hour_rate': firstHourRate,
      'additional_30_min_rate': additional30MinRate,
    };
  }

  static OpenTimeRates fromJson(Map<String, dynamic> json) {
    return OpenTimeRates(
      firstHourRate: _readJsonInt(json, 'first_hour_rate'),
      additional30MinRate: _readJsonInt(json, 'additional_30_min_rate'),
    );
  }

  bool get hasNegativeValue => firstHourRate < 0 || additional30MinRate < 0;

  @override
  bool operator ==(Object other) {
    return other is OpenTimeRates &&
        other.firstHourRate == firstHourRate &&
        other.additional30MinRate == additional30MinRate;
  }

  @override
  int get hashCode => Object.hash(firstHourRate, additional30MinRate);
}

@immutable
class FixedDurationRates {
  const FixedDurationRates({
    required this.block30Min,
    required this.block60Min,
    required this.block90Min,
    required this.block120Min,
    required this.additionalBlockRate,
  });

  static const FixedDurationRates defaults = FixedDurationRates(
    block30Min: 10000,
    block60Min: 18000,
    block90Min: 25000,
    block120Min: 32000,
    additionalBlockRate: 7000,
  );

  final int block30Min;
  final int block60Min;
  final int block90Min;
  final int block120Min;
  final int additionalBlockRate;

  FixedDurationRates copyWith({
    int? block30Min,
    int? block60Min,
    int? block90Min,
    int? block120Min,
    int? additionalBlockRate,
  }) {
    return FixedDurationRates(
      block30Min: block30Min ?? this.block30Min,
      block60Min: block60Min ?? this.block60Min,
      block90Min: block90Min ?? this.block90Min,
      block120Min: block120Min ?? this.block120Min,
      additionalBlockRate: additionalBlockRate ?? this.additionalBlockRate,
    );
  }

  Map<String, Object> toJson() {
    return {
      'block_30_min': block30Min,
      'block_60_min': block60Min,
      'block_90_min': block90Min,
      'block_120_min': block120Min,
      'additional_block_rate': additionalBlockRate,
    };
  }

  static FixedDurationRates fromJson(Map<String, dynamic> json) {
    return FixedDurationRates(
      block30Min: _readJsonInt(json, 'block_30_min'),
      block60Min: _readJsonInt(json, 'block_60_min'),
      block90Min: _readJsonInt(json, 'block_90_min'),
      block120Min: _readJsonInt(json, 'block_120_min'),
      additionalBlockRate: _readJsonInt(json, 'additional_block_rate'),
    );
  }

  bool get hasNegativeValue {
    return block30Min < 0 ||
        block60Min < 0 ||
        block90Min < 0 ||
        block120Min < 0 ||
        additionalBlockRate < 0;
  }

  @override
  bool operator ==(Object other) {
    return other is FixedDurationRates &&
        other.block30Min == block30Min &&
        other.block60Min == block60Min &&
        other.block90Min == block90Min &&
        other.block120Min == block120Min &&
        other.additionalBlockRate == additionalBlockRate;
  }

  @override
  int get hashCode {
    return Object.hash(
      block30Min,
      block60Min,
      block90Min,
      block120Min,
      additionalBlockRate,
    );
  }
}

@immutable
class PricingMatrix {
  const PricingMatrix({
    required this.currency,
    required this.openTimeRates,
    required this.fixedDurationRates,
  });

  static const PricingMatrix defaults = PricingMatrix(
    currency: 'SYP',
    openTimeRates: OpenTimeRates.defaults,
    fixedDurationRates: FixedDurationRates.defaults,
  );

  final String currency;
  final OpenTimeRates openTimeRates;
  final FixedDurationRates fixedDurationRates;

  PricingMatrix copyWith({
    String? currency,
    OpenTimeRates? openTimeRates,
    FixedDurationRates? fixedDurationRates,
  }) {
    return PricingMatrix(
      currency: currency ?? this.currency,
      openTimeRates: openTimeRates ?? this.openTimeRates,
      fixedDurationRates: fixedDurationRates ?? this.fixedDurationRates,
    );
  }

  String toStorageJson() {
    return jsonEncode(toJson());
  }

  Map<String, Object> toJson() {
    return {
      'currency': currency,
      'open_time_rates': openTimeRates.toJson(),
      'fixed_duration_rates': fixedDurationRates.toJson(),
    };
  }

  static PricingMatrix fromStorageJson(String value) {
    final Object? decoded = jsonDecode(value);
    if (decoded is! Map<String, dynamic>) {
      throw const FormatException('pricing_matrix_json must be an object');
    }

    final openRates = decoded['open_time_rates'];
    final fixedRates = decoded['fixed_duration_rates'];
    final currency = decoded['currency'];

    if (openRates is! Map<String, dynamic>) {
      throw const FormatException('open_time_rates must be an object');
    }
    if (fixedRates is! Map<String, dynamic>) {
      throw const FormatException('fixed_duration_rates must be an object');
    }
    if (currency is! String) {
      throw const FormatException('currency must be a string');
    }

    return PricingMatrix(
      currency: currency,
      openTimeRates: OpenTimeRates.fromJson(openRates),
      fixedDurationRates: FixedDurationRates.fromJson(fixedRates),
    );
  }

  bool get hasInvalidPrice {
    return currency != 'SYP' ||
        openTimeRates.hasNegativeValue ||
        fixedDurationRates.hasNegativeValue;
  }

  @override
  bool operator ==(Object other) {
    return other is PricingMatrix &&
        other.currency == currency &&
        other.openTimeRates == openTimeRates &&
        other.fixedDurationRates == fixedDurationRates;
  }

  @override
  int get hashCode => Object.hash(currency, openTimeRates, fixedDurationRates);
}

@immutable
class AppSettings {
  const AppSettings({
    required this.adminPassword,
    required this.leewayMinutes,
    required this.staleThresholdMinutes,
    required this.defaultSocksPriceSyp,
    required this.defaultWaterPriceSyp,
    required this.pricingMatrix,
    required this.overdueAudioMuted,
    required this.notificationVolumePercent,
    required this.screenScale,
  });

  static const List<double> allowedScreenScales = [1.0, 1.1, 1.2];

  static const AppSettings defaults = AppSettings(
    adminPassword: 'admin123',
    leewayMinutes: 10,
    staleThresholdMinutes: 240,
    defaultSocksPriceSyp: 5000,
    defaultWaterPriceSyp: 2000,
    pricingMatrix: PricingMatrix.defaults,
    overdueAudioMuted: false,
    notificationVolumePercent: 100,
    screenScale: 1.0,
  );

  final String adminPassword;
  final int leewayMinutes;
  final int staleThresholdMinutes;
  final int defaultSocksPriceSyp;
  final int defaultWaterPriceSyp;
  final PricingMatrix pricingMatrix;
  final bool overdueAudioMuted;
  final int notificationVolumePercent;
  final double screenScale;

  AppSettings copyWith({
    String? adminPassword,
    int? leewayMinutes,
    int? staleThresholdMinutes,
    int? defaultSocksPriceSyp,
    int? defaultWaterPriceSyp,
    PricingMatrix? pricingMatrix,
    bool? overdueAudioMuted,
    int? notificationVolumePercent,
    double? screenScale,
  }) {
    return AppSettings(
      adminPassword: adminPassword ?? this.adminPassword,
      leewayMinutes: leewayMinutes ?? this.leewayMinutes,
      staleThresholdMinutes:
          staleThresholdMinutes ?? this.staleThresholdMinutes,
      defaultSocksPriceSyp: defaultSocksPriceSyp ?? this.defaultSocksPriceSyp,
      defaultWaterPriceSyp: defaultWaterPriceSyp ?? this.defaultWaterPriceSyp,
      pricingMatrix: pricingMatrix ?? this.pricingMatrix,
      overdueAudioMuted: overdueAudioMuted ?? this.overdueAudioMuted,
      notificationVolumePercent:
          notificationVolumePercent ?? this.notificationVolumePercent,
      screenScale: screenScale ?? this.screenScale,
    );
  }

  static AppSettings fromStorageMap(Map<String, String> values) {
    const defaults = AppSettings.defaults;
    final defaultValues = defaults.toStorageMap();

    return AppSettings(
      adminPassword:
          values[SettingKeys.adminPassword] ?? defaults.adminPassword,
      leewayMinutes: _readStorageInt(
        values,
        SettingKeys.leewayMinutes,
        defaults.leewayMinutes,
      ),
      staleThresholdMinutes: _readStorageInt(
        values,
        SettingKeys.staleThresholdMinutes,
        defaults.staleThresholdMinutes,
      ),
      defaultSocksPriceSyp: _readStorageInt(
        values,
        SettingKeys.defaultSocksPriceSyp,
        defaults.defaultSocksPriceSyp,
      ),
      defaultWaterPriceSyp: _readStorageInt(
        values,
        SettingKeys.defaultWaterPriceSyp,
        defaults.defaultWaterPriceSyp,
      ),
      pricingMatrix: PricingMatrix.fromStorageJson(
        values[SettingKeys.pricingMatrixJson] ??
            defaultValues[SettingKeys.pricingMatrixJson]!,
      ),
      overdueAudioMuted: _readStorageBool(
        values,
        SettingKeys.overdueAudioMuted,
        defaults.overdueAudioMuted,
      ),
      notificationVolumePercent: _readStorageInt(
        values,
        SettingKeys.notificationVolumePercent,
        defaults.notificationVolumePercent,
      ),
      screenScale: _readStorageDouble(
        values,
        SettingKeys.screenScale,
        defaults.screenScale,
      ),
    );
  }

  Map<String, String> toStorageMap() {
    return {
      SettingKeys.adminPassword: adminPassword,
      SettingKeys.leewayMinutes: leewayMinutes.toString(),
      SettingKeys.staleThresholdMinutes: staleThresholdMinutes.toString(),
      SettingKeys.defaultSocksPriceSyp: defaultSocksPriceSyp.toString(),
      SettingKeys.defaultWaterPriceSyp: defaultWaterPriceSyp.toString(),
      SettingKeys.pricingMatrixJson: pricingMatrix.toStorageJson(),
      SettingKeys.overdueAudioMuted: overdueAudioMuted ? '1' : '0',
      SettingKeys.notificationVolumePercent: notificationVolumePercent
          .toString(),
      SettingKeys.screenScale: screenScale.toStringAsFixed(1),
    };
  }

  Map<String, String> toAdminStorageMap() {
    final values = toStorageMap();
    return {for (final key in SettingKeys.adminKeys) key: values[key]!};
  }

  Map<String, String> toPublicStorageMap() {
    final values = toStorageMap();
    return {for (final key in SettingKeys.publicKeys) key: values[key]!};
  }

  SettingsValidationResult validate() {
    final issues = <SettingsValidationIssue>[];

    if (adminPassword.trim().isEmpty) {
      issues.add(
        const SettingsValidationIssue(
          field: SettingsValidationField.adminPassword,
          messageCode: 'admin_password_min_length',
        ),
      );
    }
    if (leewayMinutes < 0 || leewayMinutes > 60) {
      issues.add(
        const SettingsValidationIssue(
          field: SettingsValidationField.leewayMinutes,
          messageCode: 'leeway_range',
        ),
      );
    }

    // Stale sessions must be far enough from overtime leeway that the active
    // board does not mark normal overtime as an administrative correction case.
    final minimumStaleThreshold = math.max(60, leewayMinutes * 3);
    if (staleThresholdMinutes < minimumStaleThreshold) {
      issues.add(
        const SettingsValidationIssue(
          field: SettingsValidationField.staleThresholdMinutes,
          messageCode: 'stale_threshold_range',
        ),
      );
    }

    if (defaultSocksPriceSyp < 0) {
      issues.add(
        const SettingsValidationIssue(
          field: SettingsValidationField.defaultSocksPriceSyp,
          messageCode: 'default_socks_price_non_negative',
        ),
      );
    }
    if (defaultWaterPriceSyp < 0) {
      issues.add(
        const SettingsValidationIssue(
          field: SettingsValidationField.defaultWaterPriceSyp,
          messageCode: 'default_water_price_non_negative',
        ),
      );
    }
    if (pricingMatrix.hasInvalidPrice) {
      issues.add(
        const SettingsValidationIssue(
          field: SettingsValidationField.pricingMatrix,
          messageCode: 'pricing_matrix_non_negative_syp',
        ),
      );
    }
    if (notificationVolumePercent < 0 || notificationVolumePercent > 100) {
      issues.add(
        const SettingsValidationIssue(
          field: SettingsValidationField.notificationVolumePercent,
          messageCode: 'notification_volume_range',
        ),
      );
    }
    if (!_isAllowedScreenScale(screenScale)) {
      issues.add(
        const SettingsValidationIssue(
          field: SettingsValidationField.screenScale,
          messageCode: 'screen_scale_allowed',
        ),
      );
    }

    return SettingsValidationResult(List.unmodifiable(issues));
  }

  @override
  bool operator ==(Object other) {
    return other is AppSettings &&
        other.adminPassword == adminPassword &&
        other.leewayMinutes == leewayMinutes &&
        other.staleThresholdMinutes == staleThresholdMinutes &&
        other.defaultSocksPriceSyp == defaultSocksPriceSyp &&
        other.defaultWaterPriceSyp == defaultWaterPriceSyp &&
        other.pricingMatrix == pricingMatrix &&
        other.overdueAudioMuted == overdueAudioMuted &&
        other.notificationVolumePercent == notificationVolumePercent &&
        other.screenScale == screenScale;
  }

  @override
  int get hashCode {
    return Object.hash(
      adminPassword,
      leewayMinutes,
      staleThresholdMinutes,
      defaultSocksPriceSyp,
      defaultWaterPriceSyp,
      pricingMatrix,
      overdueAudioMuted,
      notificationVolumePercent,
      screenScale,
    );
  }
}

bool _isAllowedScreenScale(double value) {
  return AppSettings.allowedScreenScales.any(
    (scale) => (scale - value).abs() < 0.001,
  );
}

int _readJsonInt(Map<String, dynamic> json, String key) {
  final value = json[key];
  if (value is! int) {
    throw FormatException('$key must be an integer');
  }
  return value;
}

int _readStorageInt(Map<String, String> values, String key, int fallback) {
  final value = values[key];
  if (value == null) {
    return fallback;
  }
  final parsed = int.tryParse(value);
  if (parsed == null) {
    throw FormatException('$key must be an integer');
  }
  return parsed;
}

double _readStorageDouble(
  Map<String, String> values,
  String key,
  double fallback,
) {
  final value = values[key];
  if (value == null) {
    return fallback;
  }
  final parsed = double.tryParse(value);
  if (parsed == null) {
    throw FormatException('$key must be a decimal number');
  }
  return parsed;
}

bool _readStorageBool(Map<String, String> values, String key, bool fallback) {
  final value = values[key];
  if (value == null) {
    return fallback;
  }
  if (value == '1') {
    return true;
  }
  if (value == '0') {
    return false;
  }
  throw FormatException('$key must be 0 or 1');
}
