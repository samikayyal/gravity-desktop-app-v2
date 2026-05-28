import 'package:gravity_desktop_app_v2/core/audit/audit_service.dart';
import 'package:gravity_desktop_app_v2/core/config/app_settings.dart';
import 'package:gravity_desktop_app_v2/core/database/local_database.dart';
import 'package:gravity_desktop_app_v2/core/security/admin_authorization.dart';
import 'package:gravity_desktop_app_v2/data/repositories/audit_repository.dart';

class SettingsRepository {
  SettingsRepository(
    AppDatabase database, {
    DateTime Function()? now,
    AuditRepository? auditRepository,
    AuditService auditService = const AuditService(),
  }) : _database = database,
       _now = now ?? DateTime.now,
       _auditService = auditService,
       _auditRepository =
           auditRepository ??
           AuditRepository(database, now: now, auditService: auditService);

  final AppDatabase _database;
  final DateTime Function() _now;
  final AuditService _auditService;
  final AuditRepository _auditRepository;

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
    final drafts = _auditService.protectedSettingsDrafts(
      previousSettings: previousSettings,
      changedValues: changedValues,
    );
    for (final draft in drafts) {
      await _auditRepository.insertAuditEvent(draft);
    }
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

  void _throwIfInvalid(AppSettings settings) {
    final validation = settings.validate();
    if (!validation.isValid) {
      throw SettingsValidationException(validation);
    }
  }
}
