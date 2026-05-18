// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $AppSetupStatesTable extends AppSetupStates
    with TableInfo<$AppSetupStatesTable, AppSetupState> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppSetupStatesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _installationIdMeta = const VerificationMeta(
    'installationId',
  );
  @override
  late final GeneratedColumn<String> installationId = GeneratedColumn<String>(
    'installation_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _businessTimezoneMeta = const VerificationMeta(
    'businessTimezone',
  );
  @override
  late final GeneratedColumn<String> businessTimezone = GeneratedColumn<String>(
    'business_timezone',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('Asia/Damascus'),
  );
  static const VerificationMeta _setupCompletedMeta = const VerificationMeta(
    'setupCompleted',
  );
  @override
  late final GeneratedColumn<bool> setupCompleted = GeneratedColumn<bool>(
    'setup_completed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("setup_completed" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _backupConfiguredMeta = const VerificationMeta(
    'backupConfigured',
  );
  @override
  late final GeneratedColumn<bool> backupConfigured = GeneratedColumn<bool>(
    'backup_configured',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("backup_configured" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _backupIntervalMinutesMeta =
      const VerificationMeta('backupIntervalMinutes');
  @override
  late final GeneratedColumn<int> backupIntervalMinutes = GeneratedColumn<int>(
    'backup_interval_minutes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(120),
  );
  static const VerificationMeta _staleSessionThresholdMinutesMeta =
      const VerificationMeta('staleSessionThresholdMinutes');
  @override
  late final GeneratedColumn<int> staleSessionThresholdMinutes =
      GeneratedColumn<int>(
        'stale_session_threshold_minutes',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: false,
        defaultValue: const Constant(720),
      );
  static const VerificationMeta _firstBackupStatusMeta = const VerificationMeta(
    'firstBackupStatus',
  );
  @override
  late final GeneratedColumn<String> firstBackupStatus =
      GeneratedColumn<String>(
        'first_backup_status',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _firstBackupMessageMeta =
      const VerificationMeta('firstBackupMessage');
  @override
  late final GeneratedColumn<String> firstBackupMessage =
      GeneratedColumn<String>(
        'first_backup_message',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _createdAtUtcMeta = const VerificationMeta(
    'createdAtUtc',
  );
  @override
  late final GeneratedColumn<DateTime> createdAtUtc = GeneratedColumn<DateTime>(
    'created_at_utc',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _completedAtUtcMeta = const VerificationMeta(
    'completedAtUtc',
  );
  @override
  late final GeneratedColumn<DateTime> completedAtUtc =
      GeneratedColumn<DateTime>(
        'completed_at_utc',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    installationId,
    businessTimezone,
    setupCompleted,
    backupConfigured,
    backupIntervalMinutes,
    staleSessionThresholdMinutes,
    firstBackupStatus,
    firstBackupMessage,
    createdAtUtc,
    completedAtUtc,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'app_setup_states';
  @override
  VerificationContext validateIntegrity(
    Insertable<AppSetupState> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('installation_id')) {
      context.handle(
        _installationIdMeta,
        installationId.isAcceptableOrUnknown(
          data['installation_id']!,
          _installationIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_installationIdMeta);
    }
    if (data.containsKey('business_timezone')) {
      context.handle(
        _businessTimezoneMeta,
        businessTimezone.isAcceptableOrUnknown(
          data['business_timezone']!,
          _businessTimezoneMeta,
        ),
      );
    }
    if (data.containsKey('setup_completed')) {
      context.handle(
        _setupCompletedMeta,
        setupCompleted.isAcceptableOrUnknown(
          data['setup_completed']!,
          _setupCompletedMeta,
        ),
      );
    }
    if (data.containsKey('backup_configured')) {
      context.handle(
        _backupConfiguredMeta,
        backupConfigured.isAcceptableOrUnknown(
          data['backup_configured']!,
          _backupConfiguredMeta,
        ),
      );
    }
    if (data.containsKey('backup_interval_minutes')) {
      context.handle(
        _backupIntervalMinutesMeta,
        backupIntervalMinutes.isAcceptableOrUnknown(
          data['backup_interval_minutes']!,
          _backupIntervalMinutesMeta,
        ),
      );
    }
    if (data.containsKey('stale_session_threshold_minutes')) {
      context.handle(
        _staleSessionThresholdMinutesMeta,
        staleSessionThresholdMinutes.isAcceptableOrUnknown(
          data['stale_session_threshold_minutes']!,
          _staleSessionThresholdMinutesMeta,
        ),
      );
    }
    if (data.containsKey('first_backup_status')) {
      context.handle(
        _firstBackupStatusMeta,
        firstBackupStatus.isAcceptableOrUnknown(
          data['first_backup_status']!,
          _firstBackupStatusMeta,
        ),
      );
    }
    if (data.containsKey('first_backup_message')) {
      context.handle(
        _firstBackupMessageMeta,
        firstBackupMessage.isAcceptableOrUnknown(
          data['first_backup_message']!,
          _firstBackupMessageMeta,
        ),
      );
    }
    if (data.containsKey('created_at_utc')) {
      context.handle(
        _createdAtUtcMeta,
        createdAtUtc.isAcceptableOrUnknown(
          data['created_at_utc']!,
          _createdAtUtcMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_createdAtUtcMeta);
    }
    if (data.containsKey('completed_at_utc')) {
      context.handle(
        _completedAtUtcMeta,
        completedAtUtc.isAcceptableOrUnknown(
          data['completed_at_utc']!,
          _completedAtUtcMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AppSetupState map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppSetupState(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      installationId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}installation_id'],
      )!,
      businessTimezone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}business_timezone'],
      )!,
      setupCompleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}setup_completed'],
      )!,
      backupConfigured: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}backup_configured'],
      )!,
      backupIntervalMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}backup_interval_minutes'],
      )!,
      staleSessionThresholdMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}stale_session_threshold_minutes'],
      )!,
      firstBackupStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}first_backup_status'],
      ),
      firstBackupMessage: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}first_backup_message'],
      ),
      createdAtUtc: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at_utc'],
      )!,
      completedAtUtc: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}completed_at_utc'],
      ),
    );
  }

  @override
  $AppSetupStatesTable createAlias(String alias) {
    return $AppSetupStatesTable(attachedDatabase, alias);
  }
}

class AppSetupState extends DataClass implements Insertable<AppSetupState> {
  final int id;
  final String installationId;
  final String businessTimezone;
  final bool setupCompleted;
  final bool backupConfigured;
  final int backupIntervalMinutes;
  final int staleSessionThresholdMinutes;
  final String? firstBackupStatus;
  final String? firstBackupMessage;
  final DateTime createdAtUtc;
  final DateTime? completedAtUtc;
  const AppSetupState({
    required this.id,
    required this.installationId,
    required this.businessTimezone,
    required this.setupCompleted,
    required this.backupConfigured,
    required this.backupIntervalMinutes,
    required this.staleSessionThresholdMinutes,
    this.firstBackupStatus,
    this.firstBackupMessage,
    required this.createdAtUtc,
    this.completedAtUtc,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['installation_id'] = Variable<String>(installationId);
    map['business_timezone'] = Variable<String>(businessTimezone);
    map['setup_completed'] = Variable<bool>(setupCompleted);
    map['backup_configured'] = Variable<bool>(backupConfigured);
    map['backup_interval_minutes'] = Variable<int>(backupIntervalMinutes);
    map['stale_session_threshold_minutes'] = Variable<int>(
      staleSessionThresholdMinutes,
    );
    if (!nullToAbsent || firstBackupStatus != null) {
      map['first_backup_status'] = Variable<String>(firstBackupStatus);
    }
    if (!nullToAbsent || firstBackupMessage != null) {
      map['first_backup_message'] = Variable<String>(firstBackupMessage);
    }
    map['created_at_utc'] = Variable<DateTime>(createdAtUtc);
    if (!nullToAbsent || completedAtUtc != null) {
      map['completed_at_utc'] = Variable<DateTime>(completedAtUtc);
    }
    return map;
  }

  AppSetupStatesCompanion toCompanion(bool nullToAbsent) {
    return AppSetupStatesCompanion(
      id: Value(id),
      installationId: Value(installationId),
      businessTimezone: Value(businessTimezone),
      setupCompleted: Value(setupCompleted),
      backupConfigured: Value(backupConfigured),
      backupIntervalMinutes: Value(backupIntervalMinutes),
      staleSessionThresholdMinutes: Value(staleSessionThresholdMinutes),
      firstBackupStatus: firstBackupStatus == null && nullToAbsent
          ? const Value.absent()
          : Value(firstBackupStatus),
      firstBackupMessage: firstBackupMessage == null && nullToAbsent
          ? const Value.absent()
          : Value(firstBackupMessage),
      createdAtUtc: Value(createdAtUtc),
      completedAtUtc: completedAtUtc == null && nullToAbsent
          ? const Value.absent()
          : Value(completedAtUtc),
    );
  }

  factory AppSetupState.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AppSetupState(
      id: serializer.fromJson<int>(json['id']),
      installationId: serializer.fromJson<String>(json['installationId']),
      businessTimezone: serializer.fromJson<String>(json['businessTimezone']),
      setupCompleted: serializer.fromJson<bool>(json['setupCompleted']),
      backupConfigured: serializer.fromJson<bool>(json['backupConfigured']),
      backupIntervalMinutes: serializer.fromJson<int>(
        json['backupIntervalMinutes'],
      ),
      staleSessionThresholdMinutes: serializer.fromJson<int>(
        json['staleSessionThresholdMinutes'],
      ),
      firstBackupStatus: serializer.fromJson<String?>(
        json['firstBackupStatus'],
      ),
      firstBackupMessage: serializer.fromJson<String?>(
        json['firstBackupMessage'],
      ),
      createdAtUtc: serializer.fromJson<DateTime>(json['createdAtUtc']),
      completedAtUtc: serializer.fromJson<DateTime?>(json['completedAtUtc']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'installationId': serializer.toJson<String>(installationId),
      'businessTimezone': serializer.toJson<String>(businessTimezone),
      'setupCompleted': serializer.toJson<bool>(setupCompleted),
      'backupConfigured': serializer.toJson<bool>(backupConfigured),
      'backupIntervalMinutes': serializer.toJson<int>(backupIntervalMinutes),
      'staleSessionThresholdMinutes': serializer.toJson<int>(
        staleSessionThresholdMinutes,
      ),
      'firstBackupStatus': serializer.toJson<String?>(firstBackupStatus),
      'firstBackupMessage': serializer.toJson<String?>(firstBackupMessage),
      'createdAtUtc': serializer.toJson<DateTime>(createdAtUtc),
      'completedAtUtc': serializer.toJson<DateTime?>(completedAtUtc),
    };
  }

  AppSetupState copyWith({
    int? id,
    String? installationId,
    String? businessTimezone,
    bool? setupCompleted,
    bool? backupConfigured,
    int? backupIntervalMinutes,
    int? staleSessionThresholdMinutes,
    Value<String?> firstBackupStatus = const Value.absent(),
    Value<String?> firstBackupMessage = const Value.absent(),
    DateTime? createdAtUtc,
    Value<DateTime?> completedAtUtc = const Value.absent(),
  }) => AppSetupState(
    id: id ?? this.id,
    installationId: installationId ?? this.installationId,
    businessTimezone: businessTimezone ?? this.businessTimezone,
    setupCompleted: setupCompleted ?? this.setupCompleted,
    backupConfigured: backupConfigured ?? this.backupConfigured,
    backupIntervalMinutes: backupIntervalMinutes ?? this.backupIntervalMinutes,
    staleSessionThresholdMinutes:
        staleSessionThresholdMinutes ?? this.staleSessionThresholdMinutes,
    firstBackupStatus: firstBackupStatus.present
        ? firstBackupStatus.value
        : this.firstBackupStatus,
    firstBackupMessage: firstBackupMessage.present
        ? firstBackupMessage.value
        : this.firstBackupMessage,
    createdAtUtc: createdAtUtc ?? this.createdAtUtc,
    completedAtUtc: completedAtUtc.present
        ? completedAtUtc.value
        : this.completedAtUtc,
  );
  AppSetupState copyWithCompanion(AppSetupStatesCompanion data) {
    return AppSetupState(
      id: data.id.present ? data.id.value : this.id,
      installationId: data.installationId.present
          ? data.installationId.value
          : this.installationId,
      businessTimezone: data.businessTimezone.present
          ? data.businessTimezone.value
          : this.businessTimezone,
      setupCompleted: data.setupCompleted.present
          ? data.setupCompleted.value
          : this.setupCompleted,
      backupConfigured: data.backupConfigured.present
          ? data.backupConfigured.value
          : this.backupConfigured,
      backupIntervalMinutes: data.backupIntervalMinutes.present
          ? data.backupIntervalMinutes.value
          : this.backupIntervalMinutes,
      staleSessionThresholdMinutes: data.staleSessionThresholdMinutes.present
          ? data.staleSessionThresholdMinutes.value
          : this.staleSessionThresholdMinutes,
      firstBackupStatus: data.firstBackupStatus.present
          ? data.firstBackupStatus.value
          : this.firstBackupStatus,
      firstBackupMessage: data.firstBackupMessage.present
          ? data.firstBackupMessage.value
          : this.firstBackupMessage,
      createdAtUtc: data.createdAtUtc.present
          ? data.createdAtUtc.value
          : this.createdAtUtc,
      completedAtUtc: data.completedAtUtc.present
          ? data.completedAtUtc.value
          : this.completedAtUtc,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AppSetupState(')
          ..write('id: $id, ')
          ..write('installationId: $installationId, ')
          ..write('businessTimezone: $businessTimezone, ')
          ..write('setupCompleted: $setupCompleted, ')
          ..write('backupConfigured: $backupConfigured, ')
          ..write('backupIntervalMinutes: $backupIntervalMinutes, ')
          ..write(
            'staleSessionThresholdMinutes: $staleSessionThresholdMinutes, ',
          )
          ..write('firstBackupStatus: $firstBackupStatus, ')
          ..write('firstBackupMessage: $firstBackupMessage, ')
          ..write('createdAtUtc: $createdAtUtc, ')
          ..write('completedAtUtc: $completedAtUtc')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    installationId,
    businessTimezone,
    setupCompleted,
    backupConfigured,
    backupIntervalMinutes,
    staleSessionThresholdMinutes,
    firstBackupStatus,
    firstBackupMessage,
    createdAtUtc,
    completedAtUtc,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppSetupState &&
          other.id == this.id &&
          other.installationId == this.installationId &&
          other.businessTimezone == this.businessTimezone &&
          other.setupCompleted == this.setupCompleted &&
          other.backupConfigured == this.backupConfigured &&
          other.backupIntervalMinutes == this.backupIntervalMinutes &&
          other.staleSessionThresholdMinutes ==
              this.staleSessionThresholdMinutes &&
          other.firstBackupStatus == this.firstBackupStatus &&
          other.firstBackupMessage == this.firstBackupMessage &&
          other.createdAtUtc == this.createdAtUtc &&
          other.completedAtUtc == this.completedAtUtc);
}

class AppSetupStatesCompanion extends UpdateCompanion<AppSetupState> {
  final Value<int> id;
  final Value<String> installationId;
  final Value<String> businessTimezone;
  final Value<bool> setupCompleted;
  final Value<bool> backupConfigured;
  final Value<int> backupIntervalMinutes;
  final Value<int> staleSessionThresholdMinutes;
  final Value<String?> firstBackupStatus;
  final Value<String?> firstBackupMessage;
  final Value<DateTime> createdAtUtc;
  final Value<DateTime?> completedAtUtc;
  const AppSetupStatesCompanion({
    this.id = const Value.absent(),
    this.installationId = const Value.absent(),
    this.businessTimezone = const Value.absent(),
    this.setupCompleted = const Value.absent(),
    this.backupConfigured = const Value.absent(),
    this.backupIntervalMinutes = const Value.absent(),
    this.staleSessionThresholdMinutes = const Value.absent(),
    this.firstBackupStatus = const Value.absent(),
    this.firstBackupMessage = const Value.absent(),
    this.createdAtUtc = const Value.absent(),
    this.completedAtUtc = const Value.absent(),
  });
  AppSetupStatesCompanion.insert({
    this.id = const Value.absent(),
    required String installationId,
    this.businessTimezone = const Value.absent(),
    this.setupCompleted = const Value.absent(),
    this.backupConfigured = const Value.absent(),
    this.backupIntervalMinutes = const Value.absent(),
    this.staleSessionThresholdMinutes = const Value.absent(),
    this.firstBackupStatus = const Value.absent(),
    this.firstBackupMessage = const Value.absent(),
    required DateTime createdAtUtc,
    this.completedAtUtc = const Value.absent(),
  }) : installationId = Value(installationId),
       createdAtUtc = Value(createdAtUtc);
  static Insertable<AppSetupState> custom({
    Expression<int>? id,
    Expression<String>? installationId,
    Expression<String>? businessTimezone,
    Expression<bool>? setupCompleted,
    Expression<bool>? backupConfigured,
    Expression<int>? backupIntervalMinutes,
    Expression<int>? staleSessionThresholdMinutes,
    Expression<String>? firstBackupStatus,
    Expression<String>? firstBackupMessage,
    Expression<DateTime>? createdAtUtc,
    Expression<DateTime>? completedAtUtc,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (installationId != null) 'installation_id': installationId,
      if (businessTimezone != null) 'business_timezone': businessTimezone,
      if (setupCompleted != null) 'setup_completed': setupCompleted,
      if (backupConfigured != null) 'backup_configured': backupConfigured,
      if (backupIntervalMinutes != null)
        'backup_interval_minutes': backupIntervalMinutes,
      if (staleSessionThresholdMinutes != null)
        'stale_session_threshold_minutes': staleSessionThresholdMinutes,
      if (firstBackupStatus != null) 'first_backup_status': firstBackupStatus,
      if (firstBackupMessage != null)
        'first_backup_message': firstBackupMessage,
      if (createdAtUtc != null) 'created_at_utc': createdAtUtc,
      if (completedAtUtc != null) 'completed_at_utc': completedAtUtc,
    });
  }

  AppSetupStatesCompanion copyWith({
    Value<int>? id,
    Value<String>? installationId,
    Value<String>? businessTimezone,
    Value<bool>? setupCompleted,
    Value<bool>? backupConfigured,
    Value<int>? backupIntervalMinutes,
    Value<int>? staleSessionThresholdMinutes,
    Value<String?>? firstBackupStatus,
    Value<String?>? firstBackupMessage,
    Value<DateTime>? createdAtUtc,
    Value<DateTime?>? completedAtUtc,
  }) {
    return AppSetupStatesCompanion(
      id: id ?? this.id,
      installationId: installationId ?? this.installationId,
      businessTimezone: businessTimezone ?? this.businessTimezone,
      setupCompleted: setupCompleted ?? this.setupCompleted,
      backupConfigured: backupConfigured ?? this.backupConfigured,
      backupIntervalMinutes:
          backupIntervalMinutes ?? this.backupIntervalMinutes,
      staleSessionThresholdMinutes:
          staleSessionThresholdMinutes ?? this.staleSessionThresholdMinutes,
      firstBackupStatus: firstBackupStatus ?? this.firstBackupStatus,
      firstBackupMessage: firstBackupMessage ?? this.firstBackupMessage,
      createdAtUtc: createdAtUtc ?? this.createdAtUtc,
      completedAtUtc: completedAtUtc ?? this.completedAtUtc,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (installationId.present) {
      map['installation_id'] = Variable<String>(installationId.value);
    }
    if (businessTimezone.present) {
      map['business_timezone'] = Variable<String>(businessTimezone.value);
    }
    if (setupCompleted.present) {
      map['setup_completed'] = Variable<bool>(setupCompleted.value);
    }
    if (backupConfigured.present) {
      map['backup_configured'] = Variable<bool>(backupConfigured.value);
    }
    if (backupIntervalMinutes.present) {
      map['backup_interval_minutes'] = Variable<int>(
        backupIntervalMinutes.value,
      );
    }
    if (staleSessionThresholdMinutes.present) {
      map['stale_session_threshold_minutes'] = Variable<int>(
        staleSessionThresholdMinutes.value,
      );
    }
    if (firstBackupStatus.present) {
      map['first_backup_status'] = Variable<String>(firstBackupStatus.value);
    }
    if (firstBackupMessage.present) {
      map['first_backup_message'] = Variable<String>(firstBackupMessage.value);
    }
    if (createdAtUtc.present) {
      map['created_at_utc'] = Variable<DateTime>(createdAtUtc.value);
    }
    if (completedAtUtc.present) {
      map['completed_at_utc'] = Variable<DateTime>(completedAtUtc.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppSetupStatesCompanion(')
          ..write('id: $id, ')
          ..write('installationId: $installationId, ')
          ..write('businessTimezone: $businessTimezone, ')
          ..write('setupCompleted: $setupCompleted, ')
          ..write('backupConfigured: $backupConfigured, ')
          ..write('backupIntervalMinutes: $backupIntervalMinutes, ')
          ..write(
            'staleSessionThresholdMinutes: $staleSessionThresholdMinutes, ',
          )
          ..write('firstBackupStatus: $firstBackupStatus, ')
          ..write('firstBackupMessage: $firstBackupMessage, ')
          ..write('createdAtUtc: $createdAtUtc, ')
          ..write('completedAtUtc: $completedAtUtc')
          ..write(')'))
        .toString();
  }
}

class $AdminCredentialsTable extends AdminCredentials
    with TableInfo<$AdminCredentialsTable, AdminCredential> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AdminCredentialsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _passwordPlaintextMeta = const VerificationMeta(
    'passwordPlaintext',
  );
  @override
  late final GeneratedColumn<String> passwordPlaintext =
      GeneratedColumn<String>(
        'password_plaintext',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _createdAtUtcMeta = const VerificationMeta(
    'createdAtUtc',
  );
  @override
  late final GeneratedColumn<DateTime> createdAtUtc = GeneratedColumn<DateTime>(
    'created_at_utc',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, passwordPlaintext, createdAtUtc];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'admin_credentials';
  @override
  VerificationContext validateIntegrity(
    Insertable<AdminCredential> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('password_plaintext')) {
      context.handle(
        _passwordPlaintextMeta,
        passwordPlaintext.isAcceptableOrUnknown(
          data['password_plaintext']!,
          _passwordPlaintextMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_passwordPlaintextMeta);
    }
    if (data.containsKey('created_at_utc')) {
      context.handle(
        _createdAtUtcMeta,
        createdAtUtc.isAcceptableOrUnknown(
          data['created_at_utc']!,
          _createdAtUtcMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_createdAtUtcMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AdminCredential map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AdminCredential(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      passwordPlaintext: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}password_plaintext'],
      )!,
      createdAtUtc: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at_utc'],
      )!,
    );
  }

  @override
  $AdminCredentialsTable createAlias(String alias) {
    return $AdminCredentialsTable(attachedDatabase, alias);
  }
}

class AdminCredential extends DataClass implements Insertable<AdminCredential> {
  final int id;
  final String passwordPlaintext;
  final DateTime createdAtUtc;
  const AdminCredential({
    required this.id,
    required this.passwordPlaintext,
    required this.createdAtUtc,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['password_plaintext'] = Variable<String>(passwordPlaintext);
    map['created_at_utc'] = Variable<DateTime>(createdAtUtc);
    return map;
  }

  AdminCredentialsCompanion toCompanion(bool nullToAbsent) {
    return AdminCredentialsCompanion(
      id: Value(id),
      passwordPlaintext: Value(passwordPlaintext),
      createdAtUtc: Value(createdAtUtc),
    );
  }

  factory AdminCredential.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AdminCredential(
      id: serializer.fromJson<int>(json['id']),
      passwordPlaintext: serializer.fromJson<String>(json['passwordPlaintext']),
      createdAtUtc: serializer.fromJson<DateTime>(json['createdAtUtc']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'passwordPlaintext': serializer.toJson<String>(passwordPlaintext),
      'createdAtUtc': serializer.toJson<DateTime>(createdAtUtc),
    };
  }

  AdminCredential copyWith({
    int? id,
    String? passwordPlaintext,
    DateTime? createdAtUtc,
  }) => AdminCredential(
    id: id ?? this.id,
    passwordPlaintext: passwordPlaintext ?? this.passwordPlaintext,
    createdAtUtc: createdAtUtc ?? this.createdAtUtc,
  );
  AdminCredential copyWithCompanion(AdminCredentialsCompanion data) {
    return AdminCredential(
      id: data.id.present ? data.id.value : this.id,
      passwordPlaintext: data.passwordPlaintext.present
          ? data.passwordPlaintext.value
          : this.passwordPlaintext,
      createdAtUtc: data.createdAtUtc.present
          ? data.createdAtUtc.value
          : this.createdAtUtc,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AdminCredential(')
          ..write('id: $id, ')
          ..write('passwordPlaintext: $passwordPlaintext, ')
          ..write('createdAtUtc: $createdAtUtc')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, passwordPlaintext, createdAtUtc);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AdminCredential &&
          other.id == this.id &&
          other.passwordPlaintext == this.passwordPlaintext &&
          other.createdAtUtc == this.createdAtUtc);
}

class AdminCredentialsCompanion extends UpdateCompanion<AdminCredential> {
  final Value<int> id;
  final Value<String> passwordPlaintext;
  final Value<DateTime> createdAtUtc;
  const AdminCredentialsCompanion({
    this.id = const Value.absent(),
    this.passwordPlaintext = const Value.absent(),
    this.createdAtUtc = const Value.absent(),
  });
  AdminCredentialsCompanion.insert({
    this.id = const Value.absent(),
    required String passwordPlaintext,
    required DateTime createdAtUtc,
  }) : passwordPlaintext = Value(passwordPlaintext),
       createdAtUtc = Value(createdAtUtc);
  static Insertable<AdminCredential> custom({
    Expression<int>? id,
    Expression<String>? passwordPlaintext,
    Expression<DateTime>? createdAtUtc,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (passwordPlaintext != null) 'password_plaintext': passwordPlaintext,
      if (createdAtUtc != null) 'created_at_utc': createdAtUtc,
    });
  }

  AdminCredentialsCompanion copyWith({
    Value<int>? id,
    Value<String>? passwordPlaintext,
    Value<DateTime>? createdAtUtc,
  }) {
    return AdminCredentialsCompanion(
      id: id ?? this.id,
      passwordPlaintext: passwordPlaintext ?? this.passwordPlaintext,
      createdAtUtc: createdAtUtc ?? this.createdAtUtc,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (passwordPlaintext.present) {
      map['password_plaintext'] = Variable<String>(passwordPlaintext.value);
    }
    if (createdAtUtc.present) {
      map['created_at_utc'] = Variable<DateTime>(createdAtUtc.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AdminCredentialsCompanion(')
          ..write('id: $id, ')
          ..write('passwordPlaintext: $passwordPlaintext, ')
          ..write('createdAtUtc: $createdAtUtc')
          ..write(')'))
        .toString();
  }
}

class $BackupConfigurationsTable extends BackupConfigurations
    with TableInfo<$BackupConfigurationsTable, BackupConfiguration> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BackupConfigurationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _bucketNameMeta = const VerificationMeta(
    'bucketName',
  );
  @override
  late final GeneratedColumn<String> bucketName = GeneratedColumn<String>(
    'bucket_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _bucketPrefixMeta = const VerificationMeta(
    'bucketPrefix',
  );
  @override
  late final GeneratedColumn<String> bucketPrefix = GeneratedColumn<String>(
    'bucket_prefix',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _credentialsConfiguredMeta =
      const VerificationMeta('credentialsConfigured');
  @override
  late final GeneratedColumn<bool> credentialsConfigured =
      GeneratedColumn<bool>(
        'credentials_configured',
        aliasedName,
        false,
        type: DriftSqlType.bool,
        requiredDuringInsert: false,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("credentials_configured" IN (0, 1))',
        ),
        defaultValue: const Constant(false),
      );
  static const VerificationMeta _configuredAtUtcMeta = const VerificationMeta(
    'configuredAtUtc',
  );
  @override
  late final GeneratedColumn<DateTime> configuredAtUtc =
      GeneratedColumn<DateTime>(
        'configured_at_utc',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    bucketName,
    bucketPrefix,
    credentialsConfigured,
    configuredAtUtc,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'backup_configurations';
  @override
  VerificationContext validateIntegrity(
    Insertable<BackupConfiguration> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('bucket_name')) {
      context.handle(
        _bucketNameMeta,
        bucketName.isAcceptableOrUnknown(data['bucket_name']!, _bucketNameMeta),
      );
    } else if (isInserting) {
      context.missing(_bucketNameMeta);
    }
    if (data.containsKey('bucket_prefix')) {
      context.handle(
        _bucketPrefixMeta,
        bucketPrefix.isAcceptableOrUnknown(
          data['bucket_prefix']!,
          _bucketPrefixMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_bucketPrefixMeta);
    }
    if (data.containsKey('credentials_configured')) {
      context.handle(
        _credentialsConfiguredMeta,
        credentialsConfigured.isAcceptableOrUnknown(
          data['credentials_configured']!,
          _credentialsConfiguredMeta,
        ),
      );
    }
    if (data.containsKey('configured_at_utc')) {
      context.handle(
        _configuredAtUtcMeta,
        configuredAtUtc.isAcceptableOrUnknown(
          data['configured_at_utc']!,
          _configuredAtUtcMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_configuredAtUtcMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BackupConfiguration map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BackupConfiguration(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      bucketName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}bucket_name'],
      )!,
      bucketPrefix: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}bucket_prefix'],
      )!,
      credentialsConfigured: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}credentials_configured'],
      )!,
      configuredAtUtc: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}configured_at_utc'],
      )!,
    );
  }

  @override
  $BackupConfigurationsTable createAlias(String alias) {
    return $BackupConfigurationsTable(attachedDatabase, alias);
  }
}

class BackupConfiguration extends DataClass
    implements Insertable<BackupConfiguration> {
  final int id;
  final String bucketName;
  final String bucketPrefix;
  final bool credentialsConfigured;
  final DateTime configuredAtUtc;
  const BackupConfiguration({
    required this.id,
    required this.bucketName,
    required this.bucketPrefix,
    required this.credentialsConfigured,
    required this.configuredAtUtc,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['bucket_name'] = Variable<String>(bucketName);
    map['bucket_prefix'] = Variable<String>(bucketPrefix);
    map['credentials_configured'] = Variable<bool>(credentialsConfigured);
    map['configured_at_utc'] = Variable<DateTime>(configuredAtUtc);
    return map;
  }

  BackupConfigurationsCompanion toCompanion(bool nullToAbsent) {
    return BackupConfigurationsCompanion(
      id: Value(id),
      bucketName: Value(bucketName),
      bucketPrefix: Value(bucketPrefix),
      credentialsConfigured: Value(credentialsConfigured),
      configuredAtUtc: Value(configuredAtUtc),
    );
  }

  factory BackupConfiguration.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BackupConfiguration(
      id: serializer.fromJson<int>(json['id']),
      bucketName: serializer.fromJson<String>(json['bucketName']),
      bucketPrefix: serializer.fromJson<String>(json['bucketPrefix']),
      credentialsConfigured: serializer.fromJson<bool>(
        json['credentialsConfigured'],
      ),
      configuredAtUtc: serializer.fromJson<DateTime>(json['configuredAtUtc']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'bucketName': serializer.toJson<String>(bucketName),
      'bucketPrefix': serializer.toJson<String>(bucketPrefix),
      'credentialsConfigured': serializer.toJson<bool>(credentialsConfigured),
      'configuredAtUtc': serializer.toJson<DateTime>(configuredAtUtc),
    };
  }

  BackupConfiguration copyWith({
    int? id,
    String? bucketName,
    String? bucketPrefix,
    bool? credentialsConfigured,
    DateTime? configuredAtUtc,
  }) => BackupConfiguration(
    id: id ?? this.id,
    bucketName: bucketName ?? this.bucketName,
    bucketPrefix: bucketPrefix ?? this.bucketPrefix,
    credentialsConfigured: credentialsConfigured ?? this.credentialsConfigured,
    configuredAtUtc: configuredAtUtc ?? this.configuredAtUtc,
  );
  BackupConfiguration copyWithCompanion(BackupConfigurationsCompanion data) {
    return BackupConfiguration(
      id: data.id.present ? data.id.value : this.id,
      bucketName: data.bucketName.present
          ? data.bucketName.value
          : this.bucketName,
      bucketPrefix: data.bucketPrefix.present
          ? data.bucketPrefix.value
          : this.bucketPrefix,
      credentialsConfigured: data.credentialsConfigured.present
          ? data.credentialsConfigured.value
          : this.credentialsConfigured,
      configuredAtUtc: data.configuredAtUtc.present
          ? data.configuredAtUtc.value
          : this.configuredAtUtc,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BackupConfiguration(')
          ..write('id: $id, ')
          ..write('bucketName: $bucketName, ')
          ..write('bucketPrefix: $bucketPrefix, ')
          ..write('credentialsConfigured: $credentialsConfigured, ')
          ..write('configuredAtUtc: $configuredAtUtc')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    bucketName,
    bucketPrefix,
    credentialsConfigured,
    configuredAtUtc,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BackupConfiguration &&
          other.id == this.id &&
          other.bucketName == this.bucketName &&
          other.bucketPrefix == this.bucketPrefix &&
          other.credentialsConfigured == this.credentialsConfigured &&
          other.configuredAtUtc == this.configuredAtUtc);
}

class BackupConfigurationsCompanion
    extends UpdateCompanion<BackupConfiguration> {
  final Value<int> id;
  final Value<String> bucketName;
  final Value<String> bucketPrefix;
  final Value<bool> credentialsConfigured;
  final Value<DateTime> configuredAtUtc;
  const BackupConfigurationsCompanion({
    this.id = const Value.absent(),
    this.bucketName = const Value.absent(),
    this.bucketPrefix = const Value.absent(),
    this.credentialsConfigured = const Value.absent(),
    this.configuredAtUtc = const Value.absent(),
  });
  BackupConfigurationsCompanion.insert({
    this.id = const Value.absent(),
    required String bucketName,
    required String bucketPrefix,
    this.credentialsConfigured = const Value.absent(),
    required DateTime configuredAtUtc,
  }) : bucketName = Value(bucketName),
       bucketPrefix = Value(bucketPrefix),
       configuredAtUtc = Value(configuredAtUtc);
  static Insertable<BackupConfiguration> custom({
    Expression<int>? id,
    Expression<String>? bucketName,
    Expression<String>? bucketPrefix,
    Expression<bool>? credentialsConfigured,
    Expression<DateTime>? configuredAtUtc,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (bucketName != null) 'bucket_name': bucketName,
      if (bucketPrefix != null) 'bucket_prefix': bucketPrefix,
      if (credentialsConfigured != null)
        'credentials_configured': credentialsConfigured,
      if (configuredAtUtc != null) 'configured_at_utc': configuredAtUtc,
    });
  }

  BackupConfigurationsCompanion copyWith({
    Value<int>? id,
    Value<String>? bucketName,
    Value<String>? bucketPrefix,
    Value<bool>? credentialsConfigured,
    Value<DateTime>? configuredAtUtc,
  }) {
    return BackupConfigurationsCompanion(
      id: id ?? this.id,
      bucketName: bucketName ?? this.bucketName,
      bucketPrefix: bucketPrefix ?? this.bucketPrefix,
      credentialsConfigured:
          credentialsConfigured ?? this.credentialsConfigured,
      configuredAtUtc: configuredAtUtc ?? this.configuredAtUtc,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (bucketName.present) {
      map['bucket_name'] = Variable<String>(bucketName.value);
    }
    if (bucketPrefix.present) {
      map['bucket_prefix'] = Variable<String>(bucketPrefix.value);
    }
    if (credentialsConfigured.present) {
      map['credentials_configured'] = Variable<bool>(
        credentialsConfigured.value,
      );
    }
    if (configuredAtUtc.present) {
      map['configured_at_utc'] = Variable<DateTime>(configuredAtUtc.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BackupConfigurationsCompanion(')
          ..write('id: $id, ')
          ..write('bucketName: $bucketName, ')
          ..write('bucketPrefix: $bucketPrefix, ')
          ..write('credentialsConfigured: $credentialsConfigured, ')
          ..write('configuredAtUtc: $configuredAtUtc')
          ..write(')'))
        .toString();
  }
}

class $BackupRunsTable extends BackupRuns
    with TableInfo<$BackupRunsTable, BackupRun> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BackupRunsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _runTypeMeta = const VerificationMeta(
    'runType',
  );
  @override
  late final GeneratedColumn<String> runType = GeneratedColumn<String>(
    'run_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _messageMeta = const VerificationMeta(
    'message',
  );
  @override
  late final GeneratedColumn<String> message = GeneratedColumn<String>(
    'message',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _startedAtUtcMeta = const VerificationMeta(
    'startedAtUtc',
  );
  @override
  late final GeneratedColumn<DateTime> startedAtUtc = GeneratedColumn<DateTime>(
    'started_at_utc',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _completedAtUtcMeta = const VerificationMeta(
    'completedAtUtc',
  );
  @override
  late final GeneratedColumn<DateTime> completedAtUtc =
      GeneratedColumn<DateTime>(
        'completed_at_utc',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    runType,
    status,
    message,
    startedAtUtc,
    completedAtUtc,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'backup_runs';
  @override
  VerificationContext validateIntegrity(
    Insertable<BackupRun> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('run_type')) {
      context.handle(
        _runTypeMeta,
        runType.isAcceptableOrUnknown(data['run_type']!, _runTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_runTypeMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('message')) {
      context.handle(
        _messageMeta,
        message.isAcceptableOrUnknown(data['message']!, _messageMeta),
      );
    }
    if (data.containsKey('started_at_utc')) {
      context.handle(
        _startedAtUtcMeta,
        startedAtUtc.isAcceptableOrUnknown(
          data['started_at_utc']!,
          _startedAtUtcMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_startedAtUtcMeta);
    }
    if (data.containsKey('completed_at_utc')) {
      context.handle(
        _completedAtUtcMeta,
        completedAtUtc.isAcceptableOrUnknown(
          data['completed_at_utc']!,
          _completedAtUtcMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_completedAtUtcMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BackupRun map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BackupRun(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      runType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}run_type'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      message: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}message'],
      ),
      startedAtUtc: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}started_at_utc'],
      )!,
      completedAtUtc: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}completed_at_utc'],
      )!,
    );
  }

  @override
  $BackupRunsTable createAlias(String alias) {
    return $BackupRunsTable(attachedDatabase, alias);
  }
}

class BackupRun extends DataClass implements Insertable<BackupRun> {
  final int id;
  final String runType;
  final String status;
  final String? message;
  final DateTime startedAtUtc;
  final DateTime completedAtUtc;
  const BackupRun({
    required this.id,
    required this.runType,
    required this.status,
    this.message,
    required this.startedAtUtc,
    required this.completedAtUtc,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['run_type'] = Variable<String>(runType);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || message != null) {
      map['message'] = Variable<String>(message);
    }
    map['started_at_utc'] = Variable<DateTime>(startedAtUtc);
    map['completed_at_utc'] = Variable<DateTime>(completedAtUtc);
    return map;
  }

  BackupRunsCompanion toCompanion(bool nullToAbsent) {
    return BackupRunsCompanion(
      id: Value(id),
      runType: Value(runType),
      status: Value(status),
      message: message == null && nullToAbsent
          ? const Value.absent()
          : Value(message),
      startedAtUtc: Value(startedAtUtc),
      completedAtUtc: Value(completedAtUtc),
    );
  }

  factory BackupRun.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BackupRun(
      id: serializer.fromJson<int>(json['id']),
      runType: serializer.fromJson<String>(json['runType']),
      status: serializer.fromJson<String>(json['status']),
      message: serializer.fromJson<String?>(json['message']),
      startedAtUtc: serializer.fromJson<DateTime>(json['startedAtUtc']),
      completedAtUtc: serializer.fromJson<DateTime>(json['completedAtUtc']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'runType': serializer.toJson<String>(runType),
      'status': serializer.toJson<String>(status),
      'message': serializer.toJson<String?>(message),
      'startedAtUtc': serializer.toJson<DateTime>(startedAtUtc),
      'completedAtUtc': serializer.toJson<DateTime>(completedAtUtc),
    };
  }

  BackupRun copyWith({
    int? id,
    String? runType,
    String? status,
    Value<String?> message = const Value.absent(),
    DateTime? startedAtUtc,
    DateTime? completedAtUtc,
  }) => BackupRun(
    id: id ?? this.id,
    runType: runType ?? this.runType,
    status: status ?? this.status,
    message: message.present ? message.value : this.message,
    startedAtUtc: startedAtUtc ?? this.startedAtUtc,
    completedAtUtc: completedAtUtc ?? this.completedAtUtc,
  );
  BackupRun copyWithCompanion(BackupRunsCompanion data) {
    return BackupRun(
      id: data.id.present ? data.id.value : this.id,
      runType: data.runType.present ? data.runType.value : this.runType,
      status: data.status.present ? data.status.value : this.status,
      message: data.message.present ? data.message.value : this.message,
      startedAtUtc: data.startedAtUtc.present
          ? data.startedAtUtc.value
          : this.startedAtUtc,
      completedAtUtc: data.completedAtUtc.present
          ? data.completedAtUtc.value
          : this.completedAtUtc,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BackupRun(')
          ..write('id: $id, ')
          ..write('runType: $runType, ')
          ..write('status: $status, ')
          ..write('message: $message, ')
          ..write('startedAtUtc: $startedAtUtc, ')
          ..write('completedAtUtc: $completedAtUtc')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, runType, status, message, startedAtUtc, completedAtUtc);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BackupRun &&
          other.id == this.id &&
          other.runType == this.runType &&
          other.status == this.status &&
          other.message == this.message &&
          other.startedAtUtc == this.startedAtUtc &&
          other.completedAtUtc == this.completedAtUtc);
}

class BackupRunsCompanion extends UpdateCompanion<BackupRun> {
  final Value<int> id;
  final Value<String> runType;
  final Value<String> status;
  final Value<String?> message;
  final Value<DateTime> startedAtUtc;
  final Value<DateTime> completedAtUtc;
  const BackupRunsCompanion({
    this.id = const Value.absent(),
    this.runType = const Value.absent(),
    this.status = const Value.absent(),
    this.message = const Value.absent(),
    this.startedAtUtc = const Value.absent(),
    this.completedAtUtc = const Value.absent(),
  });
  BackupRunsCompanion.insert({
    this.id = const Value.absent(),
    required String runType,
    required String status,
    this.message = const Value.absent(),
    required DateTime startedAtUtc,
    required DateTime completedAtUtc,
  }) : runType = Value(runType),
       status = Value(status),
       startedAtUtc = Value(startedAtUtc),
       completedAtUtc = Value(completedAtUtc);
  static Insertable<BackupRun> custom({
    Expression<int>? id,
    Expression<String>? runType,
    Expression<String>? status,
    Expression<String>? message,
    Expression<DateTime>? startedAtUtc,
    Expression<DateTime>? completedAtUtc,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (runType != null) 'run_type': runType,
      if (status != null) 'status': status,
      if (message != null) 'message': message,
      if (startedAtUtc != null) 'started_at_utc': startedAtUtc,
      if (completedAtUtc != null) 'completed_at_utc': completedAtUtc,
    });
  }

  BackupRunsCompanion copyWith({
    Value<int>? id,
    Value<String>? runType,
    Value<String>? status,
    Value<String?>? message,
    Value<DateTime>? startedAtUtc,
    Value<DateTime>? completedAtUtc,
  }) {
    return BackupRunsCompanion(
      id: id ?? this.id,
      runType: runType ?? this.runType,
      status: status ?? this.status,
      message: message ?? this.message,
      startedAtUtc: startedAtUtc ?? this.startedAtUtc,
      completedAtUtc: completedAtUtc ?? this.completedAtUtc,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (runType.present) {
      map['run_type'] = Variable<String>(runType.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (message.present) {
      map['message'] = Variable<String>(message.value);
    }
    if (startedAtUtc.present) {
      map['started_at_utc'] = Variable<DateTime>(startedAtUtc.value);
    }
    if (completedAtUtc.present) {
      map['completed_at_utc'] = Variable<DateTime>(completedAtUtc.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BackupRunsCompanion(')
          ..write('id: $id, ')
          ..write('runType: $runType, ')
          ..write('status: $status, ')
          ..write('message: $message, ')
          ..write('startedAtUtc: $startedAtUtc, ')
          ..write('completedAtUtc: $completedAtUtc')
          ..write(')'))
        .toString();
  }
}

class $ProductsTable extends Products with TableInfo<$ProductsTable, Product> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _priceSypMeta = const VerificationMeta(
    'priceSyp',
  );
  @override
  late final GeneratedColumn<int> priceSyp = GeneratedColumn<int>(
    'price_syp',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lowStockThresholdMeta = const VerificationMeta(
    'lowStockThreshold',
  );
  @override
  late final GeneratedColumn<int> lowStockThreshold = GeneratedColumn<int>(
    'low_stock_threshold',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _activeMeta = const VerificationMeta('active');
  @override
  late final GeneratedColumn<bool> active = GeneratedColumn<bool>(
    'active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _createdAtUtcMeta = const VerificationMeta(
    'createdAtUtc',
  );
  @override
  late final GeneratedColumn<DateTime> createdAtUtc = GeneratedColumn<DateTime>(
    'created_at_utc',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtUtcMeta = const VerificationMeta(
    'updatedAtUtc',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAtUtc = GeneratedColumn<DateTime>(
    'updated_at_utc',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    code,
    name,
    priceSyp,
    lowStockThreshold,
    active,
    createdAtUtc,
    updatedAtUtc,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'products';
  @override
  VerificationContext validateIntegrity(
    Insertable<Product> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('price_syp')) {
      context.handle(
        _priceSypMeta,
        priceSyp.isAcceptableOrUnknown(data['price_syp']!, _priceSypMeta),
      );
    } else if (isInserting) {
      context.missing(_priceSypMeta);
    }
    if (data.containsKey('low_stock_threshold')) {
      context.handle(
        _lowStockThresholdMeta,
        lowStockThreshold.isAcceptableOrUnknown(
          data['low_stock_threshold']!,
          _lowStockThresholdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_lowStockThresholdMeta);
    }
    if (data.containsKey('active')) {
      context.handle(
        _activeMeta,
        active.isAcceptableOrUnknown(data['active']!, _activeMeta),
      );
    }
    if (data.containsKey('created_at_utc')) {
      context.handle(
        _createdAtUtcMeta,
        createdAtUtc.isAcceptableOrUnknown(
          data['created_at_utc']!,
          _createdAtUtcMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_createdAtUtcMeta);
    }
    if (data.containsKey('updated_at_utc')) {
      context.handle(
        _updatedAtUtcMeta,
        updatedAtUtc.isAcceptableOrUnknown(
          data['updated_at_utc']!,
          _updatedAtUtcMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_updatedAtUtcMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Product map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Product(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      priceSyp: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}price_syp'],
      )!,
      lowStockThreshold: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}low_stock_threshold'],
      )!,
      active: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}active'],
      )!,
      createdAtUtc: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at_utc'],
      )!,
      updatedAtUtc: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at_utc'],
      )!,
    );
  }

  @override
  $ProductsTable createAlias(String alias) {
    return $ProductsTable(attachedDatabase, alias);
  }
}

class Product extends DataClass implements Insertable<Product> {
  final int id;
  final String code;
  final String name;
  final int priceSyp;
  final int lowStockThreshold;
  final bool active;
  final DateTime createdAtUtc;
  final DateTime updatedAtUtc;
  const Product({
    required this.id,
    required this.code,
    required this.name,
    required this.priceSyp,
    required this.lowStockThreshold,
    required this.active,
    required this.createdAtUtc,
    required this.updatedAtUtc,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['code'] = Variable<String>(code);
    map['name'] = Variable<String>(name);
    map['price_syp'] = Variable<int>(priceSyp);
    map['low_stock_threshold'] = Variable<int>(lowStockThreshold);
    map['active'] = Variable<bool>(active);
    map['created_at_utc'] = Variable<DateTime>(createdAtUtc);
    map['updated_at_utc'] = Variable<DateTime>(updatedAtUtc);
    return map;
  }

  ProductsCompanion toCompanion(bool nullToAbsent) {
    return ProductsCompanion(
      id: Value(id),
      code: Value(code),
      name: Value(name),
      priceSyp: Value(priceSyp),
      lowStockThreshold: Value(lowStockThreshold),
      active: Value(active),
      createdAtUtc: Value(createdAtUtc),
      updatedAtUtc: Value(updatedAtUtc),
    );
  }

  factory Product.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Product(
      id: serializer.fromJson<int>(json['id']),
      code: serializer.fromJson<String>(json['code']),
      name: serializer.fromJson<String>(json['name']),
      priceSyp: serializer.fromJson<int>(json['priceSyp']),
      lowStockThreshold: serializer.fromJson<int>(json['lowStockThreshold']),
      active: serializer.fromJson<bool>(json['active']),
      createdAtUtc: serializer.fromJson<DateTime>(json['createdAtUtc']),
      updatedAtUtc: serializer.fromJson<DateTime>(json['updatedAtUtc']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'code': serializer.toJson<String>(code),
      'name': serializer.toJson<String>(name),
      'priceSyp': serializer.toJson<int>(priceSyp),
      'lowStockThreshold': serializer.toJson<int>(lowStockThreshold),
      'active': serializer.toJson<bool>(active),
      'createdAtUtc': serializer.toJson<DateTime>(createdAtUtc),
      'updatedAtUtc': serializer.toJson<DateTime>(updatedAtUtc),
    };
  }

  Product copyWith({
    int? id,
    String? code,
    String? name,
    int? priceSyp,
    int? lowStockThreshold,
    bool? active,
    DateTime? createdAtUtc,
    DateTime? updatedAtUtc,
  }) => Product(
    id: id ?? this.id,
    code: code ?? this.code,
    name: name ?? this.name,
    priceSyp: priceSyp ?? this.priceSyp,
    lowStockThreshold: lowStockThreshold ?? this.lowStockThreshold,
    active: active ?? this.active,
    createdAtUtc: createdAtUtc ?? this.createdAtUtc,
    updatedAtUtc: updatedAtUtc ?? this.updatedAtUtc,
  );
  Product copyWithCompanion(ProductsCompanion data) {
    return Product(
      id: data.id.present ? data.id.value : this.id,
      code: data.code.present ? data.code.value : this.code,
      name: data.name.present ? data.name.value : this.name,
      priceSyp: data.priceSyp.present ? data.priceSyp.value : this.priceSyp,
      lowStockThreshold: data.lowStockThreshold.present
          ? data.lowStockThreshold.value
          : this.lowStockThreshold,
      active: data.active.present ? data.active.value : this.active,
      createdAtUtc: data.createdAtUtc.present
          ? data.createdAtUtc.value
          : this.createdAtUtc,
      updatedAtUtc: data.updatedAtUtc.present
          ? data.updatedAtUtc.value
          : this.updatedAtUtc,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Product(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('priceSyp: $priceSyp, ')
          ..write('lowStockThreshold: $lowStockThreshold, ')
          ..write('active: $active, ')
          ..write('createdAtUtc: $createdAtUtc, ')
          ..write('updatedAtUtc: $updatedAtUtc')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    code,
    name,
    priceSyp,
    lowStockThreshold,
    active,
    createdAtUtc,
    updatedAtUtc,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Product &&
          other.id == this.id &&
          other.code == this.code &&
          other.name == this.name &&
          other.priceSyp == this.priceSyp &&
          other.lowStockThreshold == this.lowStockThreshold &&
          other.active == this.active &&
          other.createdAtUtc == this.createdAtUtc &&
          other.updatedAtUtc == this.updatedAtUtc);
}

class ProductsCompanion extends UpdateCompanion<Product> {
  final Value<int> id;
  final Value<String> code;
  final Value<String> name;
  final Value<int> priceSyp;
  final Value<int> lowStockThreshold;
  final Value<bool> active;
  final Value<DateTime> createdAtUtc;
  final Value<DateTime> updatedAtUtc;
  const ProductsCompanion({
    this.id = const Value.absent(),
    this.code = const Value.absent(),
    this.name = const Value.absent(),
    this.priceSyp = const Value.absent(),
    this.lowStockThreshold = const Value.absent(),
    this.active = const Value.absent(),
    this.createdAtUtc = const Value.absent(),
    this.updatedAtUtc = const Value.absent(),
  });
  ProductsCompanion.insert({
    this.id = const Value.absent(),
    required String code,
    required String name,
    required int priceSyp,
    required int lowStockThreshold,
    this.active = const Value.absent(),
    required DateTime createdAtUtc,
    required DateTime updatedAtUtc,
  }) : code = Value(code),
       name = Value(name),
       priceSyp = Value(priceSyp),
       lowStockThreshold = Value(lowStockThreshold),
       createdAtUtc = Value(createdAtUtc),
       updatedAtUtc = Value(updatedAtUtc);
  static Insertable<Product> custom({
    Expression<int>? id,
    Expression<String>? code,
    Expression<String>? name,
    Expression<int>? priceSyp,
    Expression<int>? lowStockThreshold,
    Expression<bool>? active,
    Expression<DateTime>? createdAtUtc,
    Expression<DateTime>? updatedAtUtc,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (code != null) 'code': code,
      if (name != null) 'name': name,
      if (priceSyp != null) 'price_syp': priceSyp,
      if (lowStockThreshold != null) 'low_stock_threshold': lowStockThreshold,
      if (active != null) 'active': active,
      if (createdAtUtc != null) 'created_at_utc': createdAtUtc,
      if (updatedAtUtc != null) 'updated_at_utc': updatedAtUtc,
    });
  }

  ProductsCompanion copyWith({
    Value<int>? id,
    Value<String>? code,
    Value<String>? name,
    Value<int>? priceSyp,
    Value<int>? lowStockThreshold,
    Value<bool>? active,
    Value<DateTime>? createdAtUtc,
    Value<DateTime>? updatedAtUtc,
  }) {
    return ProductsCompanion(
      id: id ?? this.id,
      code: code ?? this.code,
      name: name ?? this.name,
      priceSyp: priceSyp ?? this.priceSyp,
      lowStockThreshold: lowStockThreshold ?? this.lowStockThreshold,
      active: active ?? this.active,
      createdAtUtc: createdAtUtc ?? this.createdAtUtc,
      updatedAtUtc: updatedAtUtc ?? this.updatedAtUtc,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (priceSyp.present) {
      map['price_syp'] = Variable<int>(priceSyp.value);
    }
    if (lowStockThreshold.present) {
      map['low_stock_threshold'] = Variable<int>(lowStockThreshold.value);
    }
    if (active.present) {
      map['active'] = Variable<bool>(active.value);
    }
    if (createdAtUtc.present) {
      map['created_at_utc'] = Variable<DateTime>(createdAtUtc.value);
    }
    if (updatedAtUtc.present) {
      map['updated_at_utc'] = Variable<DateTime>(updatedAtUtc.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductsCompanion(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('priceSyp: $priceSyp, ')
          ..write('lowStockThreshold: $lowStockThreshold, ')
          ..write('active: $active, ')
          ..write('createdAtUtc: $createdAtUtc, ')
          ..write('updatedAtUtc: $updatedAtUtc')
          ..write(')'))
        .toString();
  }
}

class $InventoryMovementsTable extends InventoryMovements
    with TableInfo<$InventoryMovementsTable, InventoryMovement> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InventoryMovementsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _productIdMeta = const VerificationMeta(
    'productId',
  );
  @override
  late final GeneratedColumn<int> productId = GeneratedColumn<int>(
    'product_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES products (id)',
    ),
  );
  static const VerificationMeta _quantityDeltaMeta = const VerificationMeta(
    'quantityDelta',
  );
  @override
  late final GeneratedColumn<int> quantityDelta = GeneratedColumn<int>(
    'quantity_delta',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _reasonMeta = const VerificationMeta('reason');
  @override
  late final GeneratedColumn<String> reason = GeneratedColumn<String>(
    'reason',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtUtcMeta = const VerificationMeta(
    'createdAtUtc',
  );
  @override
  late final GeneratedColumn<DateTime> createdAtUtc = GeneratedColumn<DateTime>(
    'created_at_utc',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    productId,
    quantityDelta,
    reason,
    createdAtUtc,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'inventory_movements';
  @override
  VerificationContext validateIntegrity(
    Insertable<InventoryMovement> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('product_id')) {
      context.handle(
        _productIdMeta,
        productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta),
      );
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('quantity_delta')) {
      context.handle(
        _quantityDeltaMeta,
        quantityDelta.isAcceptableOrUnknown(
          data['quantity_delta']!,
          _quantityDeltaMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_quantityDeltaMeta);
    }
    if (data.containsKey('reason')) {
      context.handle(
        _reasonMeta,
        reason.isAcceptableOrUnknown(data['reason']!, _reasonMeta),
      );
    } else if (isInserting) {
      context.missing(_reasonMeta);
    }
    if (data.containsKey('created_at_utc')) {
      context.handle(
        _createdAtUtcMeta,
        createdAtUtc.isAcceptableOrUnknown(
          data['created_at_utc']!,
          _createdAtUtcMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_createdAtUtcMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  InventoryMovement map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InventoryMovement(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      productId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}product_id'],
      )!,
      quantityDelta: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}quantity_delta'],
      )!,
      reason: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reason'],
      )!,
      createdAtUtc: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at_utc'],
      )!,
    );
  }

  @override
  $InventoryMovementsTable createAlias(String alias) {
    return $InventoryMovementsTable(attachedDatabase, alias);
  }
}

class InventoryMovement extends DataClass
    implements Insertable<InventoryMovement> {
  final int id;
  final int productId;
  final int quantityDelta;
  final String reason;
  final DateTime createdAtUtc;
  const InventoryMovement({
    required this.id,
    required this.productId,
    required this.quantityDelta,
    required this.reason,
    required this.createdAtUtc,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['product_id'] = Variable<int>(productId);
    map['quantity_delta'] = Variable<int>(quantityDelta);
    map['reason'] = Variable<String>(reason);
    map['created_at_utc'] = Variable<DateTime>(createdAtUtc);
    return map;
  }

  InventoryMovementsCompanion toCompanion(bool nullToAbsent) {
    return InventoryMovementsCompanion(
      id: Value(id),
      productId: Value(productId),
      quantityDelta: Value(quantityDelta),
      reason: Value(reason),
      createdAtUtc: Value(createdAtUtc),
    );
  }

  factory InventoryMovement.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InventoryMovement(
      id: serializer.fromJson<int>(json['id']),
      productId: serializer.fromJson<int>(json['productId']),
      quantityDelta: serializer.fromJson<int>(json['quantityDelta']),
      reason: serializer.fromJson<String>(json['reason']),
      createdAtUtc: serializer.fromJson<DateTime>(json['createdAtUtc']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'productId': serializer.toJson<int>(productId),
      'quantityDelta': serializer.toJson<int>(quantityDelta),
      'reason': serializer.toJson<String>(reason),
      'createdAtUtc': serializer.toJson<DateTime>(createdAtUtc),
    };
  }

  InventoryMovement copyWith({
    int? id,
    int? productId,
    int? quantityDelta,
    String? reason,
    DateTime? createdAtUtc,
  }) => InventoryMovement(
    id: id ?? this.id,
    productId: productId ?? this.productId,
    quantityDelta: quantityDelta ?? this.quantityDelta,
    reason: reason ?? this.reason,
    createdAtUtc: createdAtUtc ?? this.createdAtUtc,
  );
  InventoryMovement copyWithCompanion(InventoryMovementsCompanion data) {
    return InventoryMovement(
      id: data.id.present ? data.id.value : this.id,
      productId: data.productId.present ? data.productId.value : this.productId,
      quantityDelta: data.quantityDelta.present
          ? data.quantityDelta.value
          : this.quantityDelta,
      reason: data.reason.present ? data.reason.value : this.reason,
      createdAtUtc: data.createdAtUtc.present
          ? data.createdAtUtc.value
          : this.createdAtUtc,
    );
  }

  @override
  String toString() {
    return (StringBuffer('InventoryMovement(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('quantityDelta: $quantityDelta, ')
          ..write('reason: $reason, ')
          ..write('createdAtUtc: $createdAtUtc')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, productId, quantityDelta, reason, createdAtUtc);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InventoryMovement &&
          other.id == this.id &&
          other.productId == this.productId &&
          other.quantityDelta == this.quantityDelta &&
          other.reason == this.reason &&
          other.createdAtUtc == this.createdAtUtc);
}

class InventoryMovementsCompanion extends UpdateCompanion<InventoryMovement> {
  final Value<int> id;
  final Value<int> productId;
  final Value<int> quantityDelta;
  final Value<String> reason;
  final Value<DateTime> createdAtUtc;
  const InventoryMovementsCompanion({
    this.id = const Value.absent(),
    this.productId = const Value.absent(),
    this.quantityDelta = const Value.absent(),
    this.reason = const Value.absent(),
    this.createdAtUtc = const Value.absent(),
  });
  InventoryMovementsCompanion.insert({
    this.id = const Value.absent(),
    required int productId,
    required int quantityDelta,
    required String reason,
    required DateTime createdAtUtc,
  }) : productId = Value(productId),
       quantityDelta = Value(quantityDelta),
       reason = Value(reason),
       createdAtUtc = Value(createdAtUtc);
  static Insertable<InventoryMovement> custom({
    Expression<int>? id,
    Expression<int>? productId,
    Expression<int>? quantityDelta,
    Expression<String>? reason,
    Expression<DateTime>? createdAtUtc,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (productId != null) 'product_id': productId,
      if (quantityDelta != null) 'quantity_delta': quantityDelta,
      if (reason != null) 'reason': reason,
      if (createdAtUtc != null) 'created_at_utc': createdAtUtc,
    });
  }

  InventoryMovementsCompanion copyWith({
    Value<int>? id,
    Value<int>? productId,
    Value<int>? quantityDelta,
    Value<String>? reason,
    Value<DateTime>? createdAtUtc,
  }) {
    return InventoryMovementsCompanion(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      quantityDelta: quantityDelta ?? this.quantityDelta,
      reason: reason ?? this.reason,
      createdAtUtc: createdAtUtc ?? this.createdAtUtc,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<int>(productId.value);
    }
    if (quantityDelta.present) {
      map['quantity_delta'] = Variable<int>(quantityDelta.value);
    }
    if (reason.present) {
      map['reason'] = Variable<String>(reason.value);
    }
    if (createdAtUtc.present) {
      map['created_at_utc'] = Variable<DateTime>(createdAtUtc.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InventoryMovementsCompanion(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('quantityDelta: $quantityDelta, ')
          ..write('reason: $reason, ')
          ..write('createdAtUtc: $createdAtUtc')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $AppSetupStatesTable appSetupStates = $AppSetupStatesTable(this);
  late final $AdminCredentialsTable adminCredentials = $AdminCredentialsTable(
    this,
  );
  late final $BackupConfigurationsTable backupConfigurations =
      $BackupConfigurationsTable(this);
  late final $BackupRunsTable backupRuns = $BackupRunsTable(this);
  late final $ProductsTable products = $ProductsTable(this);
  late final $InventoryMovementsTable inventoryMovements =
      $InventoryMovementsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    appSetupStates,
    adminCredentials,
    backupConfigurations,
    backupRuns,
    products,
    inventoryMovements,
  ];
}

typedef $$AppSetupStatesTableCreateCompanionBuilder =
    AppSetupStatesCompanion Function({
      Value<int> id,
      required String installationId,
      Value<String> businessTimezone,
      Value<bool> setupCompleted,
      Value<bool> backupConfigured,
      Value<int> backupIntervalMinutes,
      Value<int> staleSessionThresholdMinutes,
      Value<String?> firstBackupStatus,
      Value<String?> firstBackupMessage,
      required DateTime createdAtUtc,
      Value<DateTime?> completedAtUtc,
    });
typedef $$AppSetupStatesTableUpdateCompanionBuilder =
    AppSetupStatesCompanion Function({
      Value<int> id,
      Value<String> installationId,
      Value<String> businessTimezone,
      Value<bool> setupCompleted,
      Value<bool> backupConfigured,
      Value<int> backupIntervalMinutes,
      Value<int> staleSessionThresholdMinutes,
      Value<String?> firstBackupStatus,
      Value<String?> firstBackupMessage,
      Value<DateTime> createdAtUtc,
      Value<DateTime?> completedAtUtc,
    });

class $$AppSetupStatesTableFilterComposer
    extends Composer<_$AppDatabase, $AppSetupStatesTable> {
  $$AppSetupStatesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get installationId => $composableBuilder(
    column: $table.installationId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get businessTimezone => $composableBuilder(
    column: $table.businessTimezone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get setupCompleted => $composableBuilder(
    column: $table.setupCompleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get backupConfigured => $composableBuilder(
    column: $table.backupConfigured,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get backupIntervalMinutes => $composableBuilder(
    column: $table.backupIntervalMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get staleSessionThresholdMinutes => $composableBuilder(
    column: $table.staleSessionThresholdMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get firstBackupStatus => $composableBuilder(
    column: $table.firstBackupStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get firstBackupMessage => $composableBuilder(
    column: $table.firstBackupMessage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAtUtc => $composableBuilder(
    column: $table.createdAtUtc,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get completedAtUtc => $composableBuilder(
    column: $table.completedAtUtc,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AppSetupStatesTableOrderingComposer
    extends Composer<_$AppDatabase, $AppSetupStatesTable> {
  $$AppSetupStatesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get installationId => $composableBuilder(
    column: $table.installationId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get businessTimezone => $composableBuilder(
    column: $table.businessTimezone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get setupCompleted => $composableBuilder(
    column: $table.setupCompleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get backupConfigured => $composableBuilder(
    column: $table.backupConfigured,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get backupIntervalMinutes => $composableBuilder(
    column: $table.backupIntervalMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get staleSessionThresholdMinutes => $composableBuilder(
    column: $table.staleSessionThresholdMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get firstBackupStatus => $composableBuilder(
    column: $table.firstBackupStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get firstBackupMessage => $composableBuilder(
    column: $table.firstBackupMessage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAtUtc => $composableBuilder(
    column: $table.createdAtUtc,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get completedAtUtc => $composableBuilder(
    column: $table.completedAtUtc,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AppSetupStatesTableAnnotationComposer
    extends Composer<_$AppDatabase, $AppSetupStatesTable> {
  $$AppSetupStatesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get installationId => $composableBuilder(
    column: $table.installationId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get businessTimezone => $composableBuilder(
    column: $table.businessTimezone,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get setupCompleted => $composableBuilder(
    column: $table.setupCompleted,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get backupConfigured => $composableBuilder(
    column: $table.backupConfigured,
    builder: (column) => column,
  );

  GeneratedColumn<int> get backupIntervalMinutes => $composableBuilder(
    column: $table.backupIntervalMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<int> get staleSessionThresholdMinutes => $composableBuilder(
    column: $table.staleSessionThresholdMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<String> get firstBackupStatus => $composableBuilder(
    column: $table.firstBackupStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get firstBackupMessage => $composableBuilder(
    column: $table.firstBackupMessage,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAtUtc => $composableBuilder(
    column: $table.createdAtUtc,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get completedAtUtc => $composableBuilder(
    column: $table.completedAtUtc,
    builder: (column) => column,
  );
}

class $$AppSetupStatesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AppSetupStatesTable,
          AppSetupState,
          $$AppSetupStatesTableFilterComposer,
          $$AppSetupStatesTableOrderingComposer,
          $$AppSetupStatesTableAnnotationComposer,
          $$AppSetupStatesTableCreateCompanionBuilder,
          $$AppSetupStatesTableUpdateCompanionBuilder,
          (
            AppSetupState,
            BaseReferences<_$AppDatabase, $AppSetupStatesTable, AppSetupState>,
          ),
          AppSetupState,
          PrefetchHooks Function()
        > {
  $$AppSetupStatesTableTableManager(
    _$AppDatabase db,
    $AppSetupStatesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AppSetupStatesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AppSetupStatesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AppSetupStatesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> installationId = const Value.absent(),
                Value<String> businessTimezone = const Value.absent(),
                Value<bool> setupCompleted = const Value.absent(),
                Value<bool> backupConfigured = const Value.absent(),
                Value<int> backupIntervalMinutes = const Value.absent(),
                Value<int> staleSessionThresholdMinutes = const Value.absent(),
                Value<String?> firstBackupStatus = const Value.absent(),
                Value<String?> firstBackupMessage = const Value.absent(),
                Value<DateTime> createdAtUtc = const Value.absent(),
                Value<DateTime?> completedAtUtc = const Value.absent(),
              }) => AppSetupStatesCompanion(
                id: id,
                installationId: installationId,
                businessTimezone: businessTimezone,
                setupCompleted: setupCompleted,
                backupConfigured: backupConfigured,
                backupIntervalMinutes: backupIntervalMinutes,
                staleSessionThresholdMinutes: staleSessionThresholdMinutes,
                firstBackupStatus: firstBackupStatus,
                firstBackupMessage: firstBackupMessage,
                createdAtUtc: createdAtUtc,
                completedAtUtc: completedAtUtc,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String installationId,
                Value<String> businessTimezone = const Value.absent(),
                Value<bool> setupCompleted = const Value.absent(),
                Value<bool> backupConfigured = const Value.absent(),
                Value<int> backupIntervalMinutes = const Value.absent(),
                Value<int> staleSessionThresholdMinutes = const Value.absent(),
                Value<String?> firstBackupStatus = const Value.absent(),
                Value<String?> firstBackupMessage = const Value.absent(),
                required DateTime createdAtUtc,
                Value<DateTime?> completedAtUtc = const Value.absent(),
              }) => AppSetupStatesCompanion.insert(
                id: id,
                installationId: installationId,
                businessTimezone: businessTimezone,
                setupCompleted: setupCompleted,
                backupConfigured: backupConfigured,
                backupIntervalMinutes: backupIntervalMinutes,
                staleSessionThresholdMinutes: staleSessionThresholdMinutes,
                firstBackupStatus: firstBackupStatus,
                firstBackupMessage: firstBackupMessage,
                createdAtUtc: createdAtUtc,
                completedAtUtc: completedAtUtc,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AppSetupStatesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AppSetupStatesTable,
      AppSetupState,
      $$AppSetupStatesTableFilterComposer,
      $$AppSetupStatesTableOrderingComposer,
      $$AppSetupStatesTableAnnotationComposer,
      $$AppSetupStatesTableCreateCompanionBuilder,
      $$AppSetupStatesTableUpdateCompanionBuilder,
      (
        AppSetupState,
        BaseReferences<_$AppDatabase, $AppSetupStatesTable, AppSetupState>,
      ),
      AppSetupState,
      PrefetchHooks Function()
    >;
typedef $$AdminCredentialsTableCreateCompanionBuilder =
    AdminCredentialsCompanion Function({
      Value<int> id,
      required String passwordPlaintext,
      required DateTime createdAtUtc,
    });
typedef $$AdminCredentialsTableUpdateCompanionBuilder =
    AdminCredentialsCompanion Function({
      Value<int> id,
      Value<String> passwordPlaintext,
      Value<DateTime> createdAtUtc,
    });

class $$AdminCredentialsTableFilterComposer
    extends Composer<_$AppDatabase, $AdminCredentialsTable> {
  $$AdminCredentialsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get passwordPlaintext => $composableBuilder(
    column: $table.passwordPlaintext,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAtUtc => $composableBuilder(
    column: $table.createdAtUtc,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AdminCredentialsTableOrderingComposer
    extends Composer<_$AppDatabase, $AdminCredentialsTable> {
  $$AdminCredentialsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get passwordPlaintext => $composableBuilder(
    column: $table.passwordPlaintext,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAtUtc => $composableBuilder(
    column: $table.createdAtUtc,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AdminCredentialsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AdminCredentialsTable> {
  $$AdminCredentialsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get passwordPlaintext => $composableBuilder(
    column: $table.passwordPlaintext,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAtUtc => $composableBuilder(
    column: $table.createdAtUtc,
    builder: (column) => column,
  );
}

class $$AdminCredentialsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AdminCredentialsTable,
          AdminCredential,
          $$AdminCredentialsTableFilterComposer,
          $$AdminCredentialsTableOrderingComposer,
          $$AdminCredentialsTableAnnotationComposer,
          $$AdminCredentialsTableCreateCompanionBuilder,
          $$AdminCredentialsTableUpdateCompanionBuilder,
          (
            AdminCredential,
            BaseReferences<
              _$AppDatabase,
              $AdminCredentialsTable,
              AdminCredential
            >,
          ),
          AdminCredential,
          PrefetchHooks Function()
        > {
  $$AdminCredentialsTableTableManager(
    _$AppDatabase db,
    $AdminCredentialsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AdminCredentialsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AdminCredentialsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AdminCredentialsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> passwordPlaintext = const Value.absent(),
                Value<DateTime> createdAtUtc = const Value.absent(),
              }) => AdminCredentialsCompanion(
                id: id,
                passwordPlaintext: passwordPlaintext,
                createdAtUtc: createdAtUtc,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String passwordPlaintext,
                required DateTime createdAtUtc,
              }) => AdminCredentialsCompanion.insert(
                id: id,
                passwordPlaintext: passwordPlaintext,
                createdAtUtc: createdAtUtc,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AdminCredentialsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AdminCredentialsTable,
      AdminCredential,
      $$AdminCredentialsTableFilterComposer,
      $$AdminCredentialsTableOrderingComposer,
      $$AdminCredentialsTableAnnotationComposer,
      $$AdminCredentialsTableCreateCompanionBuilder,
      $$AdminCredentialsTableUpdateCompanionBuilder,
      (
        AdminCredential,
        BaseReferences<_$AppDatabase, $AdminCredentialsTable, AdminCredential>,
      ),
      AdminCredential,
      PrefetchHooks Function()
    >;
typedef $$BackupConfigurationsTableCreateCompanionBuilder =
    BackupConfigurationsCompanion Function({
      Value<int> id,
      required String bucketName,
      required String bucketPrefix,
      Value<bool> credentialsConfigured,
      required DateTime configuredAtUtc,
    });
typedef $$BackupConfigurationsTableUpdateCompanionBuilder =
    BackupConfigurationsCompanion Function({
      Value<int> id,
      Value<String> bucketName,
      Value<String> bucketPrefix,
      Value<bool> credentialsConfigured,
      Value<DateTime> configuredAtUtc,
    });

class $$BackupConfigurationsTableFilterComposer
    extends Composer<_$AppDatabase, $BackupConfigurationsTable> {
  $$BackupConfigurationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get bucketName => $composableBuilder(
    column: $table.bucketName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get bucketPrefix => $composableBuilder(
    column: $table.bucketPrefix,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get credentialsConfigured => $composableBuilder(
    column: $table.credentialsConfigured,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get configuredAtUtc => $composableBuilder(
    column: $table.configuredAtUtc,
    builder: (column) => ColumnFilters(column),
  );
}

class $$BackupConfigurationsTableOrderingComposer
    extends Composer<_$AppDatabase, $BackupConfigurationsTable> {
  $$BackupConfigurationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bucketName => $composableBuilder(
    column: $table.bucketName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bucketPrefix => $composableBuilder(
    column: $table.bucketPrefix,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get credentialsConfigured => $composableBuilder(
    column: $table.credentialsConfigured,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get configuredAtUtc => $composableBuilder(
    column: $table.configuredAtUtc,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$BackupConfigurationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $BackupConfigurationsTable> {
  $$BackupConfigurationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get bucketName => $composableBuilder(
    column: $table.bucketName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get bucketPrefix => $composableBuilder(
    column: $table.bucketPrefix,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get credentialsConfigured => $composableBuilder(
    column: $table.credentialsConfigured,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get configuredAtUtc => $composableBuilder(
    column: $table.configuredAtUtc,
    builder: (column) => column,
  );
}

class $$BackupConfigurationsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BackupConfigurationsTable,
          BackupConfiguration,
          $$BackupConfigurationsTableFilterComposer,
          $$BackupConfigurationsTableOrderingComposer,
          $$BackupConfigurationsTableAnnotationComposer,
          $$BackupConfigurationsTableCreateCompanionBuilder,
          $$BackupConfigurationsTableUpdateCompanionBuilder,
          (
            BackupConfiguration,
            BaseReferences<
              _$AppDatabase,
              $BackupConfigurationsTable,
              BackupConfiguration
            >,
          ),
          BackupConfiguration,
          PrefetchHooks Function()
        > {
  $$BackupConfigurationsTableTableManager(
    _$AppDatabase db,
    $BackupConfigurationsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BackupConfigurationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BackupConfigurationsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$BackupConfigurationsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> bucketName = const Value.absent(),
                Value<String> bucketPrefix = const Value.absent(),
                Value<bool> credentialsConfigured = const Value.absent(),
                Value<DateTime> configuredAtUtc = const Value.absent(),
              }) => BackupConfigurationsCompanion(
                id: id,
                bucketName: bucketName,
                bucketPrefix: bucketPrefix,
                credentialsConfigured: credentialsConfigured,
                configuredAtUtc: configuredAtUtc,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String bucketName,
                required String bucketPrefix,
                Value<bool> credentialsConfigured = const Value.absent(),
                required DateTime configuredAtUtc,
              }) => BackupConfigurationsCompanion.insert(
                id: id,
                bucketName: bucketName,
                bucketPrefix: bucketPrefix,
                credentialsConfigured: credentialsConfigured,
                configuredAtUtc: configuredAtUtc,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$BackupConfigurationsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BackupConfigurationsTable,
      BackupConfiguration,
      $$BackupConfigurationsTableFilterComposer,
      $$BackupConfigurationsTableOrderingComposer,
      $$BackupConfigurationsTableAnnotationComposer,
      $$BackupConfigurationsTableCreateCompanionBuilder,
      $$BackupConfigurationsTableUpdateCompanionBuilder,
      (
        BackupConfiguration,
        BaseReferences<
          _$AppDatabase,
          $BackupConfigurationsTable,
          BackupConfiguration
        >,
      ),
      BackupConfiguration,
      PrefetchHooks Function()
    >;
typedef $$BackupRunsTableCreateCompanionBuilder =
    BackupRunsCompanion Function({
      Value<int> id,
      required String runType,
      required String status,
      Value<String?> message,
      required DateTime startedAtUtc,
      required DateTime completedAtUtc,
    });
typedef $$BackupRunsTableUpdateCompanionBuilder =
    BackupRunsCompanion Function({
      Value<int> id,
      Value<String> runType,
      Value<String> status,
      Value<String?> message,
      Value<DateTime> startedAtUtc,
      Value<DateTime> completedAtUtc,
    });

class $$BackupRunsTableFilterComposer
    extends Composer<_$AppDatabase, $BackupRunsTable> {
  $$BackupRunsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get runType => $composableBuilder(
    column: $table.runType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get message => $composableBuilder(
    column: $table.message,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startedAtUtc => $composableBuilder(
    column: $table.startedAtUtc,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get completedAtUtc => $composableBuilder(
    column: $table.completedAtUtc,
    builder: (column) => ColumnFilters(column),
  );
}

class $$BackupRunsTableOrderingComposer
    extends Composer<_$AppDatabase, $BackupRunsTable> {
  $$BackupRunsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get runType => $composableBuilder(
    column: $table.runType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get message => $composableBuilder(
    column: $table.message,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startedAtUtc => $composableBuilder(
    column: $table.startedAtUtc,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get completedAtUtc => $composableBuilder(
    column: $table.completedAtUtc,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$BackupRunsTableAnnotationComposer
    extends Composer<_$AppDatabase, $BackupRunsTable> {
  $$BackupRunsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get runType =>
      $composableBuilder(column: $table.runType, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get message =>
      $composableBuilder(column: $table.message, builder: (column) => column);

  GeneratedColumn<DateTime> get startedAtUtc => $composableBuilder(
    column: $table.startedAtUtc,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get completedAtUtc => $composableBuilder(
    column: $table.completedAtUtc,
    builder: (column) => column,
  );
}

class $$BackupRunsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BackupRunsTable,
          BackupRun,
          $$BackupRunsTableFilterComposer,
          $$BackupRunsTableOrderingComposer,
          $$BackupRunsTableAnnotationComposer,
          $$BackupRunsTableCreateCompanionBuilder,
          $$BackupRunsTableUpdateCompanionBuilder,
          (
            BackupRun,
            BaseReferences<_$AppDatabase, $BackupRunsTable, BackupRun>,
          ),
          BackupRun,
          PrefetchHooks Function()
        > {
  $$BackupRunsTableTableManager(_$AppDatabase db, $BackupRunsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BackupRunsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BackupRunsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BackupRunsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> runType = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String?> message = const Value.absent(),
                Value<DateTime> startedAtUtc = const Value.absent(),
                Value<DateTime> completedAtUtc = const Value.absent(),
              }) => BackupRunsCompanion(
                id: id,
                runType: runType,
                status: status,
                message: message,
                startedAtUtc: startedAtUtc,
                completedAtUtc: completedAtUtc,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String runType,
                required String status,
                Value<String?> message = const Value.absent(),
                required DateTime startedAtUtc,
                required DateTime completedAtUtc,
              }) => BackupRunsCompanion.insert(
                id: id,
                runType: runType,
                status: status,
                message: message,
                startedAtUtc: startedAtUtc,
                completedAtUtc: completedAtUtc,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$BackupRunsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BackupRunsTable,
      BackupRun,
      $$BackupRunsTableFilterComposer,
      $$BackupRunsTableOrderingComposer,
      $$BackupRunsTableAnnotationComposer,
      $$BackupRunsTableCreateCompanionBuilder,
      $$BackupRunsTableUpdateCompanionBuilder,
      (BackupRun, BaseReferences<_$AppDatabase, $BackupRunsTable, BackupRun>),
      BackupRun,
      PrefetchHooks Function()
    >;
typedef $$ProductsTableCreateCompanionBuilder =
    ProductsCompanion Function({
      Value<int> id,
      required String code,
      required String name,
      required int priceSyp,
      required int lowStockThreshold,
      Value<bool> active,
      required DateTime createdAtUtc,
      required DateTime updatedAtUtc,
    });
typedef $$ProductsTableUpdateCompanionBuilder =
    ProductsCompanion Function({
      Value<int> id,
      Value<String> code,
      Value<String> name,
      Value<int> priceSyp,
      Value<int> lowStockThreshold,
      Value<bool> active,
      Value<DateTime> createdAtUtc,
      Value<DateTime> updatedAtUtc,
    });

final class $$ProductsTableReferences
    extends BaseReferences<_$AppDatabase, $ProductsTable, Product> {
  $$ProductsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$InventoryMovementsTable, List<InventoryMovement>>
  _inventoryMovementsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.inventoryMovements,
        aliasName: $_aliasNameGenerator(
          db.products.id,
          db.inventoryMovements.productId,
        ),
      );

  $$InventoryMovementsTableProcessedTableManager get inventoryMovementsRefs {
    final manager = $$InventoryMovementsTableTableManager(
      $_db,
      $_db.inventoryMovements,
    ).filter((f) => f.productId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _inventoryMovementsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ProductsTableFilterComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get priceSyp => $composableBuilder(
    column: $table.priceSyp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get lowStockThreshold => $composableBuilder(
    column: $table.lowStockThreshold,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get active => $composableBuilder(
    column: $table.active,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAtUtc => $composableBuilder(
    column: $table.createdAtUtc,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAtUtc => $composableBuilder(
    column: $table.updatedAtUtc,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> inventoryMovementsRefs(
    Expression<bool> Function($$InventoryMovementsTableFilterComposer f) f,
  ) {
    final $$InventoryMovementsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.inventoryMovements,
      getReferencedColumn: (t) => t.productId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InventoryMovementsTableFilterComposer(
            $db: $db,
            $table: $db.inventoryMovements,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ProductsTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get priceSyp => $composableBuilder(
    column: $table.priceSyp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get lowStockThreshold => $composableBuilder(
    column: $table.lowStockThreshold,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get active => $composableBuilder(
    column: $table.active,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAtUtc => $composableBuilder(
    column: $table.createdAtUtc,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAtUtc => $composableBuilder(
    column: $table.updatedAtUtc,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProductsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get priceSyp =>
      $composableBuilder(column: $table.priceSyp, builder: (column) => column);

  GeneratedColumn<int> get lowStockThreshold => $composableBuilder(
    column: $table.lowStockThreshold,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get active =>
      $composableBuilder(column: $table.active, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAtUtc => $composableBuilder(
    column: $table.createdAtUtc,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get updatedAtUtc => $composableBuilder(
    column: $table.updatedAtUtc,
    builder: (column) => column,
  );

  Expression<T> inventoryMovementsRefs<T extends Object>(
    Expression<T> Function($$InventoryMovementsTableAnnotationComposer a) f,
  ) {
    final $$InventoryMovementsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.inventoryMovements,
          getReferencedColumn: (t) => t.productId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$InventoryMovementsTableAnnotationComposer(
                $db: $db,
                $table: $db.inventoryMovements,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$ProductsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProductsTable,
          Product,
          $$ProductsTableFilterComposer,
          $$ProductsTableOrderingComposer,
          $$ProductsTableAnnotationComposer,
          $$ProductsTableCreateCompanionBuilder,
          $$ProductsTableUpdateCompanionBuilder,
          (Product, $$ProductsTableReferences),
          Product,
          PrefetchHooks Function({bool inventoryMovementsRefs})
        > {
  $$ProductsTableTableManager(_$AppDatabase db, $ProductsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> code = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> priceSyp = const Value.absent(),
                Value<int> lowStockThreshold = const Value.absent(),
                Value<bool> active = const Value.absent(),
                Value<DateTime> createdAtUtc = const Value.absent(),
                Value<DateTime> updatedAtUtc = const Value.absent(),
              }) => ProductsCompanion(
                id: id,
                code: code,
                name: name,
                priceSyp: priceSyp,
                lowStockThreshold: lowStockThreshold,
                active: active,
                createdAtUtc: createdAtUtc,
                updatedAtUtc: updatedAtUtc,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String code,
                required String name,
                required int priceSyp,
                required int lowStockThreshold,
                Value<bool> active = const Value.absent(),
                required DateTime createdAtUtc,
                required DateTime updatedAtUtc,
              }) => ProductsCompanion.insert(
                id: id,
                code: code,
                name: name,
                priceSyp: priceSyp,
                lowStockThreshold: lowStockThreshold,
                active: active,
                createdAtUtc: createdAtUtc,
                updatedAtUtc: updatedAtUtc,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ProductsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({inventoryMovementsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (inventoryMovementsRefs) db.inventoryMovements,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (inventoryMovementsRefs)
                    await $_getPrefetchedData<
                      Product,
                      $ProductsTable,
                      InventoryMovement
                    >(
                      currentTable: table,
                      referencedTable: $$ProductsTableReferences
                          ._inventoryMovementsRefsTable(db),
                      managerFromTypedResult: (p0) => $$ProductsTableReferences(
                        db,
                        table,
                        p0,
                      ).inventoryMovementsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.productId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$ProductsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProductsTable,
      Product,
      $$ProductsTableFilterComposer,
      $$ProductsTableOrderingComposer,
      $$ProductsTableAnnotationComposer,
      $$ProductsTableCreateCompanionBuilder,
      $$ProductsTableUpdateCompanionBuilder,
      (Product, $$ProductsTableReferences),
      Product,
      PrefetchHooks Function({bool inventoryMovementsRefs})
    >;
typedef $$InventoryMovementsTableCreateCompanionBuilder =
    InventoryMovementsCompanion Function({
      Value<int> id,
      required int productId,
      required int quantityDelta,
      required String reason,
      required DateTime createdAtUtc,
    });
typedef $$InventoryMovementsTableUpdateCompanionBuilder =
    InventoryMovementsCompanion Function({
      Value<int> id,
      Value<int> productId,
      Value<int> quantityDelta,
      Value<String> reason,
      Value<DateTime> createdAtUtc,
    });

final class $$InventoryMovementsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $InventoryMovementsTable,
          InventoryMovement
        > {
  $$InventoryMovementsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ProductsTable _productIdTable(_$AppDatabase db) =>
      db.products.createAlias(
        $_aliasNameGenerator(db.inventoryMovements.productId, db.products.id),
      );

  $$ProductsTableProcessedTableManager get productId {
    final $_column = $_itemColumn<int>('product_id')!;

    final manager = $$ProductsTableTableManager(
      $_db,
      $_db.products,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_productIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$InventoryMovementsTableFilterComposer
    extends Composer<_$AppDatabase, $InventoryMovementsTable> {
  $$InventoryMovementsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get quantityDelta => $composableBuilder(
    column: $table.quantityDelta,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get reason => $composableBuilder(
    column: $table.reason,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAtUtc => $composableBuilder(
    column: $table.createdAtUtc,
    builder: (column) => ColumnFilters(column),
  );

  $$ProductsTableFilterComposer get productId {
    final $$ProductsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableFilterComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$InventoryMovementsTableOrderingComposer
    extends Composer<_$AppDatabase, $InventoryMovementsTable> {
  $$InventoryMovementsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get quantityDelta => $composableBuilder(
    column: $table.quantityDelta,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reason => $composableBuilder(
    column: $table.reason,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAtUtc => $composableBuilder(
    column: $table.createdAtUtc,
    builder: (column) => ColumnOrderings(column),
  );

  $$ProductsTableOrderingComposer get productId {
    final $$ProductsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableOrderingComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$InventoryMovementsTableAnnotationComposer
    extends Composer<_$AppDatabase, $InventoryMovementsTable> {
  $$InventoryMovementsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get quantityDelta => $composableBuilder(
    column: $table.quantityDelta,
    builder: (column) => column,
  );

  GeneratedColumn<String> get reason =>
      $composableBuilder(column: $table.reason, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAtUtc => $composableBuilder(
    column: $table.createdAtUtc,
    builder: (column) => column,
  );

  $$ProductsTableAnnotationComposer get productId {
    final $$ProductsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableAnnotationComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$InventoryMovementsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $InventoryMovementsTable,
          InventoryMovement,
          $$InventoryMovementsTableFilterComposer,
          $$InventoryMovementsTableOrderingComposer,
          $$InventoryMovementsTableAnnotationComposer,
          $$InventoryMovementsTableCreateCompanionBuilder,
          $$InventoryMovementsTableUpdateCompanionBuilder,
          (InventoryMovement, $$InventoryMovementsTableReferences),
          InventoryMovement,
          PrefetchHooks Function({bool productId})
        > {
  $$InventoryMovementsTableTableManager(
    _$AppDatabase db,
    $InventoryMovementsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$InventoryMovementsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$InventoryMovementsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$InventoryMovementsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> productId = const Value.absent(),
                Value<int> quantityDelta = const Value.absent(),
                Value<String> reason = const Value.absent(),
                Value<DateTime> createdAtUtc = const Value.absent(),
              }) => InventoryMovementsCompanion(
                id: id,
                productId: productId,
                quantityDelta: quantityDelta,
                reason: reason,
                createdAtUtc: createdAtUtc,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int productId,
                required int quantityDelta,
                required String reason,
                required DateTime createdAtUtc,
              }) => InventoryMovementsCompanion.insert(
                id: id,
                productId: productId,
                quantityDelta: quantityDelta,
                reason: reason,
                createdAtUtc: createdAtUtc,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$InventoryMovementsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({productId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (productId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.productId,
                                referencedTable:
                                    $$InventoryMovementsTableReferences
                                        ._productIdTable(db),
                                referencedColumn:
                                    $$InventoryMovementsTableReferences
                                        ._productIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$InventoryMovementsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $InventoryMovementsTable,
      InventoryMovement,
      $$InventoryMovementsTableFilterComposer,
      $$InventoryMovementsTableOrderingComposer,
      $$InventoryMovementsTableAnnotationComposer,
      $$InventoryMovementsTableCreateCompanionBuilder,
      $$InventoryMovementsTableUpdateCompanionBuilder,
      (InventoryMovement, $$InventoryMovementsTableReferences),
      InventoryMovement,
      PrefetchHooks Function({bool productId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$AppSetupStatesTableTableManager get appSetupStates =>
      $$AppSetupStatesTableTableManager(_db, _db.appSetupStates);
  $$AdminCredentialsTableTableManager get adminCredentials =>
      $$AdminCredentialsTableTableManager(_db, _db.adminCredentials);
  $$BackupConfigurationsTableTableManager get backupConfigurations =>
      $$BackupConfigurationsTableTableManager(_db, _db.backupConfigurations);
  $$BackupRunsTableTableManager get backupRuns =>
      $$BackupRunsTableTableManager(_db, _db.backupRuns);
  $$ProductsTableTableManager get products =>
      $$ProductsTableTableManager(_db, _db.products);
  $$InventoryMovementsTableTableManager get inventoryMovements =>
      $$InventoryMovementsTableTableManager(_db, _db.inventoryMovements);
}
