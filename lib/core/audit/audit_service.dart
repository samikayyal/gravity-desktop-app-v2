import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:gravity_desktop_app_v2/core/config/app_settings.dart';

enum AuditEventType {
  priceChange('price_change'),
  settingsUpdate('settings_update'),
  staleCorrection('stale_correction'),
  manualVoid('manual_void'),
  debtCorrection('debt_correction'),
  backupRestore('backup_restore');

  const AuditEventType(this.storageValue);

  final String storageValue;

  static AuditEventType fromStorageValue(String value) {
    return AuditEventType.values.firstWhere(
      (type) => type.storageValue == value,
      orElse: () => throw FormatException('Unknown audit event type: $value'),
    );
  }
}

@immutable
class AuditEventDraft {
  const AuditEventDraft({
    required this.eventType,
    required this.description,
    required this.metadata,
  });

  final AuditEventType eventType;
  final String description;
  final Map<String, Object?> metadata;

  String get encodedMetadata => jsonEncode(metadata);
}

@immutable
class AuditEventRecord {
  const AuditEventRecord({
    required this.id,
    required this.eventType,
    required this.description,
    required this.triggeredAt,
    required this.reason,
    required this.targetSummary,
    required this.changedDetails,
  });

  final int id;
  final AuditEventType eventType;
  final String description;
  final DateTime triggeredAt;
  final String reason;
  final String targetSummary;
  final String changedDetails;
}

class AuditService {
  const AuditService();

  static const String adminActor = 'Admin';

  List<AuditEventDraft> protectedSettingsDrafts({
    required AppSettings previousSettings,
    required Map<String, String> changedValues,
  }) {
    return [
      ..._draftForKeys(
        eventType: AuditEventType.priceChange,
        descriptionPrefix: 'Updated protected prices',
        keys: _changedKeysForGroup(changedValues, _priceChangeKeys),
        previousSettings: previousSettings,
        changedValues: changedValues,
      ),
      ..._draftForKeys(
        eventType: AuditEventType.settingsUpdate,
        descriptionPrefix: 'Updated protected settings',
        keys: _changedKeysForGroup(changedValues, _settingsUpdateKeys),
        previousSettings: previousSettings,
        changedValues: changedValues,
      ),
    ];
  }

  AuditEventRecord recordFromStorage({
    required int id,
    required String eventType,
    required String description,
    required String triggeredAt,
    required String? metadata,
  }) {
    final decodedMetadata = _decodeMetadata(metadata);
    return AuditEventRecord(
      id: id,
      eventType: AuditEventType.fromStorageValue(eventType),
      description: description,
      triggeredAt: DateTime.parse(triggeredAt).toUtc(),
      reason: _readString(decodedMetadata, 'reason'),
      targetSummary: _summarizeTargets(decodedMetadata['target_records']),
      changedDetails: _summarizeChangedFields(
        decodedMetadata['changed_fields'],
      ),
    );
  }

  List<AuditEventDraft> _draftForKeys({
    required AuditEventType eventType,
    required String descriptionPrefix,
    required List<String> keys,
    required AppSettings previousSettings,
    required Map<String, String> changedValues,
  }) {
    if (keys.isEmpty) {
      return const [];
    }

    final previousValues = previousSettings.toStorageMap();
    return [
      AuditEventDraft(
        eventType: eventType,
        description: '$descriptionPrefix: ${keys.join(', ')}',
        metadata: {
          'reason': 'Protected settings save',
          'actor': adminActor,
          'changed_fields': {
            for (final key in keys)
              key: {
                'old': _auditValue(key, previousValues[key]!),
                'new': _auditValue(key, changedValues[key]!),
              },
          },
          'target_records': {'setting_keys': keys},
        },
      ),
    ];
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

  Map<String, dynamic> _decodeMetadata(String? metadata) {
    if (metadata == null || metadata.isEmpty) {
      return const {};
    }

    final decoded = jsonDecode(metadata);
    if (decoded is Map<String, dynamic>) {
      return decoded;
    }
    return const {};
  }

  String _readString(Map<String, dynamic> metadata, String key) {
    final value = metadata[key];
    return value is String ? value : '';
  }

  String _summarizeTargets(Object? value) {
    if (value is! Map<String, dynamic> || value.isEmpty) {
      return '';
    }

    final settingKeys = value['setting_keys'];
    if (settingKeys is List<dynamic>) {
      return settingKeys.whereType<String>().join(', ');
    }

    return value.entries
        .map((entry) => '${entry.key}: ${_displayValue(entry.value)}')
        .join(', ');
  }

  String _summarizeChangedFields(Object? value) {
    if (value is! Map<String, dynamic> || value.isEmpty) {
      return '';
    }

    return value.entries
        .expand((entry) {
          final change = entry.value;
          if (change is Map<String, dynamic>) {
            return _summarizeValueChange(
              entry.key,
              change['old'],
              change['new'],
            );
          }
          return ['${entry.key}: ${_displayValue(change)}'];
        })
        .join('; ');
  }

  List<String> _summarizeValueChange(
    String key,
    Object? oldValue,
    Object? newValue,
  ) {
    if (oldValue is Map<String, dynamic> && newValue is Map<String, dynamic>) {
      final nestedKeys = <String>{...oldValue.keys, ...newValue.keys}.toList()
        ..sort();

      return [
        for (final nestedKey in nestedKeys)
          ..._summarizeValueChange(
            '$key.$nestedKey',
            oldValue[nestedKey],
            newValue[nestedKey],
          ),
      ];
    }

    if (oldValue == newValue) {
      return const [];
    }

    return ['$key: ${_displayValue(oldValue)} -> ${_displayValue(newValue)}'];
  }

  String _displayValue(Object? value) {
    if (value == null) {
      return '';
    }
    if (value is Map<String, dynamic>) {
      return 'updated';
    }
    if (value is List<dynamic>) {
      return value.map(_displayValue).join(', ');
    }
    return value.toString();
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

class AuditWriteException implements Exception {
  const AuditWriteException(this.message);

  final String message;

  @override
  String toString() => 'AuditWriteException($message)';
}
