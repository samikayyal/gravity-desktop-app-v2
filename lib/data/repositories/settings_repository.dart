import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:gravity_desktop_app_v2/core/config/app_settings.dart';
import 'package:gravity_desktop_app_v2/core/database/local_database.dart';
import 'package:gravity_desktop_app_v2/core/security/admin_auth_notifier.dart';

class SettingsRepository {
  SettingsRepository(this._database, {DateTime Function()? now})
    : _now = now ?? DateTime.now;

  final AppDatabase _database;
  final DateTime Function() _now;

  Future<AppSettings> loadOrSeedSettings() async {
    return _database.transaction(_loadOrSeedSettingsInTransaction);
  }

  Future<AppSettings> savePublicSettings(AppSettings requestedSettings) async {
    return _database.transaction(() async {
      final previousSettings = await _loadOrSeedSettingsInTransaction();
      final nextSettings = previousSettings.copyWith(
        overdueAudioMuted: requestedSettings.overdueAudioMuted,
        notificationVolumePercent: requestedSettings.notificationVolumePercent,
        screenScale: requestedSettings.screenScale,
      );
      _throwIfInvalid(nextSettings);

      final changedValues = _changedValues(
        previousSettings.toStorageMap(),
        nextSettings.toPublicStorageMap(),
      );
      await _upsertSettings(changedValues);

      return changedValues.isEmpty ? previousSettings : nextSettings;
    });
  }

  Future<AppSettings> saveAdminSettings({
    required AppSettings requestedSettings,
    required AdminAuthorization authorization,
  }) async {
    if (!authorization.isActiveAt(_now())) {
      throw const AdminAuthorizationException();
    }

    return _database.transaction(() async {
      final previousSettings = await _loadOrSeedSettingsInTransaction();
      _throwIfInvalid(requestedSettings);

      final changedValues = _changedValues(
        previousSettings.toStorageMap(),
        requestedSettings.toAdminStorageMap(),
      );

      if (changedValues.isEmpty) {
        return previousSettings;
      }

      await _upsertSettings(changedValues);
      await _insertProtectedSettingsAuditEvents(
        previousSettings: previousSettings,
        changedValues: changedValues,
      );

      return AppSettings.fromStorageMap({
        ...previousSettings.toStorageMap(),
        ...changedValues,
      });
    });
  }

  Future<bool> verifyAdminPassword(String password) async {
    final settings = await loadOrSeedSettings();
    return settings.adminPassword == password;
  }

  Future<AppSettings> _loadOrSeedSettingsInTransaction() async {
    final values = await _loadSettingsMap();
    final defaultValues = AppSettings.defaults.toStorageMap();
    final missingValues = <String, String>{};

    for (final entry in defaultValues.entries) {
      if (!values.containsKey(entry.key)) {
        missingValues[entry.key] = entry.value;
      }
    }

    await _upsertSettings(missingValues);

    return AppSettings.fromStorageMap({...values, ...missingValues});
  }

  Future<Map<String, String>> _loadSettingsMap() async {
    final rows = await _database.select(_database.systemSettings).get();
    return {for (final row in rows) row.key: row.value};
  }

  Future<void> _upsertSettings(Map<String, String> values) async {
    if (values.isEmpty) {
      return;
    }

    final updatedAt = _now().toUtc().toIso8601String();
    for (final entry in values.entries) {
      await _database
          .into(_database.systemSettings)
          .insertOnConflictUpdate(
            SystemSettingsCompanion.insert(
              key: entry.key,
              value: entry.value,
              updatedAt: updatedAt,
            ),
          );
    }
  }

  Future<void> _insertProtectedSettingsAuditEvents({
    required AppSettings previousSettings,
    required Map<String, String> changedValues,
  }) async {
    await _insertAuditEventForKeys(
      eventType: 'price_change',
      descriptionPrefix: 'Updated protected prices',
      keys: _changedKeysForGroup(changedValues, _priceChangeKeys),
      previousSettings: previousSettings,
      changedValues: changedValues,
    );
    await _insertAuditEventForKeys(
      eventType: 'settings_update',
      descriptionPrefix: 'Updated protected settings',
      keys: _changedKeysForGroup(changedValues, _settingsUpdateKeys),
      previousSettings: previousSettings,
      changedValues: changedValues,
    );
  }

  Future<void> _insertAuditEventForKeys({
    required String eventType,
    required String descriptionPrefix,
    required List<String> keys,
    required AppSettings previousSettings,
    required Map<String, String> changedValues,
  }) async {
    if (keys.isEmpty) {
      return;
    }

    final previousValues = previousSettings.toStorageMap();

    await _database
        .into(_database.auditEvents)
        .insert(
          AuditEventsCompanion.insert(
            eventType: eventType,
            description: '$descriptionPrefix: ${keys.join(', ')}',
            triggeredAt: _now().toUtc().toIso8601String(),
            metadata: Value(
              jsonEncode({
                'reason': 'Protected settings save',
                'actor': 'Admin',
                'changed_fields': {
                  for (final key in keys)
                    key: {
                      'old': _auditValue(key, previousValues[key]!),
                      'new': _auditValue(key, changedValues[key]!),
                    },
                },
                'target_records': {'setting_keys': keys},
              }),
            ),
          ),
        );
  }

  List<String> _changedKeysForGroup(
    Map<String, String> changedValues,
    Set<String> groupKeys,
  ) {
    return [
      for (final key in SettingKeys.adminKeys)
        if (groupKeys.contains(key) && changedValues.containsKey(key)) key,
    ];
  }

  Map<String, String> _changedValues(
    Map<String, String> previousValues,
    Map<String, String> requestedValues,
  ) {
    return {
      for (final entry in requestedValues.entries)
        if (previousValues[entry.key] != entry.value) entry.key: entry.value,
    };
  }

  Object _auditValue(String key, String value) {
    if (key == SettingKeys.adminPassword) {
      return '<redacted>';
    }
    if (key == SettingKeys.pricingMatrixJson) {
      final decoded = jsonDecode(value);
      if (decoded is Map<String, dynamic>) {
        return decoded;
      }
      return value;
    }
    final parsedInt = int.tryParse(value);
    if (parsedInt != null) {
      return parsedInt;
    }
    return value;
  }

  void _throwIfInvalid(AppSettings settings) {
    final validation = settings.validate();
    if (!validation.isValid) {
      throw SettingsValidationException(validation);
    }
  }
}

const Set<String> _priceChangeKeys = {
  SettingKeys.pricingMatrixJson,
  SettingKeys.defaultSocksPriceSyp,
  SettingKeys.defaultWaterPriceSyp,
};

const Set<String> _settingsUpdateKeys = {
  SettingKeys.adminPassword,
  SettingKeys.leewayMinutes,
  SettingKeys.staleThresholdMinutes,
};
