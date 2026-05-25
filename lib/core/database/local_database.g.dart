// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_database.dart';

// ignore_for_file: type=lint
class $PlayersTable extends Players with TableInfo<$PlayersTable, Player> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlayersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fullNameMeta = const VerificationMeta(
    'fullName',
  );
  @override
  late final GeneratedColumn<String> fullName = GeneratedColumn<String>(
    'full_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ageMeta = const VerificationMeta('age');
  @override
  late final GeneratedColumn<int> age = GeneratedColumn<int>(
    'age',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _hasActiveSessionMeta = const VerificationMeta(
    'hasActiveSession',
  );
  @override
  late final GeneratedColumn<bool> hasActiveSession = GeneratedColumn<bool>(
    'has_active_session',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("has_active_session" IN (0, 1))',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    fullName,
    age,
    createdAt,
    updatedAt,
    hasActiveSession,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'players';
  @override
  VerificationContext validateIntegrity(
    Insertable<Player> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('full_name')) {
      context.handle(
        _fullNameMeta,
        fullName.isAcceptableOrUnknown(data['full_name']!, _fullNameMeta),
      );
    } else if (isInserting) {
      context.missing(_fullNameMeta);
    }
    if (data.containsKey('age')) {
      context.handle(
        _ageMeta,
        age.isAcceptableOrUnknown(data['age']!, _ageMeta),
      );
    } else if (isInserting) {
      context.missing(_ageMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('has_active_session')) {
      context.handle(
        _hasActiveSessionMeta,
        hasActiveSession.isAcceptableOrUnknown(
          data['has_active_session']!,
          _hasActiveSessionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_hasActiveSessionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Player map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Player(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      fullName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}full_name'],
      )!,
      age: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}age'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}updated_at'],
      )!,
      hasActiveSession: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}has_active_session'],
      )!,
    );
  }

  @override
  $PlayersTable createAlias(String alias) {
    return $PlayersTable(attachedDatabase, alias);
  }
}

class Player extends DataClass implements Insertable<Player> {
  final String id;
  final String fullName;
  final int age;
  final String createdAt;
  final String updatedAt;
  final bool hasActiveSession;
  const Player({
    required this.id,
    required this.fullName,
    required this.age,
    required this.createdAt,
    required this.updatedAt,
    required this.hasActiveSession,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['full_name'] = Variable<String>(fullName);
    map['age'] = Variable<int>(age);
    map['created_at'] = Variable<String>(createdAt);
    map['updated_at'] = Variable<String>(updatedAt);
    map['has_active_session'] = Variable<bool>(hasActiveSession);
    return map;
  }

  PlayersCompanion toCompanion(bool nullToAbsent) {
    return PlayersCompanion(
      id: Value(id),
      fullName: Value(fullName),
      age: Value(age),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      hasActiveSession: Value(hasActiveSession),
    );
  }

  factory Player.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Player(
      id: serializer.fromJson<String>(json['id']),
      fullName: serializer.fromJson<String>(json['fullName']),
      age: serializer.fromJson<int>(json['age']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
      updatedAt: serializer.fromJson<String>(json['updatedAt']),
      hasActiveSession: serializer.fromJson<bool>(json['hasActiveSession']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'fullName': serializer.toJson<String>(fullName),
      'age': serializer.toJson<int>(age),
      'createdAt': serializer.toJson<String>(createdAt),
      'updatedAt': serializer.toJson<String>(updatedAt),
      'hasActiveSession': serializer.toJson<bool>(hasActiveSession),
    };
  }

  Player copyWith({
    String? id,
    String? fullName,
    int? age,
    String? createdAt,
    String? updatedAt,
    bool? hasActiveSession,
  }) => Player(
    id: id ?? this.id,
    fullName: fullName ?? this.fullName,
    age: age ?? this.age,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    hasActiveSession: hasActiveSession ?? this.hasActiveSession,
  );
  Player copyWithCompanion(PlayersCompanion data) {
    return Player(
      id: data.id.present ? data.id.value : this.id,
      fullName: data.fullName.present ? data.fullName.value : this.fullName,
      age: data.age.present ? data.age.value : this.age,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      hasActiveSession: data.hasActiveSession.present
          ? data.hasActiveSession.value
          : this.hasActiveSession,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Player(')
          ..write('id: $id, ')
          ..write('fullName: $fullName, ')
          ..write('age: $age, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('hasActiveSession: $hasActiveSession')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, fullName, age, createdAt, updatedAt, hasActiveSession);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Player &&
          other.id == this.id &&
          other.fullName == this.fullName &&
          other.age == this.age &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.hasActiveSession == this.hasActiveSession);
}

class PlayersCompanion extends UpdateCompanion<Player> {
  final Value<String> id;
  final Value<String> fullName;
  final Value<int> age;
  final Value<String> createdAt;
  final Value<String> updatedAt;
  final Value<bool> hasActiveSession;
  final Value<int> rowid;
  const PlayersCompanion({
    this.id = const Value.absent(),
    this.fullName = const Value.absent(),
    this.age = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.hasActiveSession = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PlayersCompanion.insert({
    required String id,
    required String fullName,
    required int age,
    required String createdAt,
    required String updatedAt,
    required bool hasActiveSession,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       fullName = Value(fullName),
       age = Value(age),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt),
       hasActiveSession = Value(hasActiveSession);
  static Insertable<Player> custom({
    Expression<String>? id,
    Expression<String>? fullName,
    Expression<int>? age,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
    Expression<bool>? hasActiveSession,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (fullName != null) 'full_name': fullName,
      if (age != null) 'age': age,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (hasActiveSession != null) 'has_active_session': hasActiveSession,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PlayersCompanion copyWith({
    Value<String>? id,
    Value<String>? fullName,
    Value<int>? age,
    Value<String>? createdAt,
    Value<String>? updatedAt,
    Value<bool>? hasActiveSession,
    Value<int>? rowid,
  }) {
    return PlayersCompanion(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      age: age ?? this.age,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      hasActiveSession: hasActiveSession ?? this.hasActiveSession,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (fullName.present) {
      map['full_name'] = Variable<String>(fullName.value);
    }
    if (age.present) {
      map['age'] = Variable<int>(age.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    if (hasActiveSession.present) {
      map['has_active_session'] = Variable<bool>(hasActiveSession.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlayersCompanion(')
          ..write('id: $id, ')
          ..write('fullName: $fullName, ')
          ..write('age: $age, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('hasActiveSession: $hasActiveSession, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PlayerPhonesTable extends PlayerPhones
    with TableInfo<$PlayerPhonesTable, PlayerPhone> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlayerPhonesTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _playerIdMeta = const VerificationMeta(
    'playerId',
  );
  @override
  late final GeneratedColumn<String> playerId = GeneratedColumn<String>(
    'player_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES players (id)',
    ),
  );
  static const VerificationMeta _phoneNumberMeta = const VerificationMeta(
    'phoneNumber',
  );
  @override
  late final GeneratedColumn<String> phoneNumber = GeneratedColumn<String>(
    'phone_number',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isPrimaryMeta = const VerificationMeta(
    'isPrimary',
  );
  @override
  late final GeneratedColumn<bool> isPrimary = GeneratedColumn<bool>(
    'is_primary',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_primary" IN (0, 1))',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [id, playerId, phoneNumber, isPrimary];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'player_phones';
  @override
  VerificationContext validateIntegrity(
    Insertable<PlayerPhone> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('player_id')) {
      context.handle(
        _playerIdMeta,
        playerId.isAcceptableOrUnknown(data['player_id']!, _playerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_playerIdMeta);
    }
    if (data.containsKey('phone_number')) {
      context.handle(
        _phoneNumberMeta,
        phoneNumber.isAcceptableOrUnknown(
          data['phone_number']!,
          _phoneNumberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_phoneNumberMeta);
    }
    if (data.containsKey('is_primary')) {
      context.handle(
        _isPrimaryMeta,
        isPrimary.isAcceptableOrUnknown(data['is_primary']!, _isPrimaryMeta),
      );
    } else if (isInserting) {
      context.missing(_isPrimaryMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PlayerPhone map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PlayerPhone(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      playerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}player_id'],
      )!,
      phoneNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone_number'],
      )!,
      isPrimary: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_primary'],
      )!,
    );
  }

  @override
  $PlayerPhonesTable createAlias(String alias) {
    return $PlayerPhonesTable(attachedDatabase, alias);
  }
}

class PlayerPhone extends DataClass implements Insertable<PlayerPhone> {
  final int id;
  final String playerId;
  final String phoneNumber;
  final bool isPrimary;
  const PlayerPhone({
    required this.id,
    required this.playerId,
    required this.phoneNumber,
    required this.isPrimary,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['player_id'] = Variable<String>(playerId);
    map['phone_number'] = Variable<String>(phoneNumber);
    map['is_primary'] = Variable<bool>(isPrimary);
    return map;
  }

  PlayerPhonesCompanion toCompanion(bool nullToAbsent) {
    return PlayerPhonesCompanion(
      id: Value(id),
      playerId: Value(playerId),
      phoneNumber: Value(phoneNumber),
      isPrimary: Value(isPrimary),
    );
  }

  factory PlayerPhone.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PlayerPhone(
      id: serializer.fromJson<int>(json['id']),
      playerId: serializer.fromJson<String>(json['playerId']),
      phoneNumber: serializer.fromJson<String>(json['phoneNumber']),
      isPrimary: serializer.fromJson<bool>(json['isPrimary']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'playerId': serializer.toJson<String>(playerId),
      'phoneNumber': serializer.toJson<String>(phoneNumber),
      'isPrimary': serializer.toJson<bool>(isPrimary),
    };
  }

  PlayerPhone copyWith({
    int? id,
    String? playerId,
    String? phoneNumber,
    bool? isPrimary,
  }) => PlayerPhone(
    id: id ?? this.id,
    playerId: playerId ?? this.playerId,
    phoneNumber: phoneNumber ?? this.phoneNumber,
    isPrimary: isPrimary ?? this.isPrimary,
  );
  PlayerPhone copyWithCompanion(PlayerPhonesCompanion data) {
    return PlayerPhone(
      id: data.id.present ? data.id.value : this.id,
      playerId: data.playerId.present ? data.playerId.value : this.playerId,
      phoneNumber: data.phoneNumber.present
          ? data.phoneNumber.value
          : this.phoneNumber,
      isPrimary: data.isPrimary.present ? data.isPrimary.value : this.isPrimary,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PlayerPhone(')
          ..write('id: $id, ')
          ..write('playerId: $playerId, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('isPrimary: $isPrimary')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, playerId, phoneNumber, isPrimary);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlayerPhone &&
          other.id == this.id &&
          other.playerId == this.playerId &&
          other.phoneNumber == this.phoneNumber &&
          other.isPrimary == this.isPrimary);
}

class PlayerPhonesCompanion extends UpdateCompanion<PlayerPhone> {
  final Value<int> id;
  final Value<String> playerId;
  final Value<String> phoneNumber;
  final Value<bool> isPrimary;
  const PlayerPhonesCompanion({
    this.id = const Value.absent(),
    this.playerId = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.isPrimary = const Value.absent(),
  });
  PlayerPhonesCompanion.insert({
    this.id = const Value.absent(),
    required String playerId,
    required String phoneNumber,
    required bool isPrimary,
  }) : playerId = Value(playerId),
       phoneNumber = Value(phoneNumber),
       isPrimary = Value(isPrimary);
  static Insertable<PlayerPhone> custom({
    Expression<int>? id,
    Expression<String>? playerId,
    Expression<String>? phoneNumber,
    Expression<bool>? isPrimary,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (playerId != null) 'player_id': playerId,
      if (phoneNumber != null) 'phone_number': phoneNumber,
      if (isPrimary != null) 'is_primary': isPrimary,
    });
  }

  PlayerPhonesCompanion copyWith({
    Value<int>? id,
    Value<String>? playerId,
    Value<String>? phoneNumber,
    Value<bool>? isPrimary,
  }) {
    return PlayerPhonesCompanion(
      id: id ?? this.id,
      playerId: playerId ?? this.playerId,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      isPrimary: isPrimary ?? this.isPrimary,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (playerId.present) {
      map['player_id'] = Variable<String>(playerId.value);
    }
    if (phoneNumber.present) {
      map['phone_number'] = Variable<String>(phoneNumber.value);
    }
    if (isPrimary.present) {
      map['is_primary'] = Variable<bool>(isPrimary.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlayerPhonesCompanion(')
          ..write('id: $id, ')
          ..write('playerId: $playerId, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('isPrimary: $isPrimary')
          ..write(')'))
        .toString();
  }
}

class $SubscriptionsTable extends Subscriptions
    with TableInfo<$SubscriptionsTable, Subscription> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SubscriptionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _playerIdMeta = const VerificationMeta(
    'playerId',
  );
  @override
  late final GeneratedColumn<String> playerId = GeneratedColumn<String>(
    'player_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES players (id)',
    ),
  );
  static const VerificationMeta _totalMinutesMeta = const VerificationMeta(
    'totalMinutes',
  );
  @override
  late final GeneratedColumn<int> totalMinutes = GeneratedColumn<int>(
    'total_minutes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _remainingMinutesMeta = const VerificationMeta(
    'remainingMinutes',
  );
  @override
  late final GeneratedColumn<int> remainingMinutes = GeneratedColumn<int>(
    'remaining_minutes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _purchasedAtMeta = const VerificationMeta(
    'purchasedAt',
  );
  @override
  late final GeneratedColumn<String> purchasedAt = GeneratedColumn<String>(
    'purchased_at',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _expiresAtMeta = const VerificationMeta(
    'expiresAt',
  );
  @override
  late final GeneratedColumn<String> expiresAt = GeneratedColumn<String>(
    'expires_at',
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
  static const VerificationMeta _unpaidDebtIdMeta = const VerificationMeta(
    'unpaidDebtId',
  );
  @override
  late final GeneratedColumn<String> unpaidDebtId = GeneratedColumn<String>(
    'unpaid_debt_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    playerId,
    totalMinutes,
    remainingMinutes,
    purchasedAt,
    expiresAt,
    status,
    unpaidDebtId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'subscriptions';
  @override
  VerificationContext validateIntegrity(
    Insertable<Subscription> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('player_id')) {
      context.handle(
        _playerIdMeta,
        playerId.isAcceptableOrUnknown(data['player_id']!, _playerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_playerIdMeta);
    }
    if (data.containsKey('total_minutes')) {
      context.handle(
        _totalMinutesMeta,
        totalMinutes.isAcceptableOrUnknown(
          data['total_minutes']!,
          _totalMinutesMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_totalMinutesMeta);
    }
    if (data.containsKey('remaining_minutes')) {
      context.handle(
        _remainingMinutesMeta,
        remainingMinutes.isAcceptableOrUnknown(
          data['remaining_minutes']!,
          _remainingMinutesMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_remainingMinutesMeta);
    }
    if (data.containsKey('purchased_at')) {
      context.handle(
        _purchasedAtMeta,
        purchasedAt.isAcceptableOrUnknown(
          data['purchased_at']!,
          _purchasedAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_purchasedAtMeta);
    }
    if (data.containsKey('expires_at')) {
      context.handle(
        _expiresAtMeta,
        expiresAt.isAcceptableOrUnknown(data['expires_at']!, _expiresAtMeta),
      );
    } else if (isInserting) {
      context.missing(_expiresAtMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('unpaid_debt_id')) {
      context.handle(
        _unpaidDebtIdMeta,
        unpaidDebtId.isAcceptableOrUnknown(
          data['unpaid_debt_id']!,
          _unpaidDebtIdMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Subscription map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Subscription(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      playerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}player_id'],
      )!,
      totalMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_minutes'],
      )!,
      remainingMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}remaining_minutes'],
      )!,
      purchasedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}purchased_at'],
      )!,
      expiresAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}expires_at'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      unpaidDebtId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unpaid_debt_id'],
      ),
    );
  }

  @override
  $SubscriptionsTable createAlias(String alias) {
    return $SubscriptionsTable(attachedDatabase, alias);
  }
}

class Subscription extends DataClass implements Insertable<Subscription> {
  final String id;
  final String playerId;
  final int totalMinutes;
  final int remainingMinutes;
  final String purchasedAt;
  final String expiresAt;
  final String status;
  final String? unpaidDebtId;
  const Subscription({
    required this.id,
    required this.playerId,
    required this.totalMinutes,
    required this.remainingMinutes,
    required this.purchasedAt,
    required this.expiresAt,
    required this.status,
    this.unpaidDebtId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['player_id'] = Variable<String>(playerId);
    map['total_minutes'] = Variable<int>(totalMinutes);
    map['remaining_minutes'] = Variable<int>(remainingMinutes);
    map['purchased_at'] = Variable<String>(purchasedAt);
    map['expires_at'] = Variable<String>(expiresAt);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || unpaidDebtId != null) {
      map['unpaid_debt_id'] = Variable<String>(unpaidDebtId);
    }
    return map;
  }

  SubscriptionsCompanion toCompanion(bool nullToAbsent) {
    return SubscriptionsCompanion(
      id: Value(id),
      playerId: Value(playerId),
      totalMinutes: Value(totalMinutes),
      remainingMinutes: Value(remainingMinutes),
      purchasedAt: Value(purchasedAt),
      expiresAt: Value(expiresAt),
      status: Value(status),
      unpaidDebtId: unpaidDebtId == null && nullToAbsent
          ? const Value.absent()
          : Value(unpaidDebtId),
    );
  }

  factory Subscription.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Subscription(
      id: serializer.fromJson<String>(json['id']),
      playerId: serializer.fromJson<String>(json['playerId']),
      totalMinutes: serializer.fromJson<int>(json['totalMinutes']),
      remainingMinutes: serializer.fromJson<int>(json['remainingMinutes']),
      purchasedAt: serializer.fromJson<String>(json['purchasedAt']),
      expiresAt: serializer.fromJson<String>(json['expiresAt']),
      status: serializer.fromJson<String>(json['status']),
      unpaidDebtId: serializer.fromJson<String?>(json['unpaidDebtId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'playerId': serializer.toJson<String>(playerId),
      'totalMinutes': serializer.toJson<int>(totalMinutes),
      'remainingMinutes': serializer.toJson<int>(remainingMinutes),
      'purchasedAt': serializer.toJson<String>(purchasedAt),
      'expiresAt': serializer.toJson<String>(expiresAt),
      'status': serializer.toJson<String>(status),
      'unpaidDebtId': serializer.toJson<String?>(unpaidDebtId),
    };
  }

  Subscription copyWith({
    String? id,
    String? playerId,
    int? totalMinutes,
    int? remainingMinutes,
    String? purchasedAt,
    String? expiresAt,
    String? status,
    Value<String?> unpaidDebtId = const Value.absent(),
  }) => Subscription(
    id: id ?? this.id,
    playerId: playerId ?? this.playerId,
    totalMinutes: totalMinutes ?? this.totalMinutes,
    remainingMinutes: remainingMinutes ?? this.remainingMinutes,
    purchasedAt: purchasedAt ?? this.purchasedAt,
    expiresAt: expiresAt ?? this.expiresAt,
    status: status ?? this.status,
    unpaidDebtId: unpaidDebtId.present ? unpaidDebtId.value : this.unpaidDebtId,
  );
  Subscription copyWithCompanion(SubscriptionsCompanion data) {
    return Subscription(
      id: data.id.present ? data.id.value : this.id,
      playerId: data.playerId.present ? data.playerId.value : this.playerId,
      totalMinutes: data.totalMinutes.present
          ? data.totalMinutes.value
          : this.totalMinutes,
      remainingMinutes: data.remainingMinutes.present
          ? data.remainingMinutes.value
          : this.remainingMinutes,
      purchasedAt: data.purchasedAt.present
          ? data.purchasedAt.value
          : this.purchasedAt,
      expiresAt: data.expiresAt.present ? data.expiresAt.value : this.expiresAt,
      status: data.status.present ? data.status.value : this.status,
      unpaidDebtId: data.unpaidDebtId.present
          ? data.unpaidDebtId.value
          : this.unpaidDebtId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Subscription(')
          ..write('id: $id, ')
          ..write('playerId: $playerId, ')
          ..write('totalMinutes: $totalMinutes, ')
          ..write('remainingMinutes: $remainingMinutes, ')
          ..write('purchasedAt: $purchasedAt, ')
          ..write('expiresAt: $expiresAt, ')
          ..write('status: $status, ')
          ..write('unpaidDebtId: $unpaidDebtId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    playerId,
    totalMinutes,
    remainingMinutes,
    purchasedAt,
    expiresAt,
    status,
    unpaidDebtId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Subscription &&
          other.id == this.id &&
          other.playerId == this.playerId &&
          other.totalMinutes == this.totalMinutes &&
          other.remainingMinutes == this.remainingMinutes &&
          other.purchasedAt == this.purchasedAt &&
          other.expiresAt == this.expiresAt &&
          other.status == this.status &&
          other.unpaidDebtId == this.unpaidDebtId);
}

class SubscriptionsCompanion extends UpdateCompanion<Subscription> {
  final Value<String> id;
  final Value<String> playerId;
  final Value<int> totalMinutes;
  final Value<int> remainingMinutes;
  final Value<String> purchasedAt;
  final Value<String> expiresAt;
  final Value<String> status;
  final Value<String?> unpaidDebtId;
  final Value<int> rowid;
  const SubscriptionsCompanion({
    this.id = const Value.absent(),
    this.playerId = const Value.absent(),
    this.totalMinutes = const Value.absent(),
    this.remainingMinutes = const Value.absent(),
    this.purchasedAt = const Value.absent(),
    this.expiresAt = const Value.absent(),
    this.status = const Value.absent(),
    this.unpaidDebtId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SubscriptionsCompanion.insert({
    required String id,
    required String playerId,
    required int totalMinutes,
    required int remainingMinutes,
    required String purchasedAt,
    required String expiresAt,
    required String status,
    this.unpaidDebtId = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       playerId = Value(playerId),
       totalMinutes = Value(totalMinutes),
       remainingMinutes = Value(remainingMinutes),
       purchasedAt = Value(purchasedAt),
       expiresAt = Value(expiresAt),
       status = Value(status);
  static Insertable<Subscription> custom({
    Expression<String>? id,
    Expression<String>? playerId,
    Expression<int>? totalMinutes,
    Expression<int>? remainingMinutes,
    Expression<String>? purchasedAt,
    Expression<String>? expiresAt,
    Expression<String>? status,
    Expression<String>? unpaidDebtId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (playerId != null) 'player_id': playerId,
      if (totalMinutes != null) 'total_minutes': totalMinutes,
      if (remainingMinutes != null) 'remaining_minutes': remainingMinutes,
      if (purchasedAt != null) 'purchased_at': purchasedAt,
      if (expiresAt != null) 'expires_at': expiresAt,
      if (status != null) 'status': status,
      if (unpaidDebtId != null) 'unpaid_debt_id': unpaidDebtId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SubscriptionsCompanion copyWith({
    Value<String>? id,
    Value<String>? playerId,
    Value<int>? totalMinutes,
    Value<int>? remainingMinutes,
    Value<String>? purchasedAt,
    Value<String>? expiresAt,
    Value<String>? status,
    Value<String?>? unpaidDebtId,
    Value<int>? rowid,
  }) {
    return SubscriptionsCompanion(
      id: id ?? this.id,
      playerId: playerId ?? this.playerId,
      totalMinutes: totalMinutes ?? this.totalMinutes,
      remainingMinutes: remainingMinutes ?? this.remainingMinutes,
      purchasedAt: purchasedAt ?? this.purchasedAt,
      expiresAt: expiresAt ?? this.expiresAt,
      status: status ?? this.status,
      unpaidDebtId: unpaidDebtId ?? this.unpaidDebtId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (playerId.present) {
      map['player_id'] = Variable<String>(playerId.value);
    }
    if (totalMinutes.present) {
      map['total_minutes'] = Variable<int>(totalMinutes.value);
    }
    if (remainingMinutes.present) {
      map['remaining_minutes'] = Variable<int>(remainingMinutes.value);
    }
    if (purchasedAt.present) {
      map['purchased_at'] = Variable<String>(purchasedAt.value);
    }
    if (expiresAt.present) {
      map['expires_at'] = Variable<String>(expiresAt.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (unpaidDebtId.present) {
      map['unpaid_debt_id'] = Variable<String>(unpaidDebtId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SubscriptionsCompanion(')
          ..write('id: $id, ')
          ..write('playerId: $playerId, ')
          ..write('totalMinutes: $totalMinutes, ')
          ..write('remainingMinutes: $remainingMinutes, ')
          ..write('purchasedAt: $purchasedAt, ')
          ..write('expiresAt: $expiresAt, ')
          ..write('status: $status, ')
          ..write('unpaidDebtId: $unpaidDebtId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SessionsTable extends Sessions with TableInfo<$SessionsTable, Session> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SessionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _playerIdMeta = const VerificationMeta(
    'playerId',
  );
  @override
  late final GeneratedColumn<String> playerId = GeneratedColumn<String>(
    'player_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES players (id)',
    ),
  );
  static const VerificationMeta _entryTypeMeta = const VerificationMeta(
    'entryType',
  );
  @override
  late final GeneratedColumn<String> entryType = GeneratedColumn<String>(
    'entry_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _reservedBlocksMeta = const VerificationMeta(
    'reservedBlocks',
  );
  @override
  late final GeneratedColumn<int> reservedBlocks = GeneratedColumn<int>(
    'reserved_blocks',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _checkInAtMeta = const VerificationMeta(
    'checkInAt',
  );
  @override
  late final GeneratedColumn<String> checkInAt = GeneratedColumn<String>(
    'check_in_at',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _checkOutAtMeta = const VerificationMeta(
    'checkOutAt',
  );
  @override
  late final GeneratedColumn<String> checkOutAt = GeneratedColumn<String>(
    'check_out_at',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
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
  static const VerificationMeta _subscriptionIdMeta = const VerificationMeta(
    'subscriptionId',
  );
  @override
  late final GeneratedColumn<String> subscriptionId = GeneratedColumn<String>(
    'subscription_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES subscriptions (id)',
    ),
  );
  static const VerificationMeta _calculatedChargeMeta = const VerificationMeta(
    'calculatedCharge',
  );
  @override
  late final GeneratedColumn<int> calculatedCharge = GeneratedColumn<int>(
    'calculated_charge',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _finalChargeMeta = const VerificationMeta(
    'finalCharge',
  );
  @override
  late final GeneratedColumn<int> finalCharge = GeneratedColumn<int>(
    'final_charge',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _discountAmountMeta = const VerificationMeta(
    'discountAmount',
  );
  @override
  late final GeneratedColumn<int> discountAmount = GeneratedColumn<int>(
    'discount_amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _discountReasonMeta = const VerificationMeta(
    'discountReason',
  );
  @override
  late final GeneratedColumn<String> discountReason = GeneratedColumn<String>(
    'discount_reason',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    playerId,
    entryType,
    reservedBlocks,
    checkInAt,
    checkOutAt,
    status,
    subscriptionId,
    calculatedCharge,
    finalCharge,
    discountAmount,
    discountReason,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sessions';
  @override
  VerificationContext validateIntegrity(
    Insertable<Session> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('player_id')) {
      context.handle(
        _playerIdMeta,
        playerId.isAcceptableOrUnknown(data['player_id']!, _playerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_playerIdMeta);
    }
    if (data.containsKey('entry_type')) {
      context.handle(
        _entryTypeMeta,
        entryType.isAcceptableOrUnknown(data['entry_type']!, _entryTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_entryTypeMeta);
    }
    if (data.containsKey('reserved_blocks')) {
      context.handle(
        _reservedBlocksMeta,
        reservedBlocks.isAcceptableOrUnknown(
          data['reserved_blocks']!,
          _reservedBlocksMeta,
        ),
      );
    }
    if (data.containsKey('check_in_at')) {
      context.handle(
        _checkInAtMeta,
        checkInAt.isAcceptableOrUnknown(data['check_in_at']!, _checkInAtMeta),
      );
    } else if (isInserting) {
      context.missing(_checkInAtMeta);
    }
    if (data.containsKey('check_out_at')) {
      context.handle(
        _checkOutAtMeta,
        checkOutAt.isAcceptableOrUnknown(
          data['check_out_at']!,
          _checkOutAtMeta,
        ),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('subscription_id')) {
      context.handle(
        _subscriptionIdMeta,
        subscriptionId.isAcceptableOrUnknown(
          data['subscription_id']!,
          _subscriptionIdMeta,
        ),
      );
    }
    if (data.containsKey('calculated_charge')) {
      context.handle(
        _calculatedChargeMeta,
        calculatedCharge.isAcceptableOrUnknown(
          data['calculated_charge']!,
          _calculatedChargeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_calculatedChargeMeta);
    }
    if (data.containsKey('final_charge')) {
      context.handle(
        _finalChargeMeta,
        finalCharge.isAcceptableOrUnknown(
          data['final_charge']!,
          _finalChargeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_finalChargeMeta);
    }
    if (data.containsKey('discount_amount')) {
      context.handle(
        _discountAmountMeta,
        discountAmount.isAcceptableOrUnknown(
          data['discount_amount']!,
          _discountAmountMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_discountAmountMeta);
    }
    if (data.containsKey('discount_reason')) {
      context.handle(
        _discountReasonMeta,
        discountReason.isAcceptableOrUnknown(
          data['discount_reason']!,
          _discountReasonMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Session map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Session(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      playerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}player_id'],
      )!,
      entryType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entry_type'],
      )!,
      reservedBlocks: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}reserved_blocks'],
      ),
      checkInAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}check_in_at'],
      )!,
      checkOutAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}check_out_at'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      subscriptionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}subscription_id'],
      ),
      calculatedCharge: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}calculated_charge'],
      )!,
      finalCharge: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}final_charge'],
      )!,
      discountAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}discount_amount'],
      )!,
      discountReason: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}discount_reason'],
      ),
    );
  }

  @override
  $SessionsTable createAlias(String alias) {
    return $SessionsTable(attachedDatabase, alias);
  }
}

class Session extends DataClass implements Insertable<Session> {
  final String id;
  final String playerId;
  final String entryType;
  final int? reservedBlocks;
  final String checkInAt;
  final String? checkOutAt;
  final String status;
  final String? subscriptionId;
  final int calculatedCharge;
  final int finalCharge;
  final int discountAmount;
  final String? discountReason;
  const Session({
    required this.id,
    required this.playerId,
    required this.entryType,
    this.reservedBlocks,
    required this.checkInAt,
    this.checkOutAt,
    required this.status,
    this.subscriptionId,
    required this.calculatedCharge,
    required this.finalCharge,
    required this.discountAmount,
    this.discountReason,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['player_id'] = Variable<String>(playerId);
    map['entry_type'] = Variable<String>(entryType);
    if (!nullToAbsent || reservedBlocks != null) {
      map['reserved_blocks'] = Variable<int>(reservedBlocks);
    }
    map['check_in_at'] = Variable<String>(checkInAt);
    if (!nullToAbsent || checkOutAt != null) {
      map['check_out_at'] = Variable<String>(checkOutAt);
    }
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || subscriptionId != null) {
      map['subscription_id'] = Variable<String>(subscriptionId);
    }
    map['calculated_charge'] = Variable<int>(calculatedCharge);
    map['final_charge'] = Variable<int>(finalCharge);
    map['discount_amount'] = Variable<int>(discountAmount);
    if (!nullToAbsent || discountReason != null) {
      map['discount_reason'] = Variable<String>(discountReason);
    }
    return map;
  }

  SessionsCompanion toCompanion(bool nullToAbsent) {
    return SessionsCompanion(
      id: Value(id),
      playerId: Value(playerId),
      entryType: Value(entryType),
      reservedBlocks: reservedBlocks == null && nullToAbsent
          ? const Value.absent()
          : Value(reservedBlocks),
      checkInAt: Value(checkInAt),
      checkOutAt: checkOutAt == null && nullToAbsent
          ? const Value.absent()
          : Value(checkOutAt),
      status: Value(status),
      subscriptionId: subscriptionId == null && nullToAbsent
          ? const Value.absent()
          : Value(subscriptionId),
      calculatedCharge: Value(calculatedCharge),
      finalCharge: Value(finalCharge),
      discountAmount: Value(discountAmount),
      discountReason: discountReason == null && nullToAbsent
          ? const Value.absent()
          : Value(discountReason),
    );
  }

  factory Session.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Session(
      id: serializer.fromJson<String>(json['id']),
      playerId: serializer.fromJson<String>(json['playerId']),
      entryType: serializer.fromJson<String>(json['entryType']),
      reservedBlocks: serializer.fromJson<int?>(json['reservedBlocks']),
      checkInAt: serializer.fromJson<String>(json['checkInAt']),
      checkOutAt: serializer.fromJson<String?>(json['checkOutAt']),
      status: serializer.fromJson<String>(json['status']),
      subscriptionId: serializer.fromJson<String?>(json['subscriptionId']),
      calculatedCharge: serializer.fromJson<int>(json['calculatedCharge']),
      finalCharge: serializer.fromJson<int>(json['finalCharge']),
      discountAmount: serializer.fromJson<int>(json['discountAmount']),
      discountReason: serializer.fromJson<String?>(json['discountReason']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'playerId': serializer.toJson<String>(playerId),
      'entryType': serializer.toJson<String>(entryType),
      'reservedBlocks': serializer.toJson<int?>(reservedBlocks),
      'checkInAt': serializer.toJson<String>(checkInAt),
      'checkOutAt': serializer.toJson<String?>(checkOutAt),
      'status': serializer.toJson<String>(status),
      'subscriptionId': serializer.toJson<String?>(subscriptionId),
      'calculatedCharge': serializer.toJson<int>(calculatedCharge),
      'finalCharge': serializer.toJson<int>(finalCharge),
      'discountAmount': serializer.toJson<int>(discountAmount),
      'discountReason': serializer.toJson<String?>(discountReason),
    };
  }

  Session copyWith({
    String? id,
    String? playerId,
    String? entryType,
    Value<int?> reservedBlocks = const Value.absent(),
    String? checkInAt,
    Value<String?> checkOutAt = const Value.absent(),
    String? status,
    Value<String?> subscriptionId = const Value.absent(),
    int? calculatedCharge,
    int? finalCharge,
    int? discountAmount,
    Value<String?> discountReason = const Value.absent(),
  }) => Session(
    id: id ?? this.id,
    playerId: playerId ?? this.playerId,
    entryType: entryType ?? this.entryType,
    reservedBlocks: reservedBlocks.present
        ? reservedBlocks.value
        : this.reservedBlocks,
    checkInAt: checkInAt ?? this.checkInAt,
    checkOutAt: checkOutAt.present ? checkOutAt.value : this.checkOutAt,
    status: status ?? this.status,
    subscriptionId: subscriptionId.present
        ? subscriptionId.value
        : this.subscriptionId,
    calculatedCharge: calculatedCharge ?? this.calculatedCharge,
    finalCharge: finalCharge ?? this.finalCharge,
    discountAmount: discountAmount ?? this.discountAmount,
    discountReason: discountReason.present
        ? discountReason.value
        : this.discountReason,
  );
  Session copyWithCompanion(SessionsCompanion data) {
    return Session(
      id: data.id.present ? data.id.value : this.id,
      playerId: data.playerId.present ? data.playerId.value : this.playerId,
      entryType: data.entryType.present ? data.entryType.value : this.entryType,
      reservedBlocks: data.reservedBlocks.present
          ? data.reservedBlocks.value
          : this.reservedBlocks,
      checkInAt: data.checkInAt.present ? data.checkInAt.value : this.checkInAt,
      checkOutAt: data.checkOutAt.present
          ? data.checkOutAt.value
          : this.checkOutAt,
      status: data.status.present ? data.status.value : this.status,
      subscriptionId: data.subscriptionId.present
          ? data.subscriptionId.value
          : this.subscriptionId,
      calculatedCharge: data.calculatedCharge.present
          ? data.calculatedCharge.value
          : this.calculatedCharge,
      finalCharge: data.finalCharge.present
          ? data.finalCharge.value
          : this.finalCharge,
      discountAmount: data.discountAmount.present
          ? data.discountAmount.value
          : this.discountAmount,
      discountReason: data.discountReason.present
          ? data.discountReason.value
          : this.discountReason,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Session(')
          ..write('id: $id, ')
          ..write('playerId: $playerId, ')
          ..write('entryType: $entryType, ')
          ..write('reservedBlocks: $reservedBlocks, ')
          ..write('checkInAt: $checkInAt, ')
          ..write('checkOutAt: $checkOutAt, ')
          ..write('status: $status, ')
          ..write('subscriptionId: $subscriptionId, ')
          ..write('calculatedCharge: $calculatedCharge, ')
          ..write('finalCharge: $finalCharge, ')
          ..write('discountAmount: $discountAmount, ')
          ..write('discountReason: $discountReason')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    playerId,
    entryType,
    reservedBlocks,
    checkInAt,
    checkOutAt,
    status,
    subscriptionId,
    calculatedCharge,
    finalCharge,
    discountAmount,
    discountReason,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Session &&
          other.id == this.id &&
          other.playerId == this.playerId &&
          other.entryType == this.entryType &&
          other.reservedBlocks == this.reservedBlocks &&
          other.checkInAt == this.checkInAt &&
          other.checkOutAt == this.checkOutAt &&
          other.status == this.status &&
          other.subscriptionId == this.subscriptionId &&
          other.calculatedCharge == this.calculatedCharge &&
          other.finalCharge == this.finalCharge &&
          other.discountAmount == this.discountAmount &&
          other.discountReason == this.discountReason);
}

class SessionsCompanion extends UpdateCompanion<Session> {
  final Value<String> id;
  final Value<String> playerId;
  final Value<String> entryType;
  final Value<int?> reservedBlocks;
  final Value<String> checkInAt;
  final Value<String?> checkOutAt;
  final Value<String> status;
  final Value<String?> subscriptionId;
  final Value<int> calculatedCharge;
  final Value<int> finalCharge;
  final Value<int> discountAmount;
  final Value<String?> discountReason;
  final Value<int> rowid;
  const SessionsCompanion({
    this.id = const Value.absent(),
    this.playerId = const Value.absent(),
    this.entryType = const Value.absent(),
    this.reservedBlocks = const Value.absent(),
    this.checkInAt = const Value.absent(),
    this.checkOutAt = const Value.absent(),
    this.status = const Value.absent(),
    this.subscriptionId = const Value.absent(),
    this.calculatedCharge = const Value.absent(),
    this.finalCharge = const Value.absent(),
    this.discountAmount = const Value.absent(),
    this.discountReason = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SessionsCompanion.insert({
    required String id,
    required String playerId,
    required String entryType,
    this.reservedBlocks = const Value.absent(),
    required String checkInAt,
    this.checkOutAt = const Value.absent(),
    required String status,
    this.subscriptionId = const Value.absent(),
    required int calculatedCharge,
    required int finalCharge,
    required int discountAmount,
    this.discountReason = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       playerId = Value(playerId),
       entryType = Value(entryType),
       checkInAt = Value(checkInAt),
       status = Value(status),
       calculatedCharge = Value(calculatedCharge),
       finalCharge = Value(finalCharge),
       discountAmount = Value(discountAmount);
  static Insertable<Session> custom({
    Expression<String>? id,
    Expression<String>? playerId,
    Expression<String>? entryType,
    Expression<int>? reservedBlocks,
    Expression<String>? checkInAt,
    Expression<String>? checkOutAt,
    Expression<String>? status,
    Expression<String>? subscriptionId,
    Expression<int>? calculatedCharge,
    Expression<int>? finalCharge,
    Expression<int>? discountAmount,
    Expression<String>? discountReason,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (playerId != null) 'player_id': playerId,
      if (entryType != null) 'entry_type': entryType,
      if (reservedBlocks != null) 'reserved_blocks': reservedBlocks,
      if (checkInAt != null) 'check_in_at': checkInAt,
      if (checkOutAt != null) 'check_out_at': checkOutAt,
      if (status != null) 'status': status,
      if (subscriptionId != null) 'subscription_id': subscriptionId,
      if (calculatedCharge != null) 'calculated_charge': calculatedCharge,
      if (finalCharge != null) 'final_charge': finalCharge,
      if (discountAmount != null) 'discount_amount': discountAmount,
      if (discountReason != null) 'discount_reason': discountReason,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SessionsCompanion copyWith({
    Value<String>? id,
    Value<String>? playerId,
    Value<String>? entryType,
    Value<int?>? reservedBlocks,
    Value<String>? checkInAt,
    Value<String?>? checkOutAt,
    Value<String>? status,
    Value<String?>? subscriptionId,
    Value<int>? calculatedCharge,
    Value<int>? finalCharge,
    Value<int>? discountAmount,
    Value<String?>? discountReason,
    Value<int>? rowid,
  }) {
    return SessionsCompanion(
      id: id ?? this.id,
      playerId: playerId ?? this.playerId,
      entryType: entryType ?? this.entryType,
      reservedBlocks: reservedBlocks ?? this.reservedBlocks,
      checkInAt: checkInAt ?? this.checkInAt,
      checkOutAt: checkOutAt ?? this.checkOutAt,
      status: status ?? this.status,
      subscriptionId: subscriptionId ?? this.subscriptionId,
      calculatedCharge: calculatedCharge ?? this.calculatedCharge,
      finalCharge: finalCharge ?? this.finalCharge,
      discountAmount: discountAmount ?? this.discountAmount,
      discountReason: discountReason ?? this.discountReason,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (playerId.present) {
      map['player_id'] = Variable<String>(playerId.value);
    }
    if (entryType.present) {
      map['entry_type'] = Variable<String>(entryType.value);
    }
    if (reservedBlocks.present) {
      map['reserved_blocks'] = Variable<int>(reservedBlocks.value);
    }
    if (checkInAt.present) {
      map['check_in_at'] = Variable<String>(checkInAt.value);
    }
    if (checkOutAt.present) {
      map['check_out_at'] = Variable<String>(checkOutAt.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (subscriptionId.present) {
      map['subscription_id'] = Variable<String>(subscriptionId.value);
    }
    if (calculatedCharge.present) {
      map['calculated_charge'] = Variable<int>(calculatedCharge.value);
    }
    if (finalCharge.present) {
      map['final_charge'] = Variable<int>(finalCharge.value);
    }
    if (discountAmount.present) {
      map['discount_amount'] = Variable<int>(discountAmount.value);
    }
    if (discountReason.present) {
      map['discount_reason'] = Variable<String>(discountReason.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SessionsCompanion(')
          ..write('id: $id, ')
          ..write('playerId: $playerId, ')
          ..write('entryType: $entryType, ')
          ..write('reservedBlocks: $reservedBlocks, ')
          ..write('checkInAt: $checkInAt, ')
          ..write('checkOutAt: $checkOutAt, ')
          ..write('status: $status, ')
          ..write('subscriptionId: $subscriptionId, ')
          ..write('calculatedCharge: $calculatedCharge, ')
          ..write('finalCharge: $finalCharge, ')
          ..write('discountAmount: $discountAmount, ')
          ..write('discountReason: $discountReason, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SubscriptionUsageLogsTable extends SubscriptionUsageLogs
    with TableInfo<$SubscriptionUsageLogsTable, SubscriptionUsageLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SubscriptionUsageLogsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _subscriptionIdMeta = const VerificationMeta(
    'subscriptionId',
  );
  @override
  late final GeneratedColumn<String> subscriptionId = GeneratedColumn<String>(
    'subscription_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES subscriptions (id)',
    ),
  );
  static const VerificationMeta _sessionIdMeta = const VerificationMeta(
    'sessionId',
  );
  @override
  late final GeneratedColumn<String> sessionId = GeneratedColumn<String>(
    'session_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES sessions (id)',
    ),
  );
  static const VerificationMeta _minutesConsumedMeta = const VerificationMeta(
    'minutesConsumed',
  );
  @override
  late final GeneratedColumn<int> minutesConsumed = GeneratedColumn<int>(
    'minutes_consumed',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    subscriptionId,
    sessionId,
    minutesConsumed,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'subscription_usage_logs';
  @override
  VerificationContext validateIntegrity(
    Insertable<SubscriptionUsageLog> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('subscription_id')) {
      context.handle(
        _subscriptionIdMeta,
        subscriptionId.isAcceptableOrUnknown(
          data['subscription_id']!,
          _subscriptionIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_subscriptionIdMeta);
    }
    if (data.containsKey('session_id')) {
      context.handle(
        _sessionIdMeta,
        sessionId.isAcceptableOrUnknown(data['session_id']!, _sessionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_sessionIdMeta);
    }
    if (data.containsKey('minutes_consumed')) {
      context.handle(
        _minutesConsumedMeta,
        minutesConsumed.isAcceptableOrUnknown(
          data['minutes_consumed']!,
          _minutesConsumedMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_minutesConsumedMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SubscriptionUsageLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SubscriptionUsageLog(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      subscriptionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}subscription_id'],
      )!,
      sessionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}session_id'],
      )!,
      minutesConsumed: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}minutes_consumed'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $SubscriptionUsageLogsTable createAlias(String alias) {
    return $SubscriptionUsageLogsTable(attachedDatabase, alias);
  }
}

class SubscriptionUsageLog extends DataClass
    implements Insertable<SubscriptionUsageLog> {
  final int id;
  final String subscriptionId;
  final String sessionId;
  final int minutesConsumed;
  final String createdAt;
  const SubscriptionUsageLog({
    required this.id,
    required this.subscriptionId,
    required this.sessionId,
    required this.minutesConsumed,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['subscription_id'] = Variable<String>(subscriptionId);
    map['session_id'] = Variable<String>(sessionId);
    map['minutes_consumed'] = Variable<int>(minutesConsumed);
    map['created_at'] = Variable<String>(createdAt);
    return map;
  }

  SubscriptionUsageLogsCompanion toCompanion(bool nullToAbsent) {
    return SubscriptionUsageLogsCompanion(
      id: Value(id),
      subscriptionId: Value(subscriptionId),
      sessionId: Value(sessionId),
      minutesConsumed: Value(minutesConsumed),
      createdAt: Value(createdAt),
    );
  }

  factory SubscriptionUsageLog.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SubscriptionUsageLog(
      id: serializer.fromJson<int>(json['id']),
      subscriptionId: serializer.fromJson<String>(json['subscriptionId']),
      sessionId: serializer.fromJson<String>(json['sessionId']),
      minutesConsumed: serializer.fromJson<int>(json['minutesConsumed']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'subscriptionId': serializer.toJson<String>(subscriptionId),
      'sessionId': serializer.toJson<String>(sessionId),
      'minutesConsumed': serializer.toJson<int>(minutesConsumed),
      'createdAt': serializer.toJson<String>(createdAt),
    };
  }

  SubscriptionUsageLog copyWith({
    int? id,
    String? subscriptionId,
    String? sessionId,
    int? minutesConsumed,
    String? createdAt,
  }) => SubscriptionUsageLog(
    id: id ?? this.id,
    subscriptionId: subscriptionId ?? this.subscriptionId,
    sessionId: sessionId ?? this.sessionId,
    minutesConsumed: minutesConsumed ?? this.minutesConsumed,
    createdAt: createdAt ?? this.createdAt,
  );
  SubscriptionUsageLog copyWithCompanion(SubscriptionUsageLogsCompanion data) {
    return SubscriptionUsageLog(
      id: data.id.present ? data.id.value : this.id,
      subscriptionId: data.subscriptionId.present
          ? data.subscriptionId.value
          : this.subscriptionId,
      sessionId: data.sessionId.present ? data.sessionId.value : this.sessionId,
      minutesConsumed: data.minutesConsumed.present
          ? data.minutesConsumed.value
          : this.minutesConsumed,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SubscriptionUsageLog(')
          ..write('id: $id, ')
          ..write('subscriptionId: $subscriptionId, ')
          ..write('sessionId: $sessionId, ')
          ..write('minutesConsumed: $minutesConsumed, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, subscriptionId, sessionId, minutesConsumed, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SubscriptionUsageLog &&
          other.id == this.id &&
          other.subscriptionId == this.subscriptionId &&
          other.sessionId == this.sessionId &&
          other.minutesConsumed == this.minutesConsumed &&
          other.createdAt == this.createdAt);
}

class SubscriptionUsageLogsCompanion
    extends UpdateCompanion<SubscriptionUsageLog> {
  final Value<int> id;
  final Value<String> subscriptionId;
  final Value<String> sessionId;
  final Value<int> minutesConsumed;
  final Value<String> createdAt;
  const SubscriptionUsageLogsCompanion({
    this.id = const Value.absent(),
    this.subscriptionId = const Value.absent(),
    this.sessionId = const Value.absent(),
    this.minutesConsumed = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  SubscriptionUsageLogsCompanion.insert({
    this.id = const Value.absent(),
    required String subscriptionId,
    required String sessionId,
    required int minutesConsumed,
    required String createdAt,
  }) : subscriptionId = Value(subscriptionId),
       sessionId = Value(sessionId),
       minutesConsumed = Value(minutesConsumed),
       createdAt = Value(createdAt);
  static Insertable<SubscriptionUsageLog> custom({
    Expression<int>? id,
    Expression<String>? subscriptionId,
    Expression<String>? sessionId,
    Expression<int>? minutesConsumed,
    Expression<String>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (subscriptionId != null) 'subscription_id': subscriptionId,
      if (sessionId != null) 'session_id': sessionId,
      if (minutesConsumed != null) 'minutes_consumed': minutesConsumed,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  SubscriptionUsageLogsCompanion copyWith({
    Value<int>? id,
    Value<String>? subscriptionId,
    Value<String>? sessionId,
    Value<int>? minutesConsumed,
    Value<String>? createdAt,
  }) {
    return SubscriptionUsageLogsCompanion(
      id: id ?? this.id,
      subscriptionId: subscriptionId ?? this.subscriptionId,
      sessionId: sessionId ?? this.sessionId,
      minutesConsumed: minutesConsumed ?? this.minutesConsumed,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (subscriptionId.present) {
      map['subscription_id'] = Variable<String>(subscriptionId.value);
    }
    if (sessionId.present) {
      map['session_id'] = Variable<String>(sessionId.value);
    }
    if (minutesConsumed.present) {
      map['minutes_consumed'] = Variable<int>(minutesConsumed.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SubscriptionUsageLogsCompanion(')
          ..write('id: $id, ')
          ..write('subscriptionId: $subscriptionId, ')
          ..write('sessionId: $sessionId, ')
          ..write('minutesConsumed: $minutesConsumed, ')
          ..write('createdAt: $createdAt')
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
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
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
  static const VerificationMeta _skuMeta = const VerificationMeta('sku');
  @override
  late final GeneratedColumn<String> sku = GeneratedColumn<String>(
    'sku',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'UNIQUE NOT NULL',
  );
  static const VerificationMeta _unitPriceMeta = const VerificationMeta(
    'unitPrice',
  );
  @override
  late final GeneratedColumn<int> unitPrice = GeneratedColumn<int>(
    'unit_price',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _currentStockMeta = const VerificationMeta(
    'currentStock',
  );
  @override
  late final GeneratedColumn<int> currentStock = GeneratedColumn<int>(
    'current_stock',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    sku,
    unitPrice,
    currentStock,
    isActive,
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
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('sku')) {
      context.handle(
        _skuMeta,
        sku.isAcceptableOrUnknown(data['sku']!, _skuMeta),
      );
    } else if (isInserting) {
      context.missing(_skuMeta);
    }
    if (data.containsKey('unit_price')) {
      context.handle(
        _unitPriceMeta,
        unitPrice.isAcceptableOrUnknown(data['unit_price']!, _unitPriceMeta),
      );
    } else if (isInserting) {
      context.missing(_unitPriceMeta);
    }
    if (data.containsKey('current_stock')) {
      context.handle(
        _currentStockMeta,
        currentStock.isAcceptableOrUnknown(
          data['current_stock']!,
          _currentStockMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_currentStockMeta);
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    } else if (isInserting) {
      context.missing(_isActiveMeta);
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
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      sku: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sku'],
      )!,
      unitPrice: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}unit_price'],
      )!,
      currentStock: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}current_stock'],
      )!,
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
    );
  }

  @override
  $ProductsTable createAlias(String alias) {
    return $ProductsTable(attachedDatabase, alias);
  }
}

class Product extends DataClass implements Insertable<Product> {
  final String id;
  final String name;
  final String sku;
  final int unitPrice;
  final int currentStock;
  final bool isActive;
  const Product({
    required this.id,
    required this.name,
    required this.sku,
    required this.unitPrice,
    required this.currentStock,
    required this.isActive,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['sku'] = Variable<String>(sku);
    map['unit_price'] = Variable<int>(unitPrice);
    map['current_stock'] = Variable<int>(currentStock);
    map['is_active'] = Variable<bool>(isActive);
    return map;
  }

  ProductsCompanion toCompanion(bool nullToAbsent) {
    return ProductsCompanion(
      id: Value(id),
      name: Value(name),
      sku: Value(sku),
      unitPrice: Value(unitPrice),
      currentStock: Value(currentStock),
      isActive: Value(isActive),
    );
  }

  factory Product.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Product(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      sku: serializer.fromJson<String>(json['sku']),
      unitPrice: serializer.fromJson<int>(json['unitPrice']),
      currentStock: serializer.fromJson<int>(json['currentStock']),
      isActive: serializer.fromJson<bool>(json['isActive']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'sku': serializer.toJson<String>(sku),
      'unitPrice': serializer.toJson<int>(unitPrice),
      'currentStock': serializer.toJson<int>(currentStock),
      'isActive': serializer.toJson<bool>(isActive),
    };
  }

  Product copyWith({
    String? id,
    String? name,
    String? sku,
    int? unitPrice,
    int? currentStock,
    bool? isActive,
  }) => Product(
    id: id ?? this.id,
    name: name ?? this.name,
    sku: sku ?? this.sku,
    unitPrice: unitPrice ?? this.unitPrice,
    currentStock: currentStock ?? this.currentStock,
    isActive: isActive ?? this.isActive,
  );
  Product copyWithCompanion(ProductsCompanion data) {
    return Product(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      sku: data.sku.present ? data.sku.value : this.sku,
      unitPrice: data.unitPrice.present ? data.unitPrice.value : this.unitPrice,
      currentStock: data.currentStock.present
          ? data.currentStock.value
          : this.currentStock,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Product(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('sku: $sku, ')
          ..write('unitPrice: $unitPrice, ')
          ..write('currentStock: $currentStock, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, sku, unitPrice, currentStock, isActive);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Product &&
          other.id == this.id &&
          other.name == this.name &&
          other.sku == this.sku &&
          other.unitPrice == this.unitPrice &&
          other.currentStock == this.currentStock &&
          other.isActive == this.isActive);
}

class ProductsCompanion extends UpdateCompanion<Product> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> sku;
  final Value<int> unitPrice;
  final Value<int> currentStock;
  final Value<bool> isActive;
  final Value<int> rowid;
  const ProductsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.sku = const Value.absent(),
    this.unitPrice = const Value.absent(),
    this.currentStock = const Value.absent(),
    this.isActive = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProductsCompanion.insert({
    required String id,
    required String name,
    required String sku,
    required int unitPrice,
    required int currentStock,
    required bool isActive,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       sku = Value(sku),
       unitPrice = Value(unitPrice),
       currentStock = Value(currentStock),
       isActive = Value(isActive);
  static Insertable<Product> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? sku,
    Expression<int>? unitPrice,
    Expression<int>? currentStock,
    Expression<bool>? isActive,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (sku != null) 'sku': sku,
      if (unitPrice != null) 'unit_price': unitPrice,
      if (currentStock != null) 'current_stock': currentStock,
      if (isActive != null) 'is_active': isActive,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProductsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? sku,
    Value<int>? unitPrice,
    Value<int>? currentStock,
    Value<bool>? isActive,
    Value<int>? rowid,
  }) {
    return ProductsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      sku: sku ?? this.sku,
      unitPrice: unitPrice ?? this.unitPrice,
      currentStock: currentStock ?? this.currentStock,
      isActive: isActive ?? this.isActive,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (sku.present) {
      map['sku'] = Variable<String>(sku.value);
    }
    if (unitPrice.present) {
      map['unit_price'] = Variable<int>(unitPrice.value);
    }
    if (currentStock.present) {
      map['current_stock'] = Variable<int>(currentStock.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('sku: $sku, ')
          ..write('unitPrice: $unitPrice, ')
          ..write('currentStock: $currentStock, ')
          ..write('isActive: $isActive, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProductSalesTable extends ProductSales
    with TableInfo<$ProductSalesTable, ProductSale> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductSalesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _playerIdMeta = const VerificationMeta(
    'playerId',
  );
  @override
  late final GeneratedColumn<String> playerId = GeneratedColumn<String>(
    'player_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES players (id)',
    ),
  );
  static const VerificationMeta _soldAtMeta = const VerificationMeta('soldAt');
  @override
  late final GeneratedColumn<String> soldAt = GeneratedColumn<String>(
    'sold_at',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _totalChargeMeta = const VerificationMeta(
    'totalCharge',
  );
  @override
  late final GeneratedColumn<int> totalCharge = GeneratedColumn<int>(
    'total_charge',
    aliasedName,
    false,
    type: DriftSqlType.int,
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
  @override
  List<GeneratedColumn> get $columns => [
    id,
    playerId,
    soldAt,
    totalCharge,
    status,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'product_sales';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProductSale> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('player_id')) {
      context.handle(
        _playerIdMeta,
        playerId.isAcceptableOrUnknown(data['player_id']!, _playerIdMeta),
      );
    }
    if (data.containsKey('sold_at')) {
      context.handle(
        _soldAtMeta,
        soldAt.isAcceptableOrUnknown(data['sold_at']!, _soldAtMeta),
      );
    } else if (isInserting) {
      context.missing(_soldAtMeta);
    }
    if (data.containsKey('total_charge')) {
      context.handle(
        _totalChargeMeta,
        totalCharge.isAcceptableOrUnknown(
          data['total_charge']!,
          _totalChargeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_totalChargeMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProductSale map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductSale(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      playerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}player_id'],
      ),
      soldAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sold_at'],
      )!,
      totalCharge: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_charge'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
    );
  }

  @override
  $ProductSalesTable createAlias(String alias) {
    return $ProductSalesTable(attachedDatabase, alias);
  }
}

class ProductSale extends DataClass implements Insertable<ProductSale> {
  final String id;
  final String? playerId;
  final String soldAt;
  final int totalCharge;
  final String status;
  const ProductSale({
    required this.id,
    this.playerId,
    required this.soldAt,
    required this.totalCharge,
    required this.status,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || playerId != null) {
      map['player_id'] = Variable<String>(playerId);
    }
    map['sold_at'] = Variable<String>(soldAt);
    map['total_charge'] = Variable<int>(totalCharge);
    map['status'] = Variable<String>(status);
    return map;
  }

  ProductSalesCompanion toCompanion(bool nullToAbsent) {
    return ProductSalesCompanion(
      id: Value(id),
      playerId: playerId == null && nullToAbsent
          ? const Value.absent()
          : Value(playerId),
      soldAt: Value(soldAt),
      totalCharge: Value(totalCharge),
      status: Value(status),
    );
  }

  factory ProductSale.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductSale(
      id: serializer.fromJson<String>(json['id']),
      playerId: serializer.fromJson<String?>(json['playerId']),
      soldAt: serializer.fromJson<String>(json['soldAt']),
      totalCharge: serializer.fromJson<int>(json['totalCharge']),
      status: serializer.fromJson<String>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'playerId': serializer.toJson<String?>(playerId),
      'soldAt': serializer.toJson<String>(soldAt),
      'totalCharge': serializer.toJson<int>(totalCharge),
      'status': serializer.toJson<String>(status),
    };
  }

  ProductSale copyWith({
    String? id,
    Value<String?> playerId = const Value.absent(),
    String? soldAt,
    int? totalCharge,
    String? status,
  }) => ProductSale(
    id: id ?? this.id,
    playerId: playerId.present ? playerId.value : this.playerId,
    soldAt: soldAt ?? this.soldAt,
    totalCharge: totalCharge ?? this.totalCharge,
    status: status ?? this.status,
  );
  ProductSale copyWithCompanion(ProductSalesCompanion data) {
    return ProductSale(
      id: data.id.present ? data.id.value : this.id,
      playerId: data.playerId.present ? data.playerId.value : this.playerId,
      soldAt: data.soldAt.present ? data.soldAt.value : this.soldAt,
      totalCharge: data.totalCharge.present
          ? data.totalCharge.value
          : this.totalCharge,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProductSale(')
          ..write('id: $id, ')
          ..write('playerId: $playerId, ')
          ..write('soldAt: $soldAt, ')
          ..write('totalCharge: $totalCharge, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, playerId, soldAt, totalCharge, status);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductSale &&
          other.id == this.id &&
          other.playerId == this.playerId &&
          other.soldAt == this.soldAt &&
          other.totalCharge == this.totalCharge &&
          other.status == this.status);
}

class ProductSalesCompanion extends UpdateCompanion<ProductSale> {
  final Value<String> id;
  final Value<String?> playerId;
  final Value<String> soldAt;
  final Value<int> totalCharge;
  final Value<String> status;
  final Value<int> rowid;
  const ProductSalesCompanion({
    this.id = const Value.absent(),
    this.playerId = const Value.absent(),
    this.soldAt = const Value.absent(),
    this.totalCharge = const Value.absent(),
    this.status = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProductSalesCompanion.insert({
    required String id,
    this.playerId = const Value.absent(),
    required String soldAt,
    required int totalCharge,
    required String status,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       soldAt = Value(soldAt),
       totalCharge = Value(totalCharge),
       status = Value(status);
  static Insertable<ProductSale> custom({
    Expression<String>? id,
    Expression<String>? playerId,
    Expression<String>? soldAt,
    Expression<int>? totalCharge,
    Expression<String>? status,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (playerId != null) 'player_id': playerId,
      if (soldAt != null) 'sold_at': soldAt,
      if (totalCharge != null) 'total_charge': totalCharge,
      if (status != null) 'status': status,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProductSalesCompanion copyWith({
    Value<String>? id,
    Value<String?>? playerId,
    Value<String>? soldAt,
    Value<int>? totalCharge,
    Value<String>? status,
    Value<int>? rowid,
  }) {
    return ProductSalesCompanion(
      id: id ?? this.id,
      playerId: playerId ?? this.playerId,
      soldAt: soldAt ?? this.soldAt,
      totalCharge: totalCharge ?? this.totalCharge,
      status: status ?? this.status,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (playerId.present) {
      map['player_id'] = Variable<String>(playerId.value);
    }
    if (soldAt.present) {
      map['sold_at'] = Variable<String>(soldAt.value);
    }
    if (totalCharge.present) {
      map['total_charge'] = Variable<int>(totalCharge.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductSalesCompanion(')
          ..write('id: $id, ')
          ..write('playerId: $playerId, ')
          ..write('soldAt: $soldAt, ')
          ..write('totalCharge: $totalCharge, ')
          ..write('status: $status, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SaleItemsTable extends SaleItems
    with TableInfo<$SaleItemsTable, SaleItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SaleItemsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _saleIdMeta = const VerificationMeta('saleId');
  @override
  late final GeneratedColumn<String> saleId = GeneratedColumn<String>(
    'sale_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES product_sales (id)',
    ),
  );
  static const VerificationMeta _productIdMeta = const VerificationMeta(
    'productId',
  );
  @override
  late final GeneratedColumn<String> productId = GeneratedColumn<String>(
    'product_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES products (id)',
    ),
  );
  static const VerificationMeta _productNameSnapshotMeta =
      const VerificationMeta('productNameSnapshot');
  @override
  late final GeneratedColumn<String> productNameSnapshot =
      GeneratedColumn<String>(
        'product_name_snapshot',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _quantityMeta = const VerificationMeta(
    'quantity',
  );
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
    'quantity',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _unitPriceSnapshotMeta = const VerificationMeta(
    'unitPriceSnapshot',
  );
  @override
  late final GeneratedColumn<int> unitPriceSnapshot = GeneratedColumn<int>(
    'unit_price_snapshot',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    saleId,
    productId,
    productNameSnapshot,
    quantity,
    unitPriceSnapshot,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sale_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<SaleItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('sale_id')) {
      context.handle(
        _saleIdMeta,
        saleId.isAcceptableOrUnknown(data['sale_id']!, _saleIdMeta),
      );
    } else if (isInserting) {
      context.missing(_saleIdMeta);
    }
    if (data.containsKey('product_id')) {
      context.handle(
        _productIdMeta,
        productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta),
      );
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('product_name_snapshot')) {
      context.handle(
        _productNameSnapshotMeta,
        productNameSnapshot.isAcceptableOrUnknown(
          data['product_name_snapshot']!,
          _productNameSnapshotMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_productNameSnapshotMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(
        _quantityMeta,
        quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta),
      );
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('unit_price_snapshot')) {
      context.handle(
        _unitPriceSnapshotMeta,
        unitPriceSnapshot.isAcceptableOrUnknown(
          data['unit_price_snapshot']!,
          _unitPriceSnapshotMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_unitPriceSnapshotMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SaleItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SaleItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      saleId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sale_id'],
      )!,
      productId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product_id'],
      )!,
      productNameSnapshot: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product_name_snapshot'],
      )!,
      quantity: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}quantity'],
      )!,
      unitPriceSnapshot: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}unit_price_snapshot'],
      )!,
    );
  }

  @override
  $SaleItemsTable createAlias(String alias) {
    return $SaleItemsTable(attachedDatabase, alias);
  }
}

class SaleItem extends DataClass implements Insertable<SaleItem> {
  final int id;
  final String saleId;
  final String productId;
  final String productNameSnapshot;
  final int quantity;
  final int unitPriceSnapshot;
  const SaleItem({
    required this.id,
    required this.saleId,
    required this.productId,
    required this.productNameSnapshot,
    required this.quantity,
    required this.unitPriceSnapshot,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['sale_id'] = Variable<String>(saleId);
    map['product_id'] = Variable<String>(productId);
    map['product_name_snapshot'] = Variable<String>(productNameSnapshot);
    map['quantity'] = Variable<int>(quantity);
    map['unit_price_snapshot'] = Variable<int>(unitPriceSnapshot);
    return map;
  }

  SaleItemsCompanion toCompanion(bool nullToAbsent) {
    return SaleItemsCompanion(
      id: Value(id),
      saleId: Value(saleId),
      productId: Value(productId),
      productNameSnapshot: Value(productNameSnapshot),
      quantity: Value(quantity),
      unitPriceSnapshot: Value(unitPriceSnapshot),
    );
  }

  factory SaleItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SaleItem(
      id: serializer.fromJson<int>(json['id']),
      saleId: serializer.fromJson<String>(json['saleId']),
      productId: serializer.fromJson<String>(json['productId']),
      productNameSnapshot: serializer.fromJson<String>(
        json['productNameSnapshot'],
      ),
      quantity: serializer.fromJson<int>(json['quantity']),
      unitPriceSnapshot: serializer.fromJson<int>(json['unitPriceSnapshot']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'saleId': serializer.toJson<String>(saleId),
      'productId': serializer.toJson<String>(productId),
      'productNameSnapshot': serializer.toJson<String>(productNameSnapshot),
      'quantity': serializer.toJson<int>(quantity),
      'unitPriceSnapshot': serializer.toJson<int>(unitPriceSnapshot),
    };
  }

  SaleItem copyWith({
    int? id,
    String? saleId,
    String? productId,
    String? productNameSnapshot,
    int? quantity,
    int? unitPriceSnapshot,
  }) => SaleItem(
    id: id ?? this.id,
    saleId: saleId ?? this.saleId,
    productId: productId ?? this.productId,
    productNameSnapshot: productNameSnapshot ?? this.productNameSnapshot,
    quantity: quantity ?? this.quantity,
    unitPriceSnapshot: unitPriceSnapshot ?? this.unitPriceSnapshot,
  );
  SaleItem copyWithCompanion(SaleItemsCompanion data) {
    return SaleItem(
      id: data.id.present ? data.id.value : this.id,
      saleId: data.saleId.present ? data.saleId.value : this.saleId,
      productId: data.productId.present ? data.productId.value : this.productId,
      productNameSnapshot: data.productNameSnapshot.present
          ? data.productNameSnapshot.value
          : this.productNameSnapshot,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      unitPriceSnapshot: data.unitPriceSnapshot.present
          ? data.unitPriceSnapshot.value
          : this.unitPriceSnapshot,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SaleItem(')
          ..write('id: $id, ')
          ..write('saleId: $saleId, ')
          ..write('productId: $productId, ')
          ..write('productNameSnapshot: $productNameSnapshot, ')
          ..write('quantity: $quantity, ')
          ..write('unitPriceSnapshot: $unitPriceSnapshot')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    saleId,
    productId,
    productNameSnapshot,
    quantity,
    unitPriceSnapshot,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SaleItem &&
          other.id == this.id &&
          other.saleId == this.saleId &&
          other.productId == this.productId &&
          other.productNameSnapshot == this.productNameSnapshot &&
          other.quantity == this.quantity &&
          other.unitPriceSnapshot == this.unitPriceSnapshot);
}

class SaleItemsCompanion extends UpdateCompanion<SaleItem> {
  final Value<int> id;
  final Value<String> saleId;
  final Value<String> productId;
  final Value<String> productNameSnapshot;
  final Value<int> quantity;
  final Value<int> unitPriceSnapshot;
  const SaleItemsCompanion({
    this.id = const Value.absent(),
    this.saleId = const Value.absent(),
    this.productId = const Value.absent(),
    this.productNameSnapshot = const Value.absent(),
    this.quantity = const Value.absent(),
    this.unitPriceSnapshot = const Value.absent(),
  });
  SaleItemsCompanion.insert({
    this.id = const Value.absent(),
    required String saleId,
    required String productId,
    required String productNameSnapshot,
    required int quantity,
    required int unitPriceSnapshot,
  }) : saleId = Value(saleId),
       productId = Value(productId),
       productNameSnapshot = Value(productNameSnapshot),
       quantity = Value(quantity),
       unitPriceSnapshot = Value(unitPriceSnapshot);
  static Insertable<SaleItem> custom({
    Expression<int>? id,
    Expression<String>? saleId,
    Expression<String>? productId,
    Expression<String>? productNameSnapshot,
    Expression<int>? quantity,
    Expression<int>? unitPriceSnapshot,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (saleId != null) 'sale_id': saleId,
      if (productId != null) 'product_id': productId,
      if (productNameSnapshot != null)
        'product_name_snapshot': productNameSnapshot,
      if (quantity != null) 'quantity': quantity,
      if (unitPriceSnapshot != null) 'unit_price_snapshot': unitPriceSnapshot,
    });
  }

  SaleItemsCompanion copyWith({
    Value<int>? id,
    Value<String>? saleId,
    Value<String>? productId,
    Value<String>? productNameSnapshot,
    Value<int>? quantity,
    Value<int>? unitPriceSnapshot,
  }) {
    return SaleItemsCompanion(
      id: id ?? this.id,
      saleId: saleId ?? this.saleId,
      productId: productId ?? this.productId,
      productNameSnapshot: productNameSnapshot ?? this.productNameSnapshot,
      quantity: quantity ?? this.quantity,
      unitPriceSnapshot: unitPriceSnapshot ?? this.unitPriceSnapshot,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (saleId.present) {
      map['sale_id'] = Variable<String>(saleId.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<String>(productId.value);
    }
    if (productNameSnapshot.present) {
      map['product_name_snapshot'] = Variable<String>(
        productNameSnapshot.value,
      );
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (unitPriceSnapshot.present) {
      map['unit_price_snapshot'] = Variable<int>(unitPriceSnapshot.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SaleItemsCompanion(')
          ..write('id: $id, ')
          ..write('saleId: $saleId, ')
          ..write('productId: $productId, ')
          ..write('productNameSnapshot: $productNameSnapshot, ')
          ..write('quantity: $quantity, ')
          ..write('unitPriceSnapshot: $unitPriceSnapshot')
          ..write(')'))
        .toString();
  }
}

class $PaymentsTable extends Payments with TableInfo<$PaymentsTable, Payment> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PaymentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _paymentGroupIdMeta = const VerificationMeta(
    'paymentGroupId',
  );
  @override
  late final GeneratedColumn<String> paymentGroupId = GeneratedColumn<String>(
    'payment_group_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _playerIdMeta = const VerificationMeta(
    'playerId',
  );
  @override
  late final GeneratedColumn<String> playerId = GeneratedColumn<String>(
    'player_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES players (id)',
    ),
  );
  static const VerificationMeta _paymentMethodMeta = const VerificationMeta(
    'paymentMethod',
  );
  @override
  late final GeneratedColumn<String> paymentMethod = GeneratedColumn<String>(
    'payment_method',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountPaidMeta = const VerificationMeta(
    'amountPaid',
  );
  @override
  late final GeneratedColumn<int> amountPaid = GeneratedColumn<int>(
    'amount_paid',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tipAmountMeta = const VerificationMeta(
    'tipAmount',
  );
  @override
  late final GeneratedColumn<int> tipAmount = GeneratedColumn<int>(
    'tip_amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
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
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sessionIdMeta = const VerificationMeta(
    'sessionId',
  );
  @override
  late final GeneratedColumn<String> sessionId = GeneratedColumn<String>(
    'session_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES sessions (id)',
    ),
  );
  static const VerificationMeta _saleIdMeta = const VerificationMeta('saleId');
  @override
  late final GeneratedColumn<String> saleId = GeneratedColumn<String>(
    'sale_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES product_sales (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    paymentGroupId,
    playerId,
    paymentMethod,
    amountPaid,
    tipAmount,
    status,
    createdAt,
    sessionId,
    saleId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'payments';
  @override
  VerificationContext validateIntegrity(
    Insertable<Payment> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('payment_group_id')) {
      context.handle(
        _paymentGroupIdMeta,
        paymentGroupId.isAcceptableOrUnknown(
          data['payment_group_id']!,
          _paymentGroupIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_paymentGroupIdMeta);
    }
    if (data.containsKey('player_id')) {
      context.handle(
        _playerIdMeta,
        playerId.isAcceptableOrUnknown(data['player_id']!, _playerIdMeta),
      );
    }
    if (data.containsKey('payment_method')) {
      context.handle(
        _paymentMethodMeta,
        paymentMethod.isAcceptableOrUnknown(
          data['payment_method']!,
          _paymentMethodMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_paymentMethodMeta);
    }
    if (data.containsKey('amount_paid')) {
      context.handle(
        _amountPaidMeta,
        amountPaid.isAcceptableOrUnknown(data['amount_paid']!, _amountPaidMeta),
      );
    } else if (isInserting) {
      context.missing(_amountPaidMeta);
    }
    if (data.containsKey('tip_amount')) {
      context.handle(
        _tipAmountMeta,
        tipAmount.isAcceptableOrUnknown(data['tip_amount']!, _tipAmountMeta),
      );
    } else if (isInserting) {
      context.missing(_tipAmountMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('session_id')) {
      context.handle(
        _sessionIdMeta,
        sessionId.isAcceptableOrUnknown(data['session_id']!, _sessionIdMeta),
      );
    }
    if (data.containsKey('sale_id')) {
      context.handle(
        _saleIdMeta,
        saleId.isAcceptableOrUnknown(data['sale_id']!, _saleIdMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Payment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Payment(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      paymentGroupId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payment_group_id'],
      )!,
      playerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}player_id'],
      ),
      paymentMethod: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payment_method'],
      )!,
      amountPaid: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount_paid'],
      )!,
      tipAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}tip_amount'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_at'],
      )!,
      sessionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}session_id'],
      ),
      saleId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sale_id'],
      ),
    );
  }

  @override
  $PaymentsTable createAlias(String alias) {
    return $PaymentsTable(attachedDatabase, alias);
  }
}

class Payment extends DataClass implements Insertable<Payment> {
  final String id;
  final String paymentGroupId;
  final String? playerId;
  final String paymentMethod;
  final int amountPaid;
  final int tipAmount;
  final String status;
  final String createdAt;
  final String? sessionId;
  final String? saleId;
  const Payment({
    required this.id,
    required this.paymentGroupId,
    this.playerId,
    required this.paymentMethod,
    required this.amountPaid,
    required this.tipAmount,
    required this.status,
    required this.createdAt,
    this.sessionId,
    this.saleId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['payment_group_id'] = Variable<String>(paymentGroupId);
    if (!nullToAbsent || playerId != null) {
      map['player_id'] = Variable<String>(playerId);
    }
    map['payment_method'] = Variable<String>(paymentMethod);
    map['amount_paid'] = Variable<int>(amountPaid);
    map['tip_amount'] = Variable<int>(tipAmount);
    map['status'] = Variable<String>(status);
    map['created_at'] = Variable<String>(createdAt);
    if (!nullToAbsent || sessionId != null) {
      map['session_id'] = Variable<String>(sessionId);
    }
    if (!nullToAbsent || saleId != null) {
      map['sale_id'] = Variable<String>(saleId);
    }
    return map;
  }

  PaymentsCompanion toCompanion(bool nullToAbsent) {
    return PaymentsCompanion(
      id: Value(id),
      paymentGroupId: Value(paymentGroupId),
      playerId: playerId == null && nullToAbsent
          ? const Value.absent()
          : Value(playerId),
      paymentMethod: Value(paymentMethod),
      amountPaid: Value(amountPaid),
      tipAmount: Value(tipAmount),
      status: Value(status),
      createdAt: Value(createdAt),
      sessionId: sessionId == null && nullToAbsent
          ? const Value.absent()
          : Value(sessionId),
      saleId: saleId == null && nullToAbsent
          ? const Value.absent()
          : Value(saleId),
    );
  }

  factory Payment.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Payment(
      id: serializer.fromJson<String>(json['id']),
      paymentGroupId: serializer.fromJson<String>(json['paymentGroupId']),
      playerId: serializer.fromJson<String?>(json['playerId']),
      paymentMethod: serializer.fromJson<String>(json['paymentMethod']),
      amountPaid: serializer.fromJson<int>(json['amountPaid']),
      tipAmount: serializer.fromJson<int>(json['tipAmount']),
      status: serializer.fromJson<String>(json['status']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
      sessionId: serializer.fromJson<String?>(json['sessionId']),
      saleId: serializer.fromJson<String?>(json['saleId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'paymentGroupId': serializer.toJson<String>(paymentGroupId),
      'playerId': serializer.toJson<String?>(playerId),
      'paymentMethod': serializer.toJson<String>(paymentMethod),
      'amountPaid': serializer.toJson<int>(amountPaid),
      'tipAmount': serializer.toJson<int>(tipAmount),
      'status': serializer.toJson<String>(status),
      'createdAt': serializer.toJson<String>(createdAt),
      'sessionId': serializer.toJson<String?>(sessionId),
      'saleId': serializer.toJson<String?>(saleId),
    };
  }

  Payment copyWith({
    String? id,
    String? paymentGroupId,
    Value<String?> playerId = const Value.absent(),
    String? paymentMethod,
    int? amountPaid,
    int? tipAmount,
    String? status,
    String? createdAt,
    Value<String?> sessionId = const Value.absent(),
    Value<String?> saleId = const Value.absent(),
  }) => Payment(
    id: id ?? this.id,
    paymentGroupId: paymentGroupId ?? this.paymentGroupId,
    playerId: playerId.present ? playerId.value : this.playerId,
    paymentMethod: paymentMethod ?? this.paymentMethod,
    amountPaid: amountPaid ?? this.amountPaid,
    tipAmount: tipAmount ?? this.tipAmount,
    status: status ?? this.status,
    createdAt: createdAt ?? this.createdAt,
    sessionId: sessionId.present ? sessionId.value : this.sessionId,
    saleId: saleId.present ? saleId.value : this.saleId,
  );
  Payment copyWithCompanion(PaymentsCompanion data) {
    return Payment(
      id: data.id.present ? data.id.value : this.id,
      paymentGroupId: data.paymentGroupId.present
          ? data.paymentGroupId.value
          : this.paymentGroupId,
      playerId: data.playerId.present ? data.playerId.value : this.playerId,
      paymentMethod: data.paymentMethod.present
          ? data.paymentMethod.value
          : this.paymentMethod,
      amountPaid: data.amountPaid.present
          ? data.amountPaid.value
          : this.amountPaid,
      tipAmount: data.tipAmount.present ? data.tipAmount.value : this.tipAmount,
      status: data.status.present ? data.status.value : this.status,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      sessionId: data.sessionId.present ? data.sessionId.value : this.sessionId,
      saleId: data.saleId.present ? data.saleId.value : this.saleId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Payment(')
          ..write('id: $id, ')
          ..write('paymentGroupId: $paymentGroupId, ')
          ..write('playerId: $playerId, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('amountPaid: $amountPaid, ')
          ..write('tipAmount: $tipAmount, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('sessionId: $sessionId, ')
          ..write('saleId: $saleId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    paymentGroupId,
    playerId,
    paymentMethod,
    amountPaid,
    tipAmount,
    status,
    createdAt,
    sessionId,
    saleId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Payment &&
          other.id == this.id &&
          other.paymentGroupId == this.paymentGroupId &&
          other.playerId == this.playerId &&
          other.paymentMethod == this.paymentMethod &&
          other.amountPaid == this.amountPaid &&
          other.tipAmount == this.tipAmount &&
          other.status == this.status &&
          other.createdAt == this.createdAt &&
          other.sessionId == this.sessionId &&
          other.saleId == this.saleId);
}

class PaymentsCompanion extends UpdateCompanion<Payment> {
  final Value<String> id;
  final Value<String> paymentGroupId;
  final Value<String?> playerId;
  final Value<String> paymentMethod;
  final Value<int> amountPaid;
  final Value<int> tipAmount;
  final Value<String> status;
  final Value<String> createdAt;
  final Value<String?> sessionId;
  final Value<String?> saleId;
  final Value<int> rowid;
  const PaymentsCompanion({
    this.id = const Value.absent(),
    this.paymentGroupId = const Value.absent(),
    this.playerId = const Value.absent(),
    this.paymentMethod = const Value.absent(),
    this.amountPaid = const Value.absent(),
    this.tipAmount = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.sessionId = const Value.absent(),
    this.saleId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PaymentsCompanion.insert({
    required String id,
    required String paymentGroupId,
    this.playerId = const Value.absent(),
    required String paymentMethod,
    required int amountPaid,
    required int tipAmount,
    required String status,
    required String createdAt,
    this.sessionId = const Value.absent(),
    this.saleId = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       paymentGroupId = Value(paymentGroupId),
       paymentMethod = Value(paymentMethod),
       amountPaid = Value(amountPaid),
       tipAmount = Value(tipAmount),
       status = Value(status),
       createdAt = Value(createdAt);
  static Insertable<Payment> custom({
    Expression<String>? id,
    Expression<String>? paymentGroupId,
    Expression<String>? playerId,
    Expression<String>? paymentMethod,
    Expression<int>? amountPaid,
    Expression<int>? tipAmount,
    Expression<String>? status,
    Expression<String>? createdAt,
    Expression<String>? sessionId,
    Expression<String>? saleId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (paymentGroupId != null) 'payment_group_id': paymentGroupId,
      if (playerId != null) 'player_id': playerId,
      if (paymentMethod != null) 'payment_method': paymentMethod,
      if (amountPaid != null) 'amount_paid': amountPaid,
      if (tipAmount != null) 'tip_amount': tipAmount,
      if (status != null) 'status': status,
      if (createdAt != null) 'created_at': createdAt,
      if (sessionId != null) 'session_id': sessionId,
      if (saleId != null) 'sale_id': saleId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PaymentsCompanion copyWith({
    Value<String>? id,
    Value<String>? paymentGroupId,
    Value<String?>? playerId,
    Value<String>? paymentMethod,
    Value<int>? amountPaid,
    Value<int>? tipAmount,
    Value<String>? status,
    Value<String>? createdAt,
    Value<String?>? sessionId,
    Value<String?>? saleId,
    Value<int>? rowid,
  }) {
    return PaymentsCompanion(
      id: id ?? this.id,
      paymentGroupId: paymentGroupId ?? this.paymentGroupId,
      playerId: playerId ?? this.playerId,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      amountPaid: amountPaid ?? this.amountPaid,
      tipAmount: tipAmount ?? this.tipAmount,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      sessionId: sessionId ?? this.sessionId,
      saleId: saleId ?? this.saleId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (paymentGroupId.present) {
      map['payment_group_id'] = Variable<String>(paymentGroupId.value);
    }
    if (playerId.present) {
      map['player_id'] = Variable<String>(playerId.value);
    }
    if (paymentMethod.present) {
      map['payment_method'] = Variable<String>(paymentMethod.value);
    }
    if (amountPaid.present) {
      map['amount_paid'] = Variable<int>(amountPaid.value);
    }
    if (tipAmount.present) {
      map['tip_amount'] = Variable<int>(tipAmount.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (sessionId.present) {
      map['session_id'] = Variable<String>(sessionId.value);
    }
    if (saleId.present) {
      map['sale_id'] = Variable<String>(saleId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PaymentsCompanion(')
          ..write('id: $id, ')
          ..write('paymentGroupId: $paymentGroupId, ')
          ..write('playerId: $playerId, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('amountPaid: $amountPaid, ')
          ..write('tipAmount: $tipAmount, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('sessionId: $sessionId, ')
          ..write('saleId: $saleId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DebtsTable extends Debts with TableInfo<$DebtsTable, Debt> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DebtsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _playerIdMeta = const VerificationMeta(
    'playerId',
  );
  @override
  late final GeneratedColumn<String> playerId = GeneratedColumn<String>(
    'player_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES players (id)',
    ),
  );
  static const VerificationMeta _originalAmountMeta = const VerificationMeta(
    'originalAmount',
  );
  @override
  late final GeneratedColumn<int> originalAmount = GeneratedColumn<int>(
    'original_amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _remainingAmountMeta = const VerificationMeta(
    'remainingAmount',
  );
  @override
  late final GeneratedColumn<int> remainingAmount = GeneratedColumn<int>(
    'remaining_amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
    'created_at',
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
  static const VerificationMeta _originatingSessionIdMeta =
      const VerificationMeta('originatingSessionId');
  @override
  late final GeneratedColumn<String> originatingSessionId =
      GeneratedColumn<String>(
        'originating_session_id',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES sessions (id)',
        ),
      );
  static const VerificationMeta _originatingSaleIdMeta = const VerificationMeta(
    'originatingSaleId',
  );
  @override
  late final GeneratedColumn<String> originatingSaleId =
      GeneratedColumn<String>(
        'originating_sale_id',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES product_sales (id)',
        ),
      );
  static const VerificationMeta _originatingSubscriptionIdMeta =
      const VerificationMeta('originatingSubscriptionId');
  @override
  late final GeneratedColumn<String> originatingSubscriptionId =
      GeneratedColumn<String>(
        'originating_subscription_id',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES subscriptions (id)',
        ),
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    playerId,
    originalAmount,
    remainingAmount,
    createdAt,
    status,
    originatingSessionId,
    originatingSaleId,
    originatingSubscriptionId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'debts';
  @override
  VerificationContext validateIntegrity(
    Insertable<Debt> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('player_id')) {
      context.handle(
        _playerIdMeta,
        playerId.isAcceptableOrUnknown(data['player_id']!, _playerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_playerIdMeta);
    }
    if (data.containsKey('original_amount')) {
      context.handle(
        _originalAmountMeta,
        originalAmount.isAcceptableOrUnknown(
          data['original_amount']!,
          _originalAmountMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_originalAmountMeta);
    }
    if (data.containsKey('remaining_amount')) {
      context.handle(
        _remainingAmountMeta,
        remainingAmount.isAcceptableOrUnknown(
          data['remaining_amount']!,
          _remainingAmountMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_remainingAmountMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('originating_session_id')) {
      context.handle(
        _originatingSessionIdMeta,
        originatingSessionId.isAcceptableOrUnknown(
          data['originating_session_id']!,
          _originatingSessionIdMeta,
        ),
      );
    }
    if (data.containsKey('originating_sale_id')) {
      context.handle(
        _originatingSaleIdMeta,
        originatingSaleId.isAcceptableOrUnknown(
          data['originating_sale_id']!,
          _originatingSaleIdMeta,
        ),
      );
    }
    if (data.containsKey('originating_subscription_id')) {
      context.handle(
        _originatingSubscriptionIdMeta,
        originatingSubscriptionId.isAcceptableOrUnknown(
          data['originating_subscription_id']!,
          _originatingSubscriptionIdMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Debt map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Debt(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      playerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}player_id'],
      )!,
      originalAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}original_amount'],
      )!,
      remainingAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}remaining_amount'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_at'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      originatingSessionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}originating_session_id'],
      ),
      originatingSaleId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}originating_sale_id'],
      ),
      originatingSubscriptionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}originating_subscription_id'],
      ),
    );
  }

  @override
  $DebtsTable createAlias(String alias) {
    return $DebtsTable(attachedDatabase, alias);
  }
}

class Debt extends DataClass implements Insertable<Debt> {
  final String id;
  final String playerId;
  final int originalAmount;
  final int remainingAmount;
  final String createdAt;
  final String status;
  final String? originatingSessionId;
  final String? originatingSaleId;
  final String? originatingSubscriptionId;
  const Debt({
    required this.id,
    required this.playerId,
    required this.originalAmount,
    required this.remainingAmount,
    required this.createdAt,
    required this.status,
    this.originatingSessionId,
    this.originatingSaleId,
    this.originatingSubscriptionId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['player_id'] = Variable<String>(playerId);
    map['original_amount'] = Variable<int>(originalAmount);
    map['remaining_amount'] = Variable<int>(remainingAmount);
    map['created_at'] = Variable<String>(createdAt);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || originatingSessionId != null) {
      map['originating_session_id'] = Variable<String>(originatingSessionId);
    }
    if (!nullToAbsent || originatingSaleId != null) {
      map['originating_sale_id'] = Variable<String>(originatingSaleId);
    }
    if (!nullToAbsent || originatingSubscriptionId != null) {
      map['originating_subscription_id'] = Variable<String>(
        originatingSubscriptionId,
      );
    }
    return map;
  }

  DebtsCompanion toCompanion(bool nullToAbsent) {
    return DebtsCompanion(
      id: Value(id),
      playerId: Value(playerId),
      originalAmount: Value(originalAmount),
      remainingAmount: Value(remainingAmount),
      createdAt: Value(createdAt),
      status: Value(status),
      originatingSessionId: originatingSessionId == null && nullToAbsent
          ? const Value.absent()
          : Value(originatingSessionId),
      originatingSaleId: originatingSaleId == null && nullToAbsent
          ? const Value.absent()
          : Value(originatingSaleId),
      originatingSubscriptionId:
          originatingSubscriptionId == null && nullToAbsent
          ? const Value.absent()
          : Value(originatingSubscriptionId),
    );
  }

  factory Debt.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Debt(
      id: serializer.fromJson<String>(json['id']),
      playerId: serializer.fromJson<String>(json['playerId']),
      originalAmount: serializer.fromJson<int>(json['originalAmount']),
      remainingAmount: serializer.fromJson<int>(json['remainingAmount']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
      status: serializer.fromJson<String>(json['status']),
      originatingSessionId: serializer.fromJson<String?>(
        json['originatingSessionId'],
      ),
      originatingSaleId: serializer.fromJson<String?>(
        json['originatingSaleId'],
      ),
      originatingSubscriptionId: serializer.fromJson<String?>(
        json['originatingSubscriptionId'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'playerId': serializer.toJson<String>(playerId),
      'originalAmount': serializer.toJson<int>(originalAmount),
      'remainingAmount': serializer.toJson<int>(remainingAmount),
      'createdAt': serializer.toJson<String>(createdAt),
      'status': serializer.toJson<String>(status),
      'originatingSessionId': serializer.toJson<String?>(originatingSessionId),
      'originatingSaleId': serializer.toJson<String?>(originatingSaleId),
      'originatingSubscriptionId': serializer.toJson<String?>(
        originatingSubscriptionId,
      ),
    };
  }

  Debt copyWith({
    String? id,
    String? playerId,
    int? originalAmount,
    int? remainingAmount,
    String? createdAt,
    String? status,
    Value<String?> originatingSessionId = const Value.absent(),
    Value<String?> originatingSaleId = const Value.absent(),
    Value<String?> originatingSubscriptionId = const Value.absent(),
  }) => Debt(
    id: id ?? this.id,
    playerId: playerId ?? this.playerId,
    originalAmount: originalAmount ?? this.originalAmount,
    remainingAmount: remainingAmount ?? this.remainingAmount,
    createdAt: createdAt ?? this.createdAt,
    status: status ?? this.status,
    originatingSessionId: originatingSessionId.present
        ? originatingSessionId.value
        : this.originatingSessionId,
    originatingSaleId: originatingSaleId.present
        ? originatingSaleId.value
        : this.originatingSaleId,
    originatingSubscriptionId: originatingSubscriptionId.present
        ? originatingSubscriptionId.value
        : this.originatingSubscriptionId,
  );
  Debt copyWithCompanion(DebtsCompanion data) {
    return Debt(
      id: data.id.present ? data.id.value : this.id,
      playerId: data.playerId.present ? data.playerId.value : this.playerId,
      originalAmount: data.originalAmount.present
          ? data.originalAmount.value
          : this.originalAmount,
      remainingAmount: data.remainingAmount.present
          ? data.remainingAmount.value
          : this.remainingAmount,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      status: data.status.present ? data.status.value : this.status,
      originatingSessionId: data.originatingSessionId.present
          ? data.originatingSessionId.value
          : this.originatingSessionId,
      originatingSaleId: data.originatingSaleId.present
          ? data.originatingSaleId.value
          : this.originatingSaleId,
      originatingSubscriptionId: data.originatingSubscriptionId.present
          ? data.originatingSubscriptionId.value
          : this.originatingSubscriptionId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Debt(')
          ..write('id: $id, ')
          ..write('playerId: $playerId, ')
          ..write('originalAmount: $originalAmount, ')
          ..write('remainingAmount: $remainingAmount, ')
          ..write('createdAt: $createdAt, ')
          ..write('status: $status, ')
          ..write('originatingSessionId: $originatingSessionId, ')
          ..write('originatingSaleId: $originatingSaleId, ')
          ..write('originatingSubscriptionId: $originatingSubscriptionId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    playerId,
    originalAmount,
    remainingAmount,
    createdAt,
    status,
    originatingSessionId,
    originatingSaleId,
    originatingSubscriptionId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Debt &&
          other.id == this.id &&
          other.playerId == this.playerId &&
          other.originalAmount == this.originalAmount &&
          other.remainingAmount == this.remainingAmount &&
          other.createdAt == this.createdAt &&
          other.status == this.status &&
          other.originatingSessionId == this.originatingSessionId &&
          other.originatingSaleId == this.originatingSaleId &&
          other.originatingSubscriptionId == this.originatingSubscriptionId);
}

class DebtsCompanion extends UpdateCompanion<Debt> {
  final Value<String> id;
  final Value<String> playerId;
  final Value<int> originalAmount;
  final Value<int> remainingAmount;
  final Value<String> createdAt;
  final Value<String> status;
  final Value<String?> originatingSessionId;
  final Value<String?> originatingSaleId;
  final Value<String?> originatingSubscriptionId;
  final Value<int> rowid;
  const DebtsCompanion({
    this.id = const Value.absent(),
    this.playerId = const Value.absent(),
    this.originalAmount = const Value.absent(),
    this.remainingAmount = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.status = const Value.absent(),
    this.originatingSessionId = const Value.absent(),
    this.originatingSaleId = const Value.absent(),
    this.originatingSubscriptionId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DebtsCompanion.insert({
    required String id,
    required String playerId,
    required int originalAmount,
    required int remainingAmount,
    required String createdAt,
    required String status,
    this.originatingSessionId = const Value.absent(),
    this.originatingSaleId = const Value.absent(),
    this.originatingSubscriptionId = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       playerId = Value(playerId),
       originalAmount = Value(originalAmount),
       remainingAmount = Value(remainingAmount),
       createdAt = Value(createdAt),
       status = Value(status);
  static Insertable<Debt> custom({
    Expression<String>? id,
    Expression<String>? playerId,
    Expression<int>? originalAmount,
    Expression<int>? remainingAmount,
    Expression<String>? createdAt,
    Expression<String>? status,
    Expression<String>? originatingSessionId,
    Expression<String>? originatingSaleId,
    Expression<String>? originatingSubscriptionId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (playerId != null) 'player_id': playerId,
      if (originalAmount != null) 'original_amount': originalAmount,
      if (remainingAmount != null) 'remaining_amount': remainingAmount,
      if (createdAt != null) 'created_at': createdAt,
      if (status != null) 'status': status,
      if (originatingSessionId != null)
        'originating_session_id': originatingSessionId,
      if (originatingSaleId != null) 'originating_sale_id': originatingSaleId,
      if (originatingSubscriptionId != null)
        'originating_subscription_id': originatingSubscriptionId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DebtsCompanion copyWith({
    Value<String>? id,
    Value<String>? playerId,
    Value<int>? originalAmount,
    Value<int>? remainingAmount,
    Value<String>? createdAt,
    Value<String>? status,
    Value<String?>? originatingSessionId,
    Value<String?>? originatingSaleId,
    Value<String?>? originatingSubscriptionId,
    Value<int>? rowid,
  }) {
    return DebtsCompanion(
      id: id ?? this.id,
      playerId: playerId ?? this.playerId,
      originalAmount: originalAmount ?? this.originalAmount,
      remainingAmount: remainingAmount ?? this.remainingAmount,
      createdAt: createdAt ?? this.createdAt,
      status: status ?? this.status,
      originatingSessionId: originatingSessionId ?? this.originatingSessionId,
      originatingSaleId: originatingSaleId ?? this.originatingSaleId,
      originatingSubscriptionId:
          originatingSubscriptionId ?? this.originatingSubscriptionId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (playerId.present) {
      map['player_id'] = Variable<String>(playerId.value);
    }
    if (originalAmount.present) {
      map['original_amount'] = Variable<int>(originalAmount.value);
    }
    if (remainingAmount.present) {
      map['remaining_amount'] = Variable<int>(remainingAmount.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (originatingSessionId.present) {
      map['originating_session_id'] = Variable<String>(
        originatingSessionId.value,
      );
    }
    if (originatingSaleId.present) {
      map['originating_sale_id'] = Variable<String>(originatingSaleId.value);
    }
    if (originatingSubscriptionId.present) {
      map['originating_subscription_id'] = Variable<String>(
        originatingSubscriptionId.value,
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DebtsCompanion(')
          ..write('id: $id, ')
          ..write('playerId: $playerId, ')
          ..write('originalAmount: $originalAmount, ')
          ..write('remainingAmount: $remainingAmount, ')
          ..write('createdAt: $createdAt, ')
          ..write('status: $status, ')
          ..write('originatingSessionId: $originatingSessionId, ')
          ..write('originatingSaleId: $originatingSaleId, ')
          ..write('originatingSubscriptionId: $originatingSubscriptionId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DebtPaymentsTable extends DebtPayments
    with TableInfo<$DebtPaymentsTable, DebtPayment> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DebtPaymentsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _debtIdMeta = const VerificationMeta('debtId');
  @override
  late final GeneratedColumn<String> debtId = GeneratedColumn<String>(
    'debt_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES debts (id)',
    ),
  );
  static const VerificationMeta _paymentIdMeta = const VerificationMeta(
    'paymentId',
  );
  @override
  late final GeneratedColumn<String> paymentId = GeneratedColumn<String>(
    'payment_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES payments (id)',
    ),
  );
  static const VerificationMeta _amountAppliedMeta = const VerificationMeta(
    'amountApplied',
  );
  @override
  late final GeneratedColumn<int> amountApplied = GeneratedColumn<int>(
    'amount_applied',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    debtId,
    paymentId,
    amountApplied,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'debt_payments';
  @override
  VerificationContext validateIntegrity(
    Insertable<DebtPayment> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('debt_id')) {
      context.handle(
        _debtIdMeta,
        debtId.isAcceptableOrUnknown(data['debt_id']!, _debtIdMeta),
      );
    } else if (isInserting) {
      context.missing(_debtIdMeta);
    }
    if (data.containsKey('payment_id')) {
      context.handle(
        _paymentIdMeta,
        paymentId.isAcceptableOrUnknown(data['payment_id']!, _paymentIdMeta),
      );
    } else if (isInserting) {
      context.missing(_paymentIdMeta);
    }
    if (data.containsKey('amount_applied')) {
      context.handle(
        _amountAppliedMeta,
        amountApplied.isAcceptableOrUnknown(
          data['amount_applied']!,
          _amountAppliedMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_amountAppliedMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DebtPayment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DebtPayment(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      debtId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}debt_id'],
      )!,
      paymentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payment_id'],
      )!,
      amountApplied: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount_applied'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $DebtPaymentsTable createAlias(String alias) {
    return $DebtPaymentsTable(attachedDatabase, alias);
  }
}

class DebtPayment extends DataClass implements Insertable<DebtPayment> {
  final int id;
  final String debtId;
  final String paymentId;
  final int amountApplied;
  final String createdAt;
  const DebtPayment({
    required this.id,
    required this.debtId,
    required this.paymentId,
    required this.amountApplied,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['debt_id'] = Variable<String>(debtId);
    map['payment_id'] = Variable<String>(paymentId);
    map['amount_applied'] = Variable<int>(amountApplied);
    map['created_at'] = Variable<String>(createdAt);
    return map;
  }

  DebtPaymentsCompanion toCompanion(bool nullToAbsent) {
    return DebtPaymentsCompanion(
      id: Value(id),
      debtId: Value(debtId),
      paymentId: Value(paymentId),
      amountApplied: Value(amountApplied),
      createdAt: Value(createdAt),
    );
  }

  factory DebtPayment.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DebtPayment(
      id: serializer.fromJson<int>(json['id']),
      debtId: serializer.fromJson<String>(json['debtId']),
      paymentId: serializer.fromJson<String>(json['paymentId']),
      amountApplied: serializer.fromJson<int>(json['amountApplied']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'debtId': serializer.toJson<String>(debtId),
      'paymentId': serializer.toJson<String>(paymentId),
      'amountApplied': serializer.toJson<int>(amountApplied),
      'createdAt': serializer.toJson<String>(createdAt),
    };
  }

  DebtPayment copyWith({
    int? id,
    String? debtId,
    String? paymentId,
    int? amountApplied,
    String? createdAt,
  }) => DebtPayment(
    id: id ?? this.id,
    debtId: debtId ?? this.debtId,
    paymentId: paymentId ?? this.paymentId,
    amountApplied: amountApplied ?? this.amountApplied,
    createdAt: createdAt ?? this.createdAt,
  );
  DebtPayment copyWithCompanion(DebtPaymentsCompanion data) {
    return DebtPayment(
      id: data.id.present ? data.id.value : this.id,
      debtId: data.debtId.present ? data.debtId.value : this.debtId,
      paymentId: data.paymentId.present ? data.paymentId.value : this.paymentId,
      amountApplied: data.amountApplied.present
          ? data.amountApplied.value
          : this.amountApplied,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DebtPayment(')
          ..write('id: $id, ')
          ..write('debtId: $debtId, ')
          ..write('paymentId: $paymentId, ')
          ..write('amountApplied: $amountApplied, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, debtId, paymentId, amountApplied, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DebtPayment &&
          other.id == this.id &&
          other.debtId == this.debtId &&
          other.paymentId == this.paymentId &&
          other.amountApplied == this.amountApplied &&
          other.createdAt == this.createdAt);
}

class DebtPaymentsCompanion extends UpdateCompanion<DebtPayment> {
  final Value<int> id;
  final Value<String> debtId;
  final Value<String> paymentId;
  final Value<int> amountApplied;
  final Value<String> createdAt;
  const DebtPaymentsCompanion({
    this.id = const Value.absent(),
    this.debtId = const Value.absent(),
    this.paymentId = const Value.absent(),
    this.amountApplied = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  DebtPaymentsCompanion.insert({
    this.id = const Value.absent(),
    required String debtId,
    required String paymentId,
    required int amountApplied,
    required String createdAt,
  }) : debtId = Value(debtId),
       paymentId = Value(paymentId),
       amountApplied = Value(amountApplied),
       createdAt = Value(createdAt);
  static Insertable<DebtPayment> custom({
    Expression<int>? id,
    Expression<String>? debtId,
    Expression<String>? paymentId,
    Expression<int>? amountApplied,
    Expression<String>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (debtId != null) 'debt_id': debtId,
      if (paymentId != null) 'payment_id': paymentId,
      if (amountApplied != null) 'amount_applied': amountApplied,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  DebtPaymentsCompanion copyWith({
    Value<int>? id,
    Value<String>? debtId,
    Value<String>? paymentId,
    Value<int>? amountApplied,
    Value<String>? createdAt,
  }) {
    return DebtPaymentsCompanion(
      id: id ?? this.id,
      debtId: debtId ?? this.debtId,
      paymentId: paymentId ?? this.paymentId,
      amountApplied: amountApplied ?? this.amountApplied,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (debtId.present) {
      map['debt_id'] = Variable<String>(debtId.value);
    }
    if (paymentId.present) {
      map['payment_id'] = Variable<String>(paymentId.value);
    }
    if (amountApplied.present) {
      map['amount_applied'] = Variable<int>(amountApplied.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DebtPaymentsCompanion(')
          ..write('id: $id, ')
          ..write('debtId: $debtId, ')
          ..write('paymentId: $paymentId, ')
          ..write('amountApplied: $amountApplied, ')
          ..write('createdAt: $createdAt')
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
  late final GeneratedColumn<String> productId = GeneratedColumn<String>(
    'product_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES products (id)',
    ),
  );
  static const VerificationMeta _movementTypeMeta = const VerificationMeta(
    'movementType',
  );
  @override
  late final GeneratedColumn<String> movementType = GeneratedColumn<String>(
    'movement_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _quantityChangeMeta = const VerificationMeta(
    'quantityChange',
  );
  @override
  late final GeneratedColumn<int> quantityChange = GeneratedColumn<int>(
    'quantity_change',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _stockBeforeMeta = const VerificationMeta(
    'stockBefore',
  );
  @override
  late final GeneratedColumn<int> stockBefore = GeneratedColumn<int>(
    'stock_before',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _stockAfterMeta = const VerificationMeta(
    'stockAfter',
  );
  @override
  late final GeneratedColumn<int> stockAfter = GeneratedColumn<int>(
    'stock_after',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _associatedSaleIdMeta = const VerificationMeta(
    'associatedSaleId',
  );
  @override
  late final GeneratedColumn<String> associatedSaleId = GeneratedColumn<String>(
    'associated_sale_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES product_sales (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    productId,
    movementType,
    quantityChange,
    stockBefore,
    stockAfter,
    notes,
    createdAt,
    associatedSaleId,
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
    if (data.containsKey('movement_type')) {
      context.handle(
        _movementTypeMeta,
        movementType.isAcceptableOrUnknown(
          data['movement_type']!,
          _movementTypeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_movementTypeMeta);
    }
    if (data.containsKey('quantity_change')) {
      context.handle(
        _quantityChangeMeta,
        quantityChange.isAcceptableOrUnknown(
          data['quantity_change']!,
          _quantityChangeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_quantityChangeMeta);
    }
    if (data.containsKey('stock_before')) {
      context.handle(
        _stockBeforeMeta,
        stockBefore.isAcceptableOrUnknown(
          data['stock_before']!,
          _stockBeforeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_stockBeforeMeta);
    }
    if (data.containsKey('stock_after')) {
      context.handle(
        _stockAfterMeta,
        stockAfter.isAcceptableOrUnknown(data['stock_after']!, _stockAfterMeta),
      );
    } else if (isInserting) {
      context.missing(_stockAfterMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('associated_sale_id')) {
      context.handle(
        _associatedSaleIdMeta,
        associatedSaleId.isAcceptableOrUnknown(
          data['associated_sale_id']!,
          _associatedSaleIdMeta,
        ),
      );
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
        DriftSqlType.string,
        data['${effectivePrefix}product_id'],
      )!,
      movementType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}movement_type'],
      )!,
      quantityChange: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}quantity_change'],
      )!,
      stockBefore: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}stock_before'],
      )!,
      stockAfter: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}stock_after'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_at'],
      )!,
      associatedSaleId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}associated_sale_id'],
      ),
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
  final String productId;
  final String movementType;
  final int quantityChange;
  final int stockBefore;
  final int stockAfter;
  final String? notes;
  final String createdAt;
  final String? associatedSaleId;
  const InventoryMovement({
    required this.id,
    required this.productId,
    required this.movementType,
    required this.quantityChange,
    required this.stockBefore,
    required this.stockAfter,
    this.notes,
    required this.createdAt,
    this.associatedSaleId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['product_id'] = Variable<String>(productId);
    map['movement_type'] = Variable<String>(movementType);
    map['quantity_change'] = Variable<int>(quantityChange);
    map['stock_before'] = Variable<int>(stockBefore);
    map['stock_after'] = Variable<int>(stockAfter);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<String>(createdAt);
    if (!nullToAbsent || associatedSaleId != null) {
      map['associated_sale_id'] = Variable<String>(associatedSaleId);
    }
    return map;
  }

  InventoryMovementsCompanion toCompanion(bool nullToAbsent) {
    return InventoryMovementsCompanion(
      id: Value(id),
      productId: Value(productId),
      movementType: Value(movementType),
      quantityChange: Value(quantityChange),
      stockBefore: Value(stockBefore),
      stockAfter: Value(stockAfter),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      createdAt: Value(createdAt),
      associatedSaleId: associatedSaleId == null && nullToAbsent
          ? const Value.absent()
          : Value(associatedSaleId),
    );
  }

  factory InventoryMovement.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InventoryMovement(
      id: serializer.fromJson<int>(json['id']),
      productId: serializer.fromJson<String>(json['productId']),
      movementType: serializer.fromJson<String>(json['movementType']),
      quantityChange: serializer.fromJson<int>(json['quantityChange']),
      stockBefore: serializer.fromJson<int>(json['stockBefore']),
      stockAfter: serializer.fromJson<int>(json['stockAfter']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
      associatedSaleId: serializer.fromJson<String?>(json['associatedSaleId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'productId': serializer.toJson<String>(productId),
      'movementType': serializer.toJson<String>(movementType),
      'quantityChange': serializer.toJson<int>(quantityChange),
      'stockBefore': serializer.toJson<int>(stockBefore),
      'stockAfter': serializer.toJson<int>(stockAfter),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<String>(createdAt),
      'associatedSaleId': serializer.toJson<String?>(associatedSaleId),
    };
  }

  InventoryMovement copyWith({
    int? id,
    String? productId,
    String? movementType,
    int? quantityChange,
    int? stockBefore,
    int? stockAfter,
    Value<String?> notes = const Value.absent(),
    String? createdAt,
    Value<String?> associatedSaleId = const Value.absent(),
  }) => InventoryMovement(
    id: id ?? this.id,
    productId: productId ?? this.productId,
    movementType: movementType ?? this.movementType,
    quantityChange: quantityChange ?? this.quantityChange,
    stockBefore: stockBefore ?? this.stockBefore,
    stockAfter: stockAfter ?? this.stockAfter,
    notes: notes.present ? notes.value : this.notes,
    createdAt: createdAt ?? this.createdAt,
    associatedSaleId: associatedSaleId.present
        ? associatedSaleId.value
        : this.associatedSaleId,
  );
  InventoryMovement copyWithCompanion(InventoryMovementsCompanion data) {
    return InventoryMovement(
      id: data.id.present ? data.id.value : this.id,
      productId: data.productId.present ? data.productId.value : this.productId,
      movementType: data.movementType.present
          ? data.movementType.value
          : this.movementType,
      quantityChange: data.quantityChange.present
          ? data.quantityChange.value
          : this.quantityChange,
      stockBefore: data.stockBefore.present
          ? data.stockBefore.value
          : this.stockBefore,
      stockAfter: data.stockAfter.present
          ? data.stockAfter.value
          : this.stockAfter,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      associatedSaleId: data.associatedSaleId.present
          ? data.associatedSaleId.value
          : this.associatedSaleId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('InventoryMovement(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('movementType: $movementType, ')
          ..write('quantityChange: $quantityChange, ')
          ..write('stockBefore: $stockBefore, ')
          ..write('stockAfter: $stockAfter, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('associatedSaleId: $associatedSaleId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    productId,
    movementType,
    quantityChange,
    stockBefore,
    stockAfter,
    notes,
    createdAt,
    associatedSaleId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InventoryMovement &&
          other.id == this.id &&
          other.productId == this.productId &&
          other.movementType == this.movementType &&
          other.quantityChange == this.quantityChange &&
          other.stockBefore == this.stockBefore &&
          other.stockAfter == this.stockAfter &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt &&
          other.associatedSaleId == this.associatedSaleId);
}

class InventoryMovementsCompanion extends UpdateCompanion<InventoryMovement> {
  final Value<int> id;
  final Value<String> productId;
  final Value<String> movementType;
  final Value<int> quantityChange;
  final Value<int> stockBefore;
  final Value<int> stockAfter;
  final Value<String?> notes;
  final Value<String> createdAt;
  final Value<String?> associatedSaleId;
  const InventoryMovementsCompanion({
    this.id = const Value.absent(),
    this.productId = const Value.absent(),
    this.movementType = const Value.absent(),
    this.quantityChange = const Value.absent(),
    this.stockBefore = const Value.absent(),
    this.stockAfter = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.associatedSaleId = const Value.absent(),
  });
  InventoryMovementsCompanion.insert({
    this.id = const Value.absent(),
    required String productId,
    required String movementType,
    required int quantityChange,
    required int stockBefore,
    required int stockAfter,
    this.notes = const Value.absent(),
    required String createdAt,
    this.associatedSaleId = const Value.absent(),
  }) : productId = Value(productId),
       movementType = Value(movementType),
       quantityChange = Value(quantityChange),
       stockBefore = Value(stockBefore),
       stockAfter = Value(stockAfter),
       createdAt = Value(createdAt);
  static Insertable<InventoryMovement> custom({
    Expression<int>? id,
    Expression<String>? productId,
    Expression<String>? movementType,
    Expression<int>? quantityChange,
    Expression<int>? stockBefore,
    Expression<int>? stockAfter,
    Expression<String>? notes,
    Expression<String>? createdAt,
    Expression<String>? associatedSaleId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (productId != null) 'product_id': productId,
      if (movementType != null) 'movement_type': movementType,
      if (quantityChange != null) 'quantity_change': quantityChange,
      if (stockBefore != null) 'stock_before': stockBefore,
      if (stockAfter != null) 'stock_after': stockAfter,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (associatedSaleId != null) 'associated_sale_id': associatedSaleId,
    });
  }

  InventoryMovementsCompanion copyWith({
    Value<int>? id,
    Value<String>? productId,
    Value<String>? movementType,
    Value<int>? quantityChange,
    Value<int>? stockBefore,
    Value<int>? stockAfter,
    Value<String?>? notes,
    Value<String>? createdAt,
    Value<String?>? associatedSaleId,
  }) {
    return InventoryMovementsCompanion(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      movementType: movementType ?? this.movementType,
      quantityChange: quantityChange ?? this.quantityChange,
      stockBefore: stockBefore ?? this.stockBefore,
      stockAfter: stockAfter ?? this.stockAfter,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      associatedSaleId: associatedSaleId ?? this.associatedSaleId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<String>(productId.value);
    }
    if (movementType.present) {
      map['movement_type'] = Variable<String>(movementType.value);
    }
    if (quantityChange.present) {
      map['quantity_change'] = Variable<int>(quantityChange.value);
    }
    if (stockBefore.present) {
      map['stock_before'] = Variable<int>(stockBefore.value);
    }
    if (stockAfter.present) {
      map['stock_after'] = Variable<int>(stockAfter.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (associatedSaleId.present) {
      map['associated_sale_id'] = Variable<String>(associatedSaleId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InventoryMovementsCompanion(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('movementType: $movementType, ')
          ..write('quantityChange: $quantityChange, ')
          ..write('stockBefore: $stockBefore, ')
          ..write('stockAfter: $stockAfter, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('associatedSaleId: $associatedSaleId')
          ..write(')'))
        .toString();
  }
}

class $EndDayClosesTable extends EndDayCloses
    with TableInfo<$EndDayClosesTable, EndDayClose> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EndDayClosesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _closedAtMeta = const VerificationMeta(
    'closedAt',
  );
  @override
  late final GeneratedColumn<String> closedAt = GeneratedColumn<String>(
    'closed_at',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _businessDateMeta = const VerificationMeta(
    'businessDate',
  );
  @override
  late final GeneratedColumn<String> businessDate = GeneratedColumn<String>(
    'business_date',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _expectedCashMeta = const VerificationMeta(
    'expectedCash',
  );
  @override
  late final GeneratedColumn<int> expectedCash = GeneratedColumn<int>(
    'expected_cash',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _expectedCardMeta = const VerificationMeta(
    'expectedCard',
  );
  @override
  late final GeneratedColumn<int> expectedCard = GeneratedColumn<int>(
    'expected_card',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _countedCashMeta = const VerificationMeta(
    'countedCash',
  );
  @override
  late final GeneratedColumn<int> countedCash = GeneratedColumn<int>(
    'counted_cash',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _countedCardMeta = const VerificationMeta(
    'countedCard',
  );
  @override
  late final GeneratedColumn<int> countedCard = GeneratedColumn<int>(
    'counted_card',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cashMismatchMeta = const VerificationMeta(
    'cashMismatch',
  );
  @override
  late final GeneratedColumn<int> cashMismatch = GeneratedColumn<int>(
    'cash_mismatch',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cardMismatchMeta = const VerificationMeta(
    'cardMismatch',
  );
  @override
  late final GeneratedColumn<int> cardMismatch = GeneratedColumn<int>(
    'card_mismatch',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _totalDebtIssuedMeta = const VerificationMeta(
    'totalDebtIssued',
  );
  @override
  late final GeneratedColumn<int> totalDebtIssued = GeneratedColumn<int>(
    'total_debt_issued',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _totalDebtCollectedMeta =
      const VerificationMeta('totalDebtCollected');
  @override
  late final GeneratedColumn<int> totalDebtCollected = GeneratedColumn<int>(
    'total_debt_collected',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _totalTipsMeta = const VerificationMeta(
    'totalTips',
  );
  @override
  late final GeneratedColumn<int> totalTips = GeneratedColumn<int>(
    'total_tips',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isMissedCloseMeta = const VerificationMeta(
    'isMissedClose',
  );
  @override
  late final GeneratedColumn<bool> isMissedClose = GeneratedColumn<bool>(
    'is_missed_close',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_missed_close" IN (0, 1))',
    ),
  );
  static const VerificationMeta _backupStatusMeta = const VerificationMeta(
    'backupStatus',
  );
  @override
  late final GeneratedColumn<String> backupStatus = GeneratedColumn<String>(
    'backup_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    closedAt,
    businessDate,
    expectedCash,
    expectedCard,
    countedCash,
    countedCard,
    cashMismatch,
    cardMismatch,
    totalDebtIssued,
    totalDebtCollected,
    totalTips,
    isMissedClose,
    backupStatus,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'end_day_closes';
  @override
  VerificationContext validateIntegrity(
    Insertable<EndDayClose> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('closed_at')) {
      context.handle(
        _closedAtMeta,
        closedAt.isAcceptableOrUnknown(data['closed_at']!, _closedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_closedAtMeta);
    }
    if (data.containsKey('business_date')) {
      context.handle(
        _businessDateMeta,
        businessDate.isAcceptableOrUnknown(
          data['business_date']!,
          _businessDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_businessDateMeta);
    }
    if (data.containsKey('expected_cash')) {
      context.handle(
        _expectedCashMeta,
        expectedCash.isAcceptableOrUnknown(
          data['expected_cash']!,
          _expectedCashMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_expectedCashMeta);
    }
    if (data.containsKey('expected_card')) {
      context.handle(
        _expectedCardMeta,
        expectedCard.isAcceptableOrUnknown(
          data['expected_card']!,
          _expectedCardMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_expectedCardMeta);
    }
    if (data.containsKey('counted_cash')) {
      context.handle(
        _countedCashMeta,
        countedCash.isAcceptableOrUnknown(
          data['counted_cash']!,
          _countedCashMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_countedCashMeta);
    }
    if (data.containsKey('counted_card')) {
      context.handle(
        _countedCardMeta,
        countedCard.isAcceptableOrUnknown(
          data['counted_card']!,
          _countedCardMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_countedCardMeta);
    }
    if (data.containsKey('cash_mismatch')) {
      context.handle(
        _cashMismatchMeta,
        cashMismatch.isAcceptableOrUnknown(
          data['cash_mismatch']!,
          _cashMismatchMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_cashMismatchMeta);
    }
    if (data.containsKey('card_mismatch')) {
      context.handle(
        _cardMismatchMeta,
        cardMismatch.isAcceptableOrUnknown(
          data['card_mismatch']!,
          _cardMismatchMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_cardMismatchMeta);
    }
    if (data.containsKey('total_debt_issued')) {
      context.handle(
        _totalDebtIssuedMeta,
        totalDebtIssued.isAcceptableOrUnknown(
          data['total_debt_issued']!,
          _totalDebtIssuedMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_totalDebtIssuedMeta);
    }
    if (data.containsKey('total_debt_collected')) {
      context.handle(
        _totalDebtCollectedMeta,
        totalDebtCollected.isAcceptableOrUnknown(
          data['total_debt_collected']!,
          _totalDebtCollectedMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_totalDebtCollectedMeta);
    }
    if (data.containsKey('total_tips')) {
      context.handle(
        _totalTipsMeta,
        totalTips.isAcceptableOrUnknown(data['total_tips']!, _totalTipsMeta),
      );
    } else if (isInserting) {
      context.missing(_totalTipsMeta);
    }
    if (data.containsKey('is_missed_close')) {
      context.handle(
        _isMissedCloseMeta,
        isMissedClose.isAcceptableOrUnknown(
          data['is_missed_close']!,
          _isMissedCloseMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_isMissedCloseMeta);
    }
    if (data.containsKey('backup_status')) {
      context.handle(
        _backupStatusMeta,
        backupStatus.isAcceptableOrUnknown(
          data['backup_status']!,
          _backupStatusMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_backupStatusMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  EndDayClose map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EndDayClose(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      closedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}closed_at'],
      )!,
      businessDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}business_date'],
      )!,
      expectedCash: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}expected_cash'],
      )!,
      expectedCard: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}expected_card'],
      )!,
      countedCash: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}counted_cash'],
      )!,
      countedCard: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}counted_card'],
      )!,
      cashMismatch: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}cash_mismatch'],
      )!,
      cardMismatch: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}card_mismatch'],
      )!,
      totalDebtIssued: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_debt_issued'],
      )!,
      totalDebtCollected: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_debt_collected'],
      )!,
      totalTips: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_tips'],
      )!,
      isMissedClose: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_missed_close'],
      )!,
      backupStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}backup_status'],
      )!,
    );
  }

  @override
  $EndDayClosesTable createAlias(String alias) {
    return $EndDayClosesTable(attachedDatabase, alias);
  }
}

class EndDayClose extends DataClass implements Insertable<EndDayClose> {
  final String id;
  final String closedAt;
  final String businessDate;
  final int expectedCash;
  final int expectedCard;
  final int countedCash;
  final int countedCard;
  final int cashMismatch;
  final int cardMismatch;
  final int totalDebtIssued;
  final int totalDebtCollected;
  final int totalTips;
  final bool isMissedClose;
  final String backupStatus;
  const EndDayClose({
    required this.id,
    required this.closedAt,
    required this.businessDate,
    required this.expectedCash,
    required this.expectedCard,
    required this.countedCash,
    required this.countedCard,
    required this.cashMismatch,
    required this.cardMismatch,
    required this.totalDebtIssued,
    required this.totalDebtCollected,
    required this.totalTips,
    required this.isMissedClose,
    required this.backupStatus,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['closed_at'] = Variable<String>(closedAt);
    map['business_date'] = Variable<String>(businessDate);
    map['expected_cash'] = Variable<int>(expectedCash);
    map['expected_card'] = Variable<int>(expectedCard);
    map['counted_cash'] = Variable<int>(countedCash);
    map['counted_card'] = Variable<int>(countedCard);
    map['cash_mismatch'] = Variable<int>(cashMismatch);
    map['card_mismatch'] = Variable<int>(cardMismatch);
    map['total_debt_issued'] = Variable<int>(totalDebtIssued);
    map['total_debt_collected'] = Variable<int>(totalDebtCollected);
    map['total_tips'] = Variable<int>(totalTips);
    map['is_missed_close'] = Variable<bool>(isMissedClose);
    map['backup_status'] = Variable<String>(backupStatus);
    return map;
  }

  EndDayClosesCompanion toCompanion(bool nullToAbsent) {
    return EndDayClosesCompanion(
      id: Value(id),
      closedAt: Value(closedAt),
      businessDate: Value(businessDate),
      expectedCash: Value(expectedCash),
      expectedCard: Value(expectedCard),
      countedCash: Value(countedCash),
      countedCard: Value(countedCard),
      cashMismatch: Value(cashMismatch),
      cardMismatch: Value(cardMismatch),
      totalDebtIssued: Value(totalDebtIssued),
      totalDebtCollected: Value(totalDebtCollected),
      totalTips: Value(totalTips),
      isMissedClose: Value(isMissedClose),
      backupStatus: Value(backupStatus),
    );
  }

  factory EndDayClose.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EndDayClose(
      id: serializer.fromJson<String>(json['id']),
      closedAt: serializer.fromJson<String>(json['closedAt']),
      businessDate: serializer.fromJson<String>(json['businessDate']),
      expectedCash: serializer.fromJson<int>(json['expectedCash']),
      expectedCard: serializer.fromJson<int>(json['expectedCard']),
      countedCash: serializer.fromJson<int>(json['countedCash']),
      countedCard: serializer.fromJson<int>(json['countedCard']),
      cashMismatch: serializer.fromJson<int>(json['cashMismatch']),
      cardMismatch: serializer.fromJson<int>(json['cardMismatch']),
      totalDebtIssued: serializer.fromJson<int>(json['totalDebtIssued']),
      totalDebtCollected: serializer.fromJson<int>(json['totalDebtCollected']),
      totalTips: serializer.fromJson<int>(json['totalTips']),
      isMissedClose: serializer.fromJson<bool>(json['isMissedClose']),
      backupStatus: serializer.fromJson<String>(json['backupStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'closedAt': serializer.toJson<String>(closedAt),
      'businessDate': serializer.toJson<String>(businessDate),
      'expectedCash': serializer.toJson<int>(expectedCash),
      'expectedCard': serializer.toJson<int>(expectedCard),
      'countedCash': serializer.toJson<int>(countedCash),
      'countedCard': serializer.toJson<int>(countedCard),
      'cashMismatch': serializer.toJson<int>(cashMismatch),
      'cardMismatch': serializer.toJson<int>(cardMismatch),
      'totalDebtIssued': serializer.toJson<int>(totalDebtIssued),
      'totalDebtCollected': serializer.toJson<int>(totalDebtCollected),
      'totalTips': serializer.toJson<int>(totalTips),
      'isMissedClose': serializer.toJson<bool>(isMissedClose),
      'backupStatus': serializer.toJson<String>(backupStatus),
    };
  }

  EndDayClose copyWith({
    String? id,
    String? closedAt,
    String? businessDate,
    int? expectedCash,
    int? expectedCard,
    int? countedCash,
    int? countedCard,
    int? cashMismatch,
    int? cardMismatch,
    int? totalDebtIssued,
    int? totalDebtCollected,
    int? totalTips,
    bool? isMissedClose,
    String? backupStatus,
  }) => EndDayClose(
    id: id ?? this.id,
    closedAt: closedAt ?? this.closedAt,
    businessDate: businessDate ?? this.businessDate,
    expectedCash: expectedCash ?? this.expectedCash,
    expectedCard: expectedCard ?? this.expectedCard,
    countedCash: countedCash ?? this.countedCash,
    countedCard: countedCard ?? this.countedCard,
    cashMismatch: cashMismatch ?? this.cashMismatch,
    cardMismatch: cardMismatch ?? this.cardMismatch,
    totalDebtIssued: totalDebtIssued ?? this.totalDebtIssued,
    totalDebtCollected: totalDebtCollected ?? this.totalDebtCollected,
    totalTips: totalTips ?? this.totalTips,
    isMissedClose: isMissedClose ?? this.isMissedClose,
    backupStatus: backupStatus ?? this.backupStatus,
  );
  EndDayClose copyWithCompanion(EndDayClosesCompanion data) {
    return EndDayClose(
      id: data.id.present ? data.id.value : this.id,
      closedAt: data.closedAt.present ? data.closedAt.value : this.closedAt,
      businessDate: data.businessDate.present
          ? data.businessDate.value
          : this.businessDate,
      expectedCash: data.expectedCash.present
          ? data.expectedCash.value
          : this.expectedCash,
      expectedCard: data.expectedCard.present
          ? data.expectedCard.value
          : this.expectedCard,
      countedCash: data.countedCash.present
          ? data.countedCash.value
          : this.countedCash,
      countedCard: data.countedCard.present
          ? data.countedCard.value
          : this.countedCard,
      cashMismatch: data.cashMismatch.present
          ? data.cashMismatch.value
          : this.cashMismatch,
      cardMismatch: data.cardMismatch.present
          ? data.cardMismatch.value
          : this.cardMismatch,
      totalDebtIssued: data.totalDebtIssued.present
          ? data.totalDebtIssued.value
          : this.totalDebtIssued,
      totalDebtCollected: data.totalDebtCollected.present
          ? data.totalDebtCollected.value
          : this.totalDebtCollected,
      totalTips: data.totalTips.present ? data.totalTips.value : this.totalTips,
      isMissedClose: data.isMissedClose.present
          ? data.isMissedClose.value
          : this.isMissedClose,
      backupStatus: data.backupStatus.present
          ? data.backupStatus.value
          : this.backupStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EndDayClose(')
          ..write('id: $id, ')
          ..write('closedAt: $closedAt, ')
          ..write('businessDate: $businessDate, ')
          ..write('expectedCash: $expectedCash, ')
          ..write('expectedCard: $expectedCard, ')
          ..write('countedCash: $countedCash, ')
          ..write('countedCard: $countedCard, ')
          ..write('cashMismatch: $cashMismatch, ')
          ..write('cardMismatch: $cardMismatch, ')
          ..write('totalDebtIssued: $totalDebtIssued, ')
          ..write('totalDebtCollected: $totalDebtCollected, ')
          ..write('totalTips: $totalTips, ')
          ..write('isMissedClose: $isMissedClose, ')
          ..write('backupStatus: $backupStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    closedAt,
    businessDate,
    expectedCash,
    expectedCard,
    countedCash,
    countedCard,
    cashMismatch,
    cardMismatch,
    totalDebtIssued,
    totalDebtCollected,
    totalTips,
    isMissedClose,
    backupStatus,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EndDayClose &&
          other.id == this.id &&
          other.closedAt == this.closedAt &&
          other.businessDate == this.businessDate &&
          other.expectedCash == this.expectedCash &&
          other.expectedCard == this.expectedCard &&
          other.countedCash == this.countedCash &&
          other.countedCard == this.countedCard &&
          other.cashMismatch == this.cashMismatch &&
          other.cardMismatch == this.cardMismatch &&
          other.totalDebtIssued == this.totalDebtIssued &&
          other.totalDebtCollected == this.totalDebtCollected &&
          other.totalTips == this.totalTips &&
          other.isMissedClose == this.isMissedClose &&
          other.backupStatus == this.backupStatus);
}

class EndDayClosesCompanion extends UpdateCompanion<EndDayClose> {
  final Value<String> id;
  final Value<String> closedAt;
  final Value<String> businessDate;
  final Value<int> expectedCash;
  final Value<int> expectedCard;
  final Value<int> countedCash;
  final Value<int> countedCard;
  final Value<int> cashMismatch;
  final Value<int> cardMismatch;
  final Value<int> totalDebtIssued;
  final Value<int> totalDebtCollected;
  final Value<int> totalTips;
  final Value<bool> isMissedClose;
  final Value<String> backupStatus;
  final Value<int> rowid;
  const EndDayClosesCompanion({
    this.id = const Value.absent(),
    this.closedAt = const Value.absent(),
    this.businessDate = const Value.absent(),
    this.expectedCash = const Value.absent(),
    this.expectedCard = const Value.absent(),
    this.countedCash = const Value.absent(),
    this.countedCard = const Value.absent(),
    this.cashMismatch = const Value.absent(),
    this.cardMismatch = const Value.absent(),
    this.totalDebtIssued = const Value.absent(),
    this.totalDebtCollected = const Value.absent(),
    this.totalTips = const Value.absent(),
    this.isMissedClose = const Value.absent(),
    this.backupStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  EndDayClosesCompanion.insert({
    required String id,
    required String closedAt,
    required String businessDate,
    required int expectedCash,
    required int expectedCard,
    required int countedCash,
    required int countedCard,
    required int cashMismatch,
    required int cardMismatch,
    required int totalDebtIssued,
    required int totalDebtCollected,
    required int totalTips,
    required bool isMissedClose,
    required String backupStatus,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       closedAt = Value(closedAt),
       businessDate = Value(businessDate),
       expectedCash = Value(expectedCash),
       expectedCard = Value(expectedCard),
       countedCash = Value(countedCash),
       countedCard = Value(countedCard),
       cashMismatch = Value(cashMismatch),
       cardMismatch = Value(cardMismatch),
       totalDebtIssued = Value(totalDebtIssued),
       totalDebtCollected = Value(totalDebtCollected),
       totalTips = Value(totalTips),
       isMissedClose = Value(isMissedClose),
       backupStatus = Value(backupStatus);
  static Insertable<EndDayClose> custom({
    Expression<String>? id,
    Expression<String>? closedAt,
    Expression<String>? businessDate,
    Expression<int>? expectedCash,
    Expression<int>? expectedCard,
    Expression<int>? countedCash,
    Expression<int>? countedCard,
    Expression<int>? cashMismatch,
    Expression<int>? cardMismatch,
    Expression<int>? totalDebtIssued,
    Expression<int>? totalDebtCollected,
    Expression<int>? totalTips,
    Expression<bool>? isMissedClose,
    Expression<String>? backupStatus,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (closedAt != null) 'closed_at': closedAt,
      if (businessDate != null) 'business_date': businessDate,
      if (expectedCash != null) 'expected_cash': expectedCash,
      if (expectedCard != null) 'expected_card': expectedCard,
      if (countedCash != null) 'counted_cash': countedCash,
      if (countedCard != null) 'counted_card': countedCard,
      if (cashMismatch != null) 'cash_mismatch': cashMismatch,
      if (cardMismatch != null) 'card_mismatch': cardMismatch,
      if (totalDebtIssued != null) 'total_debt_issued': totalDebtIssued,
      if (totalDebtCollected != null)
        'total_debt_collected': totalDebtCollected,
      if (totalTips != null) 'total_tips': totalTips,
      if (isMissedClose != null) 'is_missed_close': isMissedClose,
      if (backupStatus != null) 'backup_status': backupStatus,
      if (rowid != null) 'rowid': rowid,
    });
  }

  EndDayClosesCompanion copyWith({
    Value<String>? id,
    Value<String>? closedAt,
    Value<String>? businessDate,
    Value<int>? expectedCash,
    Value<int>? expectedCard,
    Value<int>? countedCash,
    Value<int>? countedCard,
    Value<int>? cashMismatch,
    Value<int>? cardMismatch,
    Value<int>? totalDebtIssued,
    Value<int>? totalDebtCollected,
    Value<int>? totalTips,
    Value<bool>? isMissedClose,
    Value<String>? backupStatus,
    Value<int>? rowid,
  }) {
    return EndDayClosesCompanion(
      id: id ?? this.id,
      closedAt: closedAt ?? this.closedAt,
      businessDate: businessDate ?? this.businessDate,
      expectedCash: expectedCash ?? this.expectedCash,
      expectedCard: expectedCard ?? this.expectedCard,
      countedCash: countedCash ?? this.countedCash,
      countedCard: countedCard ?? this.countedCard,
      cashMismatch: cashMismatch ?? this.cashMismatch,
      cardMismatch: cardMismatch ?? this.cardMismatch,
      totalDebtIssued: totalDebtIssued ?? this.totalDebtIssued,
      totalDebtCollected: totalDebtCollected ?? this.totalDebtCollected,
      totalTips: totalTips ?? this.totalTips,
      isMissedClose: isMissedClose ?? this.isMissedClose,
      backupStatus: backupStatus ?? this.backupStatus,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (closedAt.present) {
      map['closed_at'] = Variable<String>(closedAt.value);
    }
    if (businessDate.present) {
      map['business_date'] = Variable<String>(businessDate.value);
    }
    if (expectedCash.present) {
      map['expected_cash'] = Variable<int>(expectedCash.value);
    }
    if (expectedCard.present) {
      map['expected_card'] = Variable<int>(expectedCard.value);
    }
    if (countedCash.present) {
      map['counted_cash'] = Variable<int>(countedCash.value);
    }
    if (countedCard.present) {
      map['counted_card'] = Variable<int>(countedCard.value);
    }
    if (cashMismatch.present) {
      map['cash_mismatch'] = Variable<int>(cashMismatch.value);
    }
    if (cardMismatch.present) {
      map['card_mismatch'] = Variable<int>(cardMismatch.value);
    }
    if (totalDebtIssued.present) {
      map['total_debt_issued'] = Variable<int>(totalDebtIssued.value);
    }
    if (totalDebtCollected.present) {
      map['total_debt_collected'] = Variable<int>(totalDebtCollected.value);
    }
    if (totalTips.present) {
      map['total_tips'] = Variable<int>(totalTips.value);
    }
    if (isMissedClose.present) {
      map['is_missed_close'] = Variable<bool>(isMissedClose.value);
    }
    if (backupStatus.present) {
      map['backup_status'] = Variable<String>(backupStatus.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EndDayClosesCompanion(')
          ..write('id: $id, ')
          ..write('closedAt: $closedAt, ')
          ..write('businessDate: $businessDate, ')
          ..write('expectedCash: $expectedCash, ')
          ..write('expectedCard: $expectedCard, ')
          ..write('countedCash: $countedCash, ')
          ..write('countedCard: $countedCard, ')
          ..write('cashMismatch: $cashMismatch, ')
          ..write('cardMismatch: $cardMismatch, ')
          ..write('totalDebtIssued: $totalDebtIssued, ')
          ..write('totalDebtCollected: $totalDebtCollected, ')
          ..write('totalTips: $totalTips, ')
          ..write('isMissedClose: $isMissedClose, ')
          ..write('backupStatus: $backupStatus, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AuditEventsTable extends AuditEvents
    with TableInfo<$AuditEventsTable, AuditEvent> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AuditEventsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _eventTypeMeta = const VerificationMeta(
    'eventType',
  );
  @override
  late final GeneratedColumn<String> eventType = GeneratedColumn<String>(
    'event_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _triggeredAtMeta = const VerificationMeta(
    'triggeredAt',
  );
  @override
  late final GeneratedColumn<String> triggeredAt = GeneratedColumn<String>(
    'triggered_at',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _metadataMeta = const VerificationMeta(
    'metadata',
  );
  @override
  late final GeneratedColumn<String> metadata = GeneratedColumn<String>(
    'metadata',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    eventType,
    description,
    triggeredAt,
    metadata,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'audit_events';
  @override
  VerificationContext validateIntegrity(
    Insertable<AuditEvent> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('event_type')) {
      context.handle(
        _eventTypeMeta,
        eventType.isAcceptableOrUnknown(data['event_type']!, _eventTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_eventTypeMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('triggered_at')) {
      context.handle(
        _triggeredAtMeta,
        triggeredAt.isAcceptableOrUnknown(
          data['triggered_at']!,
          _triggeredAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_triggeredAtMeta);
    }
    if (data.containsKey('metadata')) {
      context.handle(
        _metadataMeta,
        metadata.isAcceptableOrUnknown(data['metadata']!, _metadataMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AuditEvent map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AuditEvent(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      eventType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}event_type'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      triggeredAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}triggered_at'],
      )!,
      metadata: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}metadata'],
      ),
    );
  }

  @override
  $AuditEventsTable createAlias(String alias) {
    return $AuditEventsTable(attachedDatabase, alias);
  }
}

class AuditEvent extends DataClass implements Insertable<AuditEvent> {
  final int id;
  final String eventType;
  final String description;
  final String triggeredAt;
  final String? metadata;
  const AuditEvent({
    required this.id,
    required this.eventType,
    required this.description,
    required this.triggeredAt,
    this.metadata,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['event_type'] = Variable<String>(eventType);
    map['description'] = Variable<String>(description);
    map['triggered_at'] = Variable<String>(triggeredAt);
    if (!nullToAbsent || metadata != null) {
      map['metadata'] = Variable<String>(metadata);
    }
    return map;
  }

  AuditEventsCompanion toCompanion(bool nullToAbsent) {
    return AuditEventsCompanion(
      id: Value(id),
      eventType: Value(eventType),
      description: Value(description),
      triggeredAt: Value(triggeredAt),
      metadata: metadata == null && nullToAbsent
          ? const Value.absent()
          : Value(metadata),
    );
  }

  factory AuditEvent.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AuditEvent(
      id: serializer.fromJson<int>(json['id']),
      eventType: serializer.fromJson<String>(json['eventType']),
      description: serializer.fromJson<String>(json['description']),
      triggeredAt: serializer.fromJson<String>(json['triggeredAt']),
      metadata: serializer.fromJson<String?>(json['metadata']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'eventType': serializer.toJson<String>(eventType),
      'description': serializer.toJson<String>(description),
      'triggeredAt': serializer.toJson<String>(triggeredAt),
      'metadata': serializer.toJson<String?>(metadata),
    };
  }

  AuditEvent copyWith({
    int? id,
    String? eventType,
    String? description,
    String? triggeredAt,
    Value<String?> metadata = const Value.absent(),
  }) => AuditEvent(
    id: id ?? this.id,
    eventType: eventType ?? this.eventType,
    description: description ?? this.description,
    triggeredAt: triggeredAt ?? this.triggeredAt,
    metadata: metadata.present ? metadata.value : this.metadata,
  );
  AuditEvent copyWithCompanion(AuditEventsCompanion data) {
    return AuditEvent(
      id: data.id.present ? data.id.value : this.id,
      eventType: data.eventType.present ? data.eventType.value : this.eventType,
      description: data.description.present
          ? data.description.value
          : this.description,
      triggeredAt: data.triggeredAt.present
          ? data.triggeredAt.value
          : this.triggeredAt,
      metadata: data.metadata.present ? data.metadata.value : this.metadata,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AuditEvent(')
          ..write('id: $id, ')
          ..write('eventType: $eventType, ')
          ..write('description: $description, ')
          ..write('triggeredAt: $triggeredAt, ')
          ..write('metadata: $metadata')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, eventType, description, triggeredAt, metadata);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AuditEvent &&
          other.id == this.id &&
          other.eventType == this.eventType &&
          other.description == this.description &&
          other.triggeredAt == this.triggeredAt &&
          other.metadata == this.metadata);
}

class AuditEventsCompanion extends UpdateCompanion<AuditEvent> {
  final Value<int> id;
  final Value<String> eventType;
  final Value<String> description;
  final Value<String> triggeredAt;
  final Value<String?> metadata;
  const AuditEventsCompanion({
    this.id = const Value.absent(),
    this.eventType = const Value.absent(),
    this.description = const Value.absent(),
    this.triggeredAt = const Value.absent(),
    this.metadata = const Value.absent(),
  });
  AuditEventsCompanion.insert({
    this.id = const Value.absent(),
    required String eventType,
    required String description,
    required String triggeredAt,
    this.metadata = const Value.absent(),
  }) : eventType = Value(eventType),
       description = Value(description),
       triggeredAt = Value(triggeredAt);
  static Insertable<AuditEvent> custom({
    Expression<int>? id,
    Expression<String>? eventType,
    Expression<String>? description,
    Expression<String>? triggeredAt,
    Expression<String>? metadata,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (eventType != null) 'event_type': eventType,
      if (description != null) 'description': description,
      if (triggeredAt != null) 'triggered_at': triggeredAt,
      if (metadata != null) 'metadata': metadata,
    });
  }

  AuditEventsCompanion copyWith({
    Value<int>? id,
    Value<String>? eventType,
    Value<String>? description,
    Value<String>? triggeredAt,
    Value<String?>? metadata,
  }) {
    return AuditEventsCompanion(
      id: id ?? this.id,
      eventType: eventType ?? this.eventType,
      description: description ?? this.description,
      triggeredAt: triggeredAt ?? this.triggeredAt,
      metadata: metadata ?? this.metadata,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (eventType.present) {
      map['event_type'] = Variable<String>(eventType.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (triggeredAt.present) {
      map['triggered_at'] = Variable<String>(triggeredAt.value);
    }
    if (metadata.present) {
      map['metadata'] = Variable<String>(metadata.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AuditEventsCompanion(')
          ..write('id: $id, ')
          ..write('eventType: $eventType, ')
          ..write('description: $description, ')
          ..write('triggeredAt: $triggeredAt, ')
          ..write('metadata: $metadata')
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
  static const VerificationMeta _triggeredAtMeta = const VerificationMeta(
    'triggeredAt',
  );
  @override
  late final GeneratedColumn<String> triggeredAt = GeneratedColumn<String>(
    'triggered_at',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _triggerTypeMeta = const VerificationMeta(
    'triggerType',
  );
  @override
  late final GeneratedColumn<String> triggerType = GeneratedColumn<String>(
    'trigger_type',
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
  static const VerificationMeta _backupFilenameMeta = const VerificationMeta(
    'backupFilename',
  );
  @override
  late final GeneratedColumn<String> backupFilename = GeneratedColumn<String>(
    'backup_filename',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _errorMessageMeta = const VerificationMeta(
    'errorMessage',
  );
  @override
  late final GeneratedColumn<String> errorMessage = GeneratedColumn<String>(
    'error_message',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    triggeredAt,
    triggerType,
    status,
    backupFilename,
    errorMessage,
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
    if (data.containsKey('triggered_at')) {
      context.handle(
        _triggeredAtMeta,
        triggeredAt.isAcceptableOrUnknown(
          data['triggered_at']!,
          _triggeredAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_triggeredAtMeta);
    }
    if (data.containsKey('trigger_type')) {
      context.handle(
        _triggerTypeMeta,
        triggerType.isAcceptableOrUnknown(
          data['trigger_type']!,
          _triggerTypeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_triggerTypeMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('backup_filename')) {
      context.handle(
        _backupFilenameMeta,
        backupFilename.isAcceptableOrUnknown(
          data['backup_filename']!,
          _backupFilenameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_backupFilenameMeta);
    }
    if (data.containsKey('error_message')) {
      context.handle(
        _errorMessageMeta,
        errorMessage.isAcceptableOrUnknown(
          data['error_message']!,
          _errorMessageMeta,
        ),
      );
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
      triggeredAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}triggered_at'],
      )!,
      triggerType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}trigger_type'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      backupFilename: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}backup_filename'],
      )!,
      errorMessage: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}error_message'],
      ),
    );
  }

  @override
  $BackupRunsTable createAlias(String alias) {
    return $BackupRunsTable(attachedDatabase, alias);
  }
}

class BackupRun extends DataClass implements Insertable<BackupRun> {
  final int id;
  final String triggeredAt;
  final String triggerType;
  final String status;
  final String backupFilename;
  final String? errorMessage;
  const BackupRun({
    required this.id,
    required this.triggeredAt,
    required this.triggerType,
    required this.status,
    required this.backupFilename,
    this.errorMessage,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['triggered_at'] = Variable<String>(triggeredAt);
    map['trigger_type'] = Variable<String>(triggerType);
    map['status'] = Variable<String>(status);
    map['backup_filename'] = Variable<String>(backupFilename);
    if (!nullToAbsent || errorMessage != null) {
      map['error_message'] = Variable<String>(errorMessage);
    }
    return map;
  }

  BackupRunsCompanion toCompanion(bool nullToAbsent) {
    return BackupRunsCompanion(
      id: Value(id),
      triggeredAt: Value(triggeredAt),
      triggerType: Value(triggerType),
      status: Value(status),
      backupFilename: Value(backupFilename),
      errorMessage: errorMessage == null && nullToAbsent
          ? const Value.absent()
          : Value(errorMessage),
    );
  }

  factory BackupRun.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BackupRun(
      id: serializer.fromJson<int>(json['id']),
      triggeredAt: serializer.fromJson<String>(json['triggeredAt']),
      triggerType: serializer.fromJson<String>(json['triggerType']),
      status: serializer.fromJson<String>(json['status']),
      backupFilename: serializer.fromJson<String>(json['backupFilename']),
      errorMessage: serializer.fromJson<String?>(json['errorMessage']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'triggeredAt': serializer.toJson<String>(triggeredAt),
      'triggerType': serializer.toJson<String>(triggerType),
      'status': serializer.toJson<String>(status),
      'backupFilename': serializer.toJson<String>(backupFilename),
      'errorMessage': serializer.toJson<String?>(errorMessage),
    };
  }

  BackupRun copyWith({
    int? id,
    String? triggeredAt,
    String? triggerType,
    String? status,
    String? backupFilename,
    Value<String?> errorMessage = const Value.absent(),
  }) => BackupRun(
    id: id ?? this.id,
    triggeredAt: triggeredAt ?? this.triggeredAt,
    triggerType: triggerType ?? this.triggerType,
    status: status ?? this.status,
    backupFilename: backupFilename ?? this.backupFilename,
    errorMessage: errorMessage.present ? errorMessage.value : this.errorMessage,
  );
  BackupRun copyWithCompanion(BackupRunsCompanion data) {
    return BackupRun(
      id: data.id.present ? data.id.value : this.id,
      triggeredAt: data.triggeredAt.present
          ? data.triggeredAt.value
          : this.triggeredAt,
      triggerType: data.triggerType.present
          ? data.triggerType.value
          : this.triggerType,
      status: data.status.present ? data.status.value : this.status,
      backupFilename: data.backupFilename.present
          ? data.backupFilename.value
          : this.backupFilename,
      errorMessage: data.errorMessage.present
          ? data.errorMessage.value
          : this.errorMessage,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BackupRun(')
          ..write('id: $id, ')
          ..write('triggeredAt: $triggeredAt, ')
          ..write('triggerType: $triggerType, ')
          ..write('status: $status, ')
          ..write('backupFilename: $backupFilename, ')
          ..write('errorMessage: $errorMessage')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    triggeredAt,
    triggerType,
    status,
    backupFilename,
    errorMessage,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BackupRun &&
          other.id == this.id &&
          other.triggeredAt == this.triggeredAt &&
          other.triggerType == this.triggerType &&
          other.status == this.status &&
          other.backupFilename == this.backupFilename &&
          other.errorMessage == this.errorMessage);
}

class BackupRunsCompanion extends UpdateCompanion<BackupRun> {
  final Value<int> id;
  final Value<String> triggeredAt;
  final Value<String> triggerType;
  final Value<String> status;
  final Value<String> backupFilename;
  final Value<String?> errorMessage;
  const BackupRunsCompanion({
    this.id = const Value.absent(),
    this.triggeredAt = const Value.absent(),
    this.triggerType = const Value.absent(),
    this.status = const Value.absent(),
    this.backupFilename = const Value.absent(),
    this.errorMessage = const Value.absent(),
  });
  BackupRunsCompanion.insert({
    this.id = const Value.absent(),
    required String triggeredAt,
    required String triggerType,
    required String status,
    required String backupFilename,
    this.errorMessage = const Value.absent(),
  }) : triggeredAt = Value(triggeredAt),
       triggerType = Value(triggerType),
       status = Value(status),
       backupFilename = Value(backupFilename);
  static Insertable<BackupRun> custom({
    Expression<int>? id,
    Expression<String>? triggeredAt,
    Expression<String>? triggerType,
    Expression<String>? status,
    Expression<String>? backupFilename,
    Expression<String>? errorMessage,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (triggeredAt != null) 'triggered_at': triggeredAt,
      if (triggerType != null) 'trigger_type': triggerType,
      if (status != null) 'status': status,
      if (backupFilename != null) 'backup_filename': backupFilename,
      if (errorMessage != null) 'error_message': errorMessage,
    });
  }

  BackupRunsCompanion copyWith({
    Value<int>? id,
    Value<String>? triggeredAt,
    Value<String>? triggerType,
    Value<String>? status,
    Value<String>? backupFilename,
    Value<String?>? errorMessage,
  }) {
    return BackupRunsCompanion(
      id: id ?? this.id,
      triggeredAt: triggeredAt ?? this.triggeredAt,
      triggerType: triggerType ?? this.triggerType,
      status: status ?? this.status,
      backupFilename: backupFilename ?? this.backupFilename,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (triggeredAt.present) {
      map['triggered_at'] = Variable<String>(triggeredAt.value);
    }
    if (triggerType.present) {
      map['trigger_type'] = Variable<String>(triggerType.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (backupFilename.present) {
      map['backup_filename'] = Variable<String>(backupFilename.value);
    }
    if (errorMessage.present) {
      map['error_message'] = Variable<String>(errorMessage.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BackupRunsCompanion(')
          ..write('id: $id, ')
          ..write('triggeredAt: $triggeredAt, ')
          ..write('triggerType: $triggerType, ')
          ..write('status: $status, ')
          ..write('backupFilename: $backupFilename, ')
          ..write('errorMessage: $errorMessage')
          ..write(')'))
        .toString();
  }
}

class $SystemSettingsTable extends SystemSettings
    with TableInfo<$SystemSettingsTable, SystemSetting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SystemSettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [key, value, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'system_settings';
  @override
  VerificationContext validateIntegrity(
    Insertable<SystemSetting> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  SystemSetting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SystemSetting(
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $SystemSettingsTable createAlias(String alias) {
    return $SystemSettingsTable(attachedDatabase, alias);
  }
}

class SystemSetting extends DataClass implements Insertable<SystemSetting> {
  final String key;
  final String value;
  final String updatedAt;
  const SystemSetting({
    required this.key,
    required this.value,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['value'] = Variable<String>(value);
    map['updated_at'] = Variable<String>(updatedAt);
    return map;
  }

  SystemSettingsCompanion toCompanion(bool nullToAbsent) {
    return SystemSettingsCompanion(
      key: Value(key),
      value: Value(value),
      updatedAt: Value(updatedAt),
    );
  }

  factory SystemSetting.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SystemSetting(
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
      updatedAt: serializer.fromJson<String>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
      'updatedAt': serializer.toJson<String>(updatedAt),
    };
  }

  SystemSetting copyWith({String? key, String? value, String? updatedAt}) =>
      SystemSetting(
        key: key ?? this.key,
        value: value ?? this.value,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  SystemSetting copyWithCompanion(SystemSettingsCompanion data) {
    return SystemSetting(
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SystemSetting(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, value, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SystemSetting &&
          other.key == this.key &&
          other.value == this.value &&
          other.updatedAt == this.updatedAt);
}

class SystemSettingsCompanion extends UpdateCompanion<SystemSetting> {
  final Value<String> key;
  final Value<String> value;
  final Value<String> updatedAt;
  final Value<int> rowid;
  const SystemSettingsCompanion({
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SystemSettingsCompanion.insert({
    required String key,
    required String value,
    required String updatedAt,
    this.rowid = const Value.absent(),
  }) : key = Value(key),
       value = Value(value),
       updatedAt = Value(updatedAt);
  static Insertable<SystemSetting> custom({
    Expression<String>? key,
    Expression<String>? value,
    Expression<String>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SystemSettingsCompanion copyWith({
    Value<String>? key,
    Value<String>? value,
    Value<String>? updatedAt,
    Value<int>? rowid,
  }) {
    return SystemSettingsCompanion(
      key: key ?? this.key,
      value: value ?? this.value,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SystemSettingsCompanion(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CorrectionsTable extends Corrections
    with TableInfo<$CorrectionsTable, Correction> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CorrectionsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _originalIdMeta = const VerificationMeta(
    'originalId',
  );
  @override
  late final GeneratedColumn<String> originalId = GeneratedColumn<String>(
    'original_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _originalTableMeta = const VerificationMeta(
    'originalTable',
  );
  @override
  late final GeneratedColumn<String> originalTable = GeneratedColumn<String>(
    'original_table',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _correctionTypeMeta = const VerificationMeta(
    'correctionType',
  );
  @override
  late final GeneratedColumn<String> correctionType = GeneratedColumn<String>(
    'correction_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _auditEventIdMeta = const VerificationMeta(
    'auditEventId',
  );
  @override
  late final GeneratedColumn<int> auditEventId = GeneratedColumn<int>(
    'audit_event_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES audit_events (id)',
    ),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    originalId,
    originalTable,
    correctionType,
    auditEventId,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'corrections';
  @override
  VerificationContext validateIntegrity(
    Insertable<Correction> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('original_id')) {
      context.handle(
        _originalIdMeta,
        originalId.isAcceptableOrUnknown(data['original_id']!, _originalIdMeta),
      );
    } else if (isInserting) {
      context.missing(_originalIdMeta);
    }
    if (data.containsKey('original_table')) {
      context.handle(
        _originalTableMeta,
        originalTable.isAcceptableOrUnknown(
          data['original_table']!,
          _originalTableMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_originalTableMeta);
    }
    if (data.containsKey('correction_type')) {
      context.handle(
        _correctionTypeMeta,
        correctionType.isAcceptableOrUnknown(
          data['correction_type']!,
          _correctionTypeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_correctionTypeMeta);
    }
    if (data.containsKey('audit_event_id')) {
      context.handle(
        _auditEventIdMeta,
        auditEventId.isAcceptableOrUnknown(
          data['audit_event_id']!,
          _auditEventIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_auditEventIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Correction map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Correction(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      originalId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}original_id'],
      )!,
      originalTable: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}original_table'],
      )!,
      correctionType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}correction_type'],
      )!,
      auditEventId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}audit_event_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $CorrectionsTable createAlias(String alias) {
    return $CorrectionsTable(attachedDatabase, alias);
  }
}

class Correction extends DataClass implements Insertable<Correction> {
  final int id;
  final String originalId;
  final String originalTable;
  final String correctionType;
  final int auditEventId;
  final String createdAt;
  const Correction({
    required this.id,
    required this.originalId,
    required this.originalTable,
    required this.correctionType,
    required this.auditEventId,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['original_id'] = Variable<String>(originalId);
    map['original_table'] = Variable<String>(originalTable);
    map['correction_type'] = Variable<String>(correctionType);
    map['audit_event_id'] = Variable<int>(auditEventId);
    map['created_at'] = Variable<String>(createdAt);
    return map;
  }

  CorrectionsCompanion toCompanion(bool nullToAbsent) {
    return CorrectionsCompanion(
      id: Value(id),
      originalId: Value(originalId),
      originalTable: Value(originalTable),
      correctionType: Value(correctionType),
      auditEventId: Value(auditEventId),
      createdAt: Value(createdAt),
    );
  }

  factory Correction.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Correction(
      id: serializer.fromJson<int>(json['id']),
      originalId: serializer.fromJson<String>(json['originalId']),
      originalTable: serializer.fromJson<String>(json['originalTable']),
      correctionType: serializer.fromJson<String>(json['correctionType']),
      auditEventId: serializer.fromJson<int>(json['auditEventId']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'originalId': serializer.toJson<String>(originalId),
      'originalTable': serializer.toJson<String>(originalTable),
      'correctionType': serializer.toJson<String>(correctionType),
      'auditEventId': serializer.toJson<int>(auditEventId),
      'createdAt': serializer.toJson<String>(createdAt),
    };
  }

  Correction copyWith({
    int? id,
    String? originalId,
    String? originalTable,
    String? correctionType,
    int? auditEventId,
    String? createdAt,
  }) => Correction(
    id: id ?? this.id,
    originalId: originalId ?? this.originalId,
    originalTable: originalTable ?? this.originalTable,
    correctionType: correctionType ?? this.correctionType,
    auditEventId: auditEventId ?? this.auditEventId,
    createdAt: createdAt ?? this.createdAt,
  );
  Correction copyWithCompanion(CorrectionsCompanion data) {
    return Correction(
      id: data.id.present ? data.id.value : this.id,
      originalId: data.originalId.present
          ? data.originalId.value
          : this.originalId,
      originalTable: data.originalTable.present
          ? data.originalTable.value
          : this.originalTable,
      correctionType: data.correctionType.present
          ? data.correctionType.value
          : this.correctionType,
      auditEventId: data.auditEventId.present
          ? data.auditEventId.value
          : this.auditEventId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Correction(')
          ..write('id: $id, ')
          ..write('originalId: $originalId, ')
          ..write('originalTable: $originalTable, ')
          ..write('correctionType: $correctionType, ')
          ..write('auditEventId: $auditEventId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    originalId,
    originalTable,
    correctionType,
    auditEventId,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Correction &&
          other.id == this.id &&
          other.originalId == this.originalId &&
          other.originalTable == this.originalTable &&
          other.correctionType == this.correctionType &&
          other.auditEventId == this.auditEventId &&
          other.createdAt == this.createdAt);
}

class CorrectionsCompanion extends UpdateCompanion<Correction> {
  final Value<int> id;
  final Value<String> originalId;
  final Value<String> originalTable;
  final Value<String> correctionType;
  final Value<int> auditEventId;
  final Value<String> createdAt;
  const CorrectionsCompanion({
    this.id = const Value.absent(),
    this.originalId = const Value.absent(),
    this.originalTable = const Value.absent(),
    this.correctionType = const Value.absent(),
    this.auditEventId = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  CorrectionsCompanion.insert({
    this.id = const Value.absent(),
    required String originalId,
    required String originalTable,
    required String correctionType,
    required int auditEventId,
    required String createdAt,
  }) : originalId = Value(originalId),
       originalTable = Value(originalTable),
       correctionType = Value(correctionType),
       auditEventId = Value(auditEventId),
       createdAt = Value(createdAt);
  static Insertable<Correction> custom({
    Expression<int>? id,
    Expression<String>? originalId,
    Expression<String>? originalTable,
    Expression<String>? correctionType,
    Expression<int>? auditEventId,
    Expression<String>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (originalId != null) 'original_id': originalId,
      if (originalTable != null) 'original_table': originalTable,
      if (correctionType != null) 'correction_type': correctionType,
      if (auditEventId != null) 'audit_event_id': auditEventId,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  CorrectionsCompanion copyWith({
    Value<int>? id,
    Value<String>? originalId,
    Value<String>? originalTable,
    Value<String>? correctionType,
    Value<int>? auditEventId,
    Value<String>? createdAt,
  }) {
    return CorrectionsCompanion(
      id: id ?? this.id,
      originalId: originalId ?? this.originalId,
      originalTable: originalTable ?? this.originalTable,
      correctionType: correctionType ?? this.correctionType,
      auditEventId: auditEventId ?? this.auditEventId,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (originalId.present) {
      map['original_id'] = Variable<String>(originalId.value);
    }
    if (originalTable.present) {
      map['original_table'] = Variable<String>(originalTable.value);
    }
    if (correctionType.present) {
      map['correction_type'] = Variable<String>(correctionType.value);
    }
    if (auditEventId.present) {
      map['audit_event_id'] = Variable<int>(auditEventId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CorrectionsCompanion(')
          ..write('id: $id, ')
          ..write('originalId: $originalId, ')
          ..write('originalTable: $originalTable, ')
          ..write('correctionType: $correctionType, ')
          ..write('auditEventId: $auditEventId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $PlayersTable players = $PlayersTable(this);
  late final $PlayerPhonesTable playerPhones = $PlayerPhonesTable(this);
  late final $SubscriptionsTable subscriptions = $SubscriptionsTable(this);
  late final $SessionsTable sessions = $SessionsTable(this);
  late final $SubscriptionUsageLogsTable subscriptionUsageLogs =
      $SubscriptionUsageLogsTable(this);
  late final $ProductsTable products = $ProductsTable(this);
  late final $ProductSalesTable productSales = $ProductSalesTable(this);
  late final $SaleItemsTable saleItems = $SaleItemsTable(this);
  late final $PaymentsTable payments = $PaymentsTable(this);
  late final $DebtsTable debts = $DebtsTable(this);
  late final $DebtPaymentsTable debtPayments = $DebtPaymentsTable(this);
  late final $InventoryMovementsTable inventoryMovements =
      $InventoryMovementsTable(this);
  late final $EndDayClosesTable endDayCloses = $EndDayClosesTable(this);
  late final $AuditEventsTable auditEvents = $AuditEventsTable(this);
  late final $BackupRunsTable backupRuns = $BackupRunsTable(this);
  late final $SystemSettingsTable systemSettings = $SystemSettingsTable(this);
  late final $CorrectionsTable corrections = $CorrectionsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    players,
    playerPhones,
    subscriptions,
    sessions,
    subscriptionUsageLogs,
    products,
    productSales,
    saleItems,
    payments,
    debts,
    debtPayments,
    inventoryMovements,
    endDayCloses,
    auditEvents,
    backupRuns,
    systemSettings,
    corrections,
  ];
}

typedef $$PlayersTableCreateCompanionBuilder =
    PlayersCompanion Function({
      required String id,
      required String fullName,
      required int age,
      required String createdAt,
      required String updatedAt,
      required bool hasActiveSession,
      Value<int> rowid,
    });
typedef $$PlayersTableUpdateCompanionBuilder =
    PlayersCompanion Function({
      Value<String> id,
      Value<String> fullName,
      Value<int> age,
      Value<String> createdAt,
      Value<String> updatedAt,
      Value<bool> hasActiveSession,
      Value<int> rowid,
    });

final class $$PlayersTableReferences
    extends BaseReferences<_$AppDatabase, $PlayersTable, Player> {
  $$PlayersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$PlayerPhonesTable, List<PlayerPhone>>
  _playerPhonesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.playerPhones,
    aliasName: $_aliasNameGenerator(db.players.id, db.playerPhones.playerId),
  );

  $$PlayerPhonesTableProcessedTableManager get playerPhonesRefs {
    final manager = $$PlayerPhonesTableTableManager(
      $_db,
      $_db.playerPhones,
    ).filter((f) => f.playerId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_playerPhonesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$SubscriptionsTable, List<Subscription>>
  _subscriptionsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.subscriptions,
    aliasName: $_aliasNameGenerator(db.players.id, db.subscriptions.playerId),
  );

  $$SubscriptionsTableProcessedTableManager get subscriptionsRefs {
    final manager = $$SubscriptionsTableTableManager(
      $_db,
      $_db.subscriptions,
    ).filter((f) => f.playerId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_subscriptionsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$SessionsTable, List<Session>> _sessionsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.sessions,
    aliasName: $_aliasNameGenerator(db.players.id, db.sessions.playerId),
  );

  $$SessionsTableProcessedTableManager get sessionsRefs {
    final manager = $$SessionsTableTableManager(
      $_db,
      $_db.sessions,
    ).filter((f) => f.playerId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_sessionsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ProductSalesTable, List<ProductSale>>
  _productSalesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.productSales,
    aliasName: $_aliasNameGenerator(db.players.id, db.productSales.playerId),
  );

  $$ProductSalesTableProcessedTableManager get productSalesRefs {
    final manager = $$ProductSalesTableTableManager(
      $_db,
      $_db.productSales,
    ).filter((f) => f.playerId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_productSalesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$PaymentsTable, List<Payment>> _paymentsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.payments,
    aliasName: $_aliasNameGenerator(db.players.id, db.payments.playerId),
  );

  $$PaymentsTableProcessedTableManager get paymentsRefs {
    final manager = $$PaymentsTableTableManager(
      $_db,
      $_db.payments,
    ).filter((f) => f.playerId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_paymentsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$DebtsTable, List<Debt>> _debtsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.debts,
    aliasName: $_aliasNameGenerator(db.players.id, db.debts.playerId),
  );

  $$DebtsTableProcessedTableManager get debtsRefs {
    final manager = $$DebtsTableTableManager(
      $_db,
      $_db.debts,
    ).filter((f) => f.playerId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_debtsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$PlayersTableFilterComposer
    extends Composer<_$AppDatabase, $PlayersTable> {
  $$PlayersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fullName => $composableBuilder(
    column: $table.fullName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get age => $composableBuilder(
    column: $table.age,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get hasActiveSession => $composableBuilder(
    column: $table.hasActiveSession,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> playerPhonesRefs(
    Expression<bool> Function($$PlayerPhonesTableFilterComposer f) f,
  ) {
    final $$PlayerPhonesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.playerPhones,
      getReferencedColumn: (t) => t.playerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlayerPhonesTableFilterComposer(
            $db: $db,
            $table: $db.playerPhones,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> subscriptionsRefs(
    Expression<bool> Function($$SubscriptionsTableFilterComposer f) f,
  ) {
    final $$SubscriptionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.subscriptions,
      getReferencedColumn: (t) => t.playerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubscriptionsTableFilterComposer(
            $db: $db,
            $table: $db.subscriptions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> sessionsRefs(
    Expression<bool> Function($$SessionsTableFilterComposer f) f,
  ) {
    final $$SessionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.sessions,
      getReferencedColumn: (t) => t.playerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SessionsTableFilterComposer(
            $db: $db,
            $table: $db.sessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> productSalesRefs(
    Expression<bool> Function($$ProductSalesTableFilterComposer f) f,
  ) {
    final $$ProductSalesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.productSales,
      getReferencedColumn: (t) => t.playerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductSalesTableFilterComposer(
            $db: $db,
            $table: $db.productSales,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> paymentsRefs(
    Expression<bool> Function($$PaymentsTableFilterComposer f) f,
  ) {
    final $$PaymentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.payments,
      getReferencedColumn: (t) => t.playerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PaymentsTableFilterComposer(
            $db: $db,
            $table: $db.payments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> debtsRefs(
    Expression<bool> Function($$DebtsTableFilterComposer f) f,
  ) {
    final $$DebtsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.debts,
      getReferencedColumn: (t) => t.playerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DebtsTableFilterComposer(
            $db: $db,
            $table: $db.debts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PlayersTableOrderingComposer
    extends Composer<_$AppDatabase, $PlayersTable> {
  $$PlayersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fullName => $composableBuilder(
    column: $table.fullName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get age => $composableBuilder(
    column: $table.age,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get hasActiveSession => $composableBuilder(
    column: $table.hasActiveSession,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PlayersTableAnnotationComposer
    extends Composer<_$AppDatabase, $PlayersTable> {
  $$PlayersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get fullName =>
      $composableBuilder(column: $table.fullName, builder: (column) => column);

  GeneratedColumn<int> get age =>
      $composableBuilder(column: $table.age, builder: (column) => column);

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get hasActiveSession => $composableBuilder(
    column: $table.hasActiveSession,
    builder: (column) => column,
  );

  Expression<T> playerPhonesRefs<T extends Object>(
    Expression<T> Function($$PlayerPhonesTableAnnotationComposer a) f,
  ) {
    final $$PlayerPhonesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.playerPhones,
      getReferencedColumn: (t) => t.playerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlayerPhonesTableAnnotationComposer(
            $db: $db,
            $table: $db.playerPhones,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> subscriptionsRefs<T extends Object>(
    Expression<T> Function($$SubscriptionsTableAnnotationComposer a) f,
  ) {
    final $$SubscriptionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.subscriptions,
      getReferencedColumn: (t) => t.playerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubscriptionsTableAnnotationComposer(
            $db: $db,
            $table: $db.subscriptions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> sessionsRefs<T extends Object>(
    Expression<T> Function($$SessionsTableAnnotationComposer a) f,
  ) {
    final $$SessionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.sessions,
      getReferencedColumn: (t) => t.playerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SessionsTableAnnotationComposer(
            $db: $db,
            $table: $db.sessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> productSalesRefs<T extends Object>(
    Expression<T> Function($$ProductSalesTableAnnotationComposer a) f,
  ) {
    final $$ProductSalesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.productSales,
      getReferencedColumn: (t) => t.playerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductSalesTableAnnotationComposer(
            $db: $db,
            $table: $db.productSales,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> paymentsRefs<T extends Object>(
    Expression<T> Function($$PaymentsTableAnnotationComposer a) f,
  ) {
    final $$PaymentsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.payments,
      getReferencedColumn: (t) => t.playerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PaymentsTableAnnotationComposer(
            $db: $db,
            $table: $db.payments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> debtsRefs<T extends Object>(
    Expression<T> Function($$DebtsTableAnnotationComposer a) f,
  ) {
    final $$DebtsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.debts,
      getReferencedColumn: (t) => t.playerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DebtsTableAnnotationComposer(
            $db: $db,
            $table: $db.debts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PlayersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PlayersTable,
          Player,
          $$PlayersTableFilterComposer,
          $$PlayersTableOrderingComposer,
          $$PlayersTableAnnotationComposer,
          $$PlayersTableCreateCompanionBuilder,
          $$PlayersTableUpdateCompanionBuilder,
          (Player, $$PlayersTableReferences),
          Player,
          PrefetchHooks Function({
            bool playerPhonesRefs,
            bool subscriptionsRefs,
            bool sessionsRefs,
            bool productSalesRefs,
            bool paymentsRefs,
            bool debtsRefs,
          })
        > {
  $$PlayersTableTableManager(_$AppDatabase db, $PlayersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PlayersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PlayersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PlayersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> fullName = const Value.absent(),
                Value<int> age = const Value.absent(),
                Value<String> createdAt = const Value.absent(),
                Value<String> updatedAt = const Value.absent(),
                Value<bool> hasActiveSession = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PlayersCompanion(
                id: id,
                fullName: fullName,
                age: age,
                createdAt: createdAt,
                updatedAt: updatedAt,
                hasActiveSession: hasActiveSession,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String fullName,
                required int age,
                required String createdAt,
                required String updatedAt,
                required bool hasActiveSession,
                Value<int> rowid = const Value.absent(),
              }) => PlayersCompanion.insert(
                id: id,
                fullName: fullName,
                age: age,
                createdAt: createdAt,
                updatedAt: updatedAt,
                hasActiveSession: hasActiveSession,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PlayersTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                playerPhonesRefs = false,
                subscriptionsRefs = false,
                sessionsRefs = false,
                productSalesRefs = false,
                paymentsRefs = false,
                debtsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (playerPhonesRefs) db.playerPhones,
                    if (subscriptionsRefs) db.subscriptions,
                    if (sessionsRefs) db.sessions,
                    if (productSalesRefs) db.productSales,
                    if (paymentsRefs) db.payments,
                    if (debtsRefs) db.debts,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (playerPhonesRefs)
                        await $_getPrefetchedData<
                          Player,
                          $PlayersTable,
                          PlayerPhone
                        >(
                          currentTable: table,
                          referencedTable: $$PlayersTableReferences
                              ._playerPhonesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PlayersTableReferences(
                                db,
                                table,
                                p0,
                              ).playerPhonesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.playerId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (subscriptionsRefs)
                        await $_getPrefetchedData<
                          Player,
                          $PlayersTable,
                          Subscription
                        >(
                          currentTable: table,
                          referencedTable: $$PlayersTableReferences
                              ._subscriptionsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PlayersTableReferences(
                                db,
                                table,
                                p0,
                              ).subscriptionsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.playerId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (sessionsRefs)
                        await $_getPrefetchedData<
                          Player,
                          $PlayersTable,
                          Session
                        >(
                          currentTable: table,
                          referencedTable: $$PlayersTableReferences
                              ._sessionsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PlayersTableReferences(
                                db,
                                table,
                                p0,
                              ).sessionsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.playerId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (productSalesRefs)
                        await $_getPrefetchedData<
                          Player,
                          $PlayersTable,
                          ProductSale
                        >(
                          currentTable: table,
                          referencedTable: $$PlayersTableReferences
                              ._productSalesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PlayersTableReferences(
                                db,
                                table,
                                p0,
                              ).productSalesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.playerId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (paymentsRefs)
                        await $_getPrefetchedData<
                          Player,
                          $PlayersTable,
                          Payment
                        >(
                          currentTable: table,
                          referencedTable: $$PlayersTableReferences
                              ._paymentsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PlayersTableReferences(
                                db,
                                table,
                                p0,
                              ).paymentsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.playerId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (debtsRefs)
                        await $_getPrefetchedData<Player, $PlayersTable, Debt>(
                          currentTable: table,
                          referencedTable: $$PlayersTableReferences
                              ._debtsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PlayersTableReferences(db, table, p0).debtsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.playerId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$PlayersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PlayersTable,
      Player,
      $$PlayersTableFilterComposer,
      $$PlayersTableOrderingComposer,
      $$PlayersTableAnnotationComposer,
      $$PlayersTableCreateCompanionBuilder,
      $$PlayersTableUpdateCompanionBuilder,
      (Player, $$PlayersTableReferences),
      Player,
      PrefetchHooks Function({
        bool playerPhonesRefs,
        bool subscriptionsRefs,
        bool sessionsRefs,
        bool productSalesRefs,
        bool paymentsRefs,
        bool debtsRefs,
      })
    >;
typedef $$PlayerPhonesTableCreateCompanionBuilder =
    PlayerPhonesCompanion Function({
      Value<int> id,
      required String playerId,
      required String phoneNumber,
      required bool isPrimary,
    });
typedef $$PlayerPhonesTableUpdateCompanionBuilder =
    PlayerPhonesCompanion Function({
      Value<int> id,
      Value<String> playerId,
      Value<String> phoneNumber,
      Value<bool> isPrimary,
    });

final class $$PlayerPhonesTableReferences
    extends BaseReferences<_$AppDatabase, $PlayerPhonesTable, PlayerPhone> {
  $$PlayerPhonesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PlayersTable _playerIdTable(_$AppDatabase db) =>
      db.players.createAlias(
        $_aliasNameGenerator(db.playerPhones.playerId, db.players.id),
      );

  $$PlayersTableProcessedTableManager get playerId {
    final $_column = $_itemColumn<String>('player_id')!;

    final manager = $$PlayersTableTableManager(
      $_db,
      $_db.players,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_playerIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$PlayerPhonesTableFilterComposer
    extends Composer<_$AppDatabase, $PlayerPhonesTable> {
  $$PlayerPhonesTableFilterComposer({
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

  ColumnFilters<String> get phoneNumber => $composableBuilder(
    column: $table.phoneNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isPrimary => $composableBuilder(
    column: $table.isPrimary,
    builder: (column) => ColumnFilters(column),
  );

  $$PlayersTableFilterComposer get playerId {
    final $$PlayersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playerId,
      referencedTable: $db.players,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlayersTableFilterComposer(
            $db: $db,
            $table: $db.players,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PlayerPhonesTableOrderingComposer
    extends Composer<_$AppDatabase, $PlayerPhonesTable> {
  $$PlayerPhonesTableOrderingComposer({
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

  ColumnOrderings<String> get phoneNumber => $composableBuilder(
    column: $table.phoneNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isPrimary => $composableBuilder(
    column: $table.isPrimary,
    builder: (column) => ColumnOrderings(column),
  );

  $$PlayersTableOrderingComposer get playerId {
    final $$PlayersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playerId,
      referencedTable: $db.players,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlayersTableOrderingComposer(
            $db: $db,
            $table: $db.players,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PlayerPhonesTableAnnotationComposer
    extends Composer<_$AppDatabase, $PlayerPhonesTable> {
  $$PlayerPhonesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get phoneNumber => $composableBuilder(
    column: $table.phoneNumber,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isPrimary =>
      $composableBuilder(column: $table.isPrimary, builder: (column) => column);

  $$PlayersTableAnnotationComposer get playerId {
    final $$PlayersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playerId,
      referencedTable: $db.players,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlayersTableAnnotationComposer(
            $db: $db,
            $table: $db.players,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PlayerPhonesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PlayerPhonesTable,
          PlayerPhone,
          $$PlayerPhonesTableFilterComposer,
          $$PlayerPhonesTableOrderingComposer,
          $$PlayerPhonesTableAnnotationComposer,
          $$PlayerPhonesTableCreateCompanionBuilder,
          $$PlayerPhonesTableUpdateCompanionBuilder,
          (PlayerPhone, $$PlayerPhonesTableReferences),
          PlayerPhone,
          PrefetchHooks Function({bool playerId})
        > {
  $$PlayerPhonesTableTableManager(_$AppDatabase db, $PlayerPhonesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PlayerPhonesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PlayerPhonesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PlayerPhonesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> playerId = const Value.absent(),
                Value<String> phoneNumber = const Value.absent(),
                Value<bool> isPrimary = const Value.absent(),
              }) => PlayerPhonesCompanion(
                id: id,
                playerId: playerId,
                phoneNumber: phoneNumber,
                isPrimary: isPrimary,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String playerId,
                required String phoneNumber,
                required bool isPrimary,
              }) => PlayerPhonesCompanion.insert(
                id: id,
                playerId: playerId,
                phoneNumber: phoneNumber,
                isPrimary: isPrimary,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PlayerPhonesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({playerId = false}) {
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
                    if (playerId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.playerId,
                                referencedTable: $$PlayerPhonesTableReferences
                                    ._playerIdTable(db),
                                referencedColumn: $$PlayerPhonesTableReferences
                                    ._playerIdTable(db)
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

typedef $$PlayerPhonesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PlayerPhonesTable,
      PlayerPhone,
      $$PlayerPhonesTableFilterComposer,
      $$PlayerPhonesTableOrderingComposer,
      $$PlayerPhonesTableAnnotationComposer,
      $$PlayerPhonesTableCreateCompanionBuilder,
      $$PlayerPhonesTableUpdateCompanionBuilder,
      (PlayerPhone, $$PlayerPhonesTableReferences),
      PlayerPhone,
      PrefetchHooks Function({bool playerId})
    >;
typedef $$SubscriptionsTableCreateCompanionBuilder =
    SubscriptionsCompanion Function({
      required String id,
      required String playerId,
      required int totalMinutes,
      required int remainingMinutes,
      required String purchasedAt,
      required String expiresAt,
      required String status,
      Value<String?> unpaidDebtId,
      Value<int> rowid,
    });
typedef $$SubscriptionsTableUpdateCompanionBuilder =
    SubscriptionsCompanion Function({
      Value<String> id,
      Value<String> playerId,
      Value<int> totalMinutes,
      Value<int> remainingMinutes,
      Value<String> purchasedAt,
      Value<String> expiresAt,
      Value<String> status,
      Value<String?> unpaidDebtId,
      Value<int> rowid,
    });

final class $$SubscriptionsTableReferences
    extends BaseReferences<_$AppDatabase, $SubscriptionsTable, Subscription> {
  $$SubscriptionsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $PlayersTable _playerIdTable(_$AppDatabase db) =>
      db.players.createAlias(
        $_aliasNameGenerator(db.subscriptions.playerId, db.players.id),
      );

  $$PlayersTableProcessedTableManager get playerId {
    final $_column = $_itemColumn<String>('player_id')!;

    final manager = $$PlayersTableTableManager(
      $_db,
      $_db.players,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_playerIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$SessionsTable, List<Session>> _sessionsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.sessions,
    aliasName: $_aliasNameGenerator(
      db.subscriptions.id,
      db.sessions.subscriptionId,
    ),
  );

  $$SessionsTableProcessedTableManager get sessionsRefs {
    final manager = $$SessionsTableTableManager(
      $_db,
      $_db.sessions,
    ).filter((f) => f.subscriptionId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_sessionsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $SubscriptionUsageLogsTable,
    List<SubscriptionUsageLog>
  >
  _subscriptionUsageLogsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.subscriptionUsageLogs,
        aliasName: $_aliasNameGenerator(
          db.subscriptions.id,
          db.subscriptionUsageLogs.subscriptionId,
        ),
      );

  $$SubscriptionUsageLogsTableProcessedTableManager
  get subscriptionUsageLogsRefs {
    final manager = $$SubscriptionUsageLogsTableTableManager(
      $_db,
      $_db.subscriptionUsageLogs,
    ).filter((f) => f.subscriptionId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _subscriptionUsageLogsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$DebtsTable, List<Debt>> _debtsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.debts,
    aliasName: $_aliasNameGenerator(
      db.subscriptions.id,
      db.debts.originatingSubscriptionId,
    ),
  );

  $$DebtsTableProcessedTableManager get debtsRefs {
    final manager = $$DebtsTableTableManager($_db, $_db.debts).filter(
      (f) =>
          f.originatingSubscriptionId.id.sqlEquals($_itemColumn<String>('id')!),
    );

    final cache = $_typedResult.readTableOrNull(_debtsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$SubscriptionsTableFilterComposer
    extends Composer<_$AppDatabase, $SubscriptionsTable> {
  $$SubscriptionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalMinutes => $composableBuilder(
    column: $table.totalMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get remainingMinutes => $composableBuilder(
    column: $table.remainingMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get purchasedAt => $composableBuilder(
    column: $table.purchasedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get expiresAt => $composableBuilder(
    column: $table.expiresAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get unpaidDebtId => $composableBuilder(
    column: $table.unpaidDebtId,
    builder: (column) => ColumnFilters(column),
  );

  $$PlayersTableFilterComposer get playerId {
    final $$PlayersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playerId,
      referencedTable: $db.players,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlayersTableFilterComposer(
            $db: $db,
            $table: $db.players,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> sessionsRefs(
    Expression<bool> Function($$SessionsTableFilterComposer f) f,
  ) {
    final $$SessionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.sessions,
      getReferencedColumn: (t) => t.subscriptionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SessionsTableFilterComposer(
            $db: $db,
            $table: $db.sessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> subscriptionUsageLogsRefs(
    Expression<bool> Function($$SubscriptionUsageLogsTableFilterComposer f) f,
  ) {
    final $$SubscriptionUsageLogsTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.subscriptionUsageLogs,
          getReferencedColumn: (t) => t.subscriptionId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$SubscriptionUsageLogsTableFilterComposer(
                $db: $db,
                $table: $db.subscriptionUsageLogs,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> debtsRefs(
    Expression<bool> Function($$DebtsTableFilterComposer f) f,
  ) {
    final $$DebtsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.debts,
      getReferencedColumn: (t) => t.originatingSubscriptionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DebtsTableFilterComposer(
            $db: $db,
            $table: $db.debts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SubscriptionsTableOrderingComposer
    extends Composer<_$AppDatabase, $SubscriptionsTable> {
  $$SubscriptionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalMinutes => $composableBuilder(
    column: $table.totalMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get remainingMinutes => $composableBuilder(
    column: $table.remainingMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get purchasedAt => $composableBuilder(
    column: $table.purchasedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get expiresAt => $composableBuilder(
    column: $table.expiresAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unpaidDebtId => $composableBuilder(
    column: $table.unpaidDebtId,
    builder: (column) => ColumnOrderings(column),
  );

  $$PlayersTableOrderingComposer get playerId {
    final $$PlayersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playerId,
      referencedTable: $db.players,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlayersTableOrderingComposer(
            $db: $db,
            $table: $db.players,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SubscriptionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SubscriptionsTable> {
  $$SubscriptionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get totalMinutes => $composableBuilder(
    column: $table.totalMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<int> get remainingMinutes => $composableBuilder(
    column: $table.remainingMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<String> get purchasedAt => $composableBuilder(
    column: $table.purchasedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get expiresAt =>
      $composableBuilder(column: $table.expiresAt, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get unpaidDebtId => $composableBuilder(
    column: $table.unpaidDebtId,
    builder: (column) => column,
  );

  $$PlayersTableAnnotationComposer get playerId {
    final $$PlayersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playerId,
      referencedTable: $db.players,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlayersTableAnnotationComposer(
            $db: $db,
            $table: $db.players,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> sessionsRefs<T extends Object>(
    Expression<T> Function($$SessionsTableAnnotationComposer a) f,
  ) {
    final $$SessionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.sessions,
      getReferencedColumn: (t) => t.subscriptionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SessionsTableAnnotationComposer(
            $db: $db,
            $table: $db.sessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> subscriptionUsageLogsRefs<T extends Object>(
    Expression<T> Function($$SubscriptionUsageLogsTableAnnotationComposer a) f,
  ) {
    final $$SubscriptionUsageLogsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.subscriptionUsageLogs,
          getReferencedColumn: (t) => t.subscriptionId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$SubscriptionUsageLogsTableAnnotationComposer(
                $db: $db,
                $table: $db.subscriptionUsageLogs,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> debtsRefs<T extends Object>(
    Expression<T> Function($$DebtsTableAnnotationComposer a) f,
  ) {
    final $$DebtsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.debts,
      getReferencedColumn: (t) => t.originatingSubscriptionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DebtsTableAnnotationComposer(
            $db: $db,
            $table: $db.debts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SubscriptionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SubscriptionsTable,
          Subscription,
          $$SubscriptionsTableFilterComposer,
          $$SubscriptionsTableOrderingComposer,
          $$SubscriptionsTableAnnotationComposer,
          $$SubscriptionsTableCreateCompanionBuilder,
          $$SubscriptionsTableUpdateCompanionBuilder,
          (Subscription, $$SubscriptionsTableReferences),
          Subscription,
          PrefetchHooks Function({
            bool playerId,
            bool sessionsRefs,
            bool subscriptionUsageLogsRefs,
            bool debtsRefs,
          })
        > {
  $$SubscriptionsTableTableManager(_$AppDatabase db, $SubscriptionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SubscriptionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SubscriptionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SubscriptionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> playerId = const Value.absent(),
                Value<int> totalMinutes = const Value.absent(),
                Value<int> remainingMinutes = const Value.absent(),
                Value<String> purchasedAt = const Value.absent(),
                Value<String> expiresAt = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String?> unpaidDebtId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SubscriptionsCompanion(
                id: id,
                playerId: playerId,
                totalMinutes: totalMinutes,
                remainingMinutes: remainingMinutes,
                purchasedAt: purchasedAt,
                expiresAt: expiresAt,
                status: status,
                unpaidDebtId: unpaidDebtId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String playerId,
                required int totalMinutes,
                required int remainingMinutes,
                required String purchasedAt,
                required String expiresAt,
                required String status,
                Value<String?> unpaidDebtId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SubscriptionsCompanion.insert(
                id: id,
                playerId: playerId,
                totalMinutes: totalMinutes,
                remainingMinutes: remainingMinutes,
                purchasedAt: purchasedAt,
                expiresAt: expiresAt,
                status: status,
                unpaidDebtId: unpaidDebtId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SubscriptionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                playerId = false,
                sessionsRefs = false,
                subscriptionUsageLogsRefs = false,
                debtsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (sessionsRefs) db.sessions,
                    if (subscriptionUsageLogsRefs) db.subscriptionUsageLogs,
                    if (debtsRefs) db.debts,
                  ],
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
                        if (playerId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.playerId,
                                    referencedTable:
                                        $$SubscriptionsTableReferences
                                            ._playerIdTable(db),
                                    referencedColumn:
                                        $$SubscriptionsTableReferences
                                            ._playerIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (sessionsRefs)
                        await $_getPrefetchedData<
                          Subscription,
                          $SubscriptionsTable,
                          Session
                        >(
                          currentTable: table,
                          referencedTable: $$SubscriptionsTableReferences
                              ._sessionsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$SubscriptionsTableReferences(
                                db,
                                table,
                                p0,
                              ).sessionsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.subscriptionId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (subscriptionUsageLogsRefs)
                        await $_getPrefetchedData<
                          Subscription,
                          $SubscriptionsTable,
                          SubscriptionUsageLog
                        >(
                          currentTable: table,
                          referencedTable: $$SubscriptionsTableReferences
                              ._subscriptionUsageLogsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$SubscriptionsTableReferences(
                                db,
                                table,
                                p0,
                              ).subscriptionUsageLogsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.subscriptionId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (debtsRefs)
                        await $_getPrefetchedData<
                          Subscription,
                          $SubscriptionsTable,
                          Debt
                        >(
                          currentTable: table,
                          referencedTable: $$SubscriptionsTableReferences
                              ._debtsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$SubscriptionsTableReferences(
                                db,
                                table,
                                p0,
                              ).debtsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.originatingSubscriptionId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$SubscriptionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SubscriptionsTable,
      Subscription,
      $$SubscriptionsTableFilterComposer,
      $$SubscriptionsTableOrderingComposer,
      $$SubscriptionsTableAnnotationComposer,
      $$SubscriptionsTableCreateCompanionBuilder,
      $$SubscriptionsTableUpdateCompanionBuilder,
      (Subscription, $$SubscriptionsTableReferences),
      Subscription,
      PrefetchHooks Function({
        bool playerId,
        bool sessionsRefs,
        bool subscriptionUsageLogsRefs,
        bool debtsRefs,
      })
    >;
typedef $$SessionsTableCreateCompanionBuilder =
    SessionsCompanion Function({
      required String id,
      required String playerId,
      required String entryType,
      Value<int?> reservedBlocks,
      required String checkInAt,
      Value<String?> checkOutAt,
      required String status,
      Value<String?> subscriptionId,
      required int calculatedCharge,
      required int finalCharge,
      required int discountAmount,
      Value<String?> discountReason,
      Value<int> rowid,
    });
typedef $$SessionsTableUpdateCompanionBuilder =
    SessionsCompanion Function({
      Value<String> id,
      Value<String> playerId,
      Value<String> entryType,
      Value<int?> reservedBlocks,
      Value<String> checkInAt,
      Value<String?> checkOutAt,
      Value<String> status,
      Value<String?> subscriptionId,
      Value<int> calculatedCharge,
      Value<int> finalCharge,
      Value<int> discountAmount,
      Value<String?> discountReason,
      Value<int> rowid,
    });

final class $$SessionsTableReferences
    extends BaseReferences<_$AppDatabase, $SessionsTable, Session> {
  $$SessionsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PlayersTable _playerIdTable(_$AppDatabase db) => db.players
      .createAlias($_aliasNameGenerator(db.sessions.playerId, db.players.id));

  $$PlayersTableProcessedTableManager get playerId {
    final $_column = $_itemColumn<String>('player_id')!;

    final manager = $$PlayersTableTableManager(
      $_db,
      $_db.players,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_playerIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $SubscriptionsTable _subscriptionIdTable(_$AppDatabase db) =>
      db.subscriptions.createAlias(
        $_aliasNameGenerator(db.sessions.subscriptionId, db.subscriptions.id),
      );

  $$SubscriptionsTableProcessedTableManager? get subscriptionId {
    final $_column = $_itemColumn<String>('subscription_id');
    if ($_column == null) return null;
    final manager = $$SubscriptionsTableTableManager(
      $_db,
      $_db.subscriptions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_subscriptionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<
    $SubscriptionUsageLogsTable,
    List<SubscriptionUsageLog>
  >
  _subscriptionUsageLogsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.subscriptionUsageLogs,
        aliasName: $_aliasNameGenerator(
          db.sessions.id,
          db.subscriptionUsageLogs.sessionId,
        ),
      );

  $$SubscriptionUsageLogsTableProcessedTableManager
  get subscriptionUsageLogsRefs {
    final manager = $$SubscriptionUsageLogsTableTableManager(
      $_db,
      $_db.subscriptionUsageLogs,
    ).filter((f) => f.sessionId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _subscriptionUsageLogsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$PaymentsTable, List<Payment>> _paymentsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.payments,
    aliasName: $_aliasNameGenerator(db.sessions.id, db.payments.sessionId),
  );

  $$PaymentsTableProcessedTableManager get paymentsRefs {
    final manager = $$PaymentsTableTableManager(
      $_db,
      $_db.payments,
    ).filter((f) => f.sessionId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_paymentsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$DebtsTable, List<Debt>> _debtsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.debts,
    aliasName: $_aliasNameGenerator(
      db.sessions.id,
      db.debts.originatingSessionId,
    ),
  );

  $$DebtsTableProcessedTableManager get debtsRefs {
    final manager = $$DebtsTableTableManager($_db, $_db.debts).filter(
      (f) => f.originatingSessionId.id.sqlEquals($_itemColumn<String>('id')!),
    );

    final cache = $_typedResult.readTableOrNull(_debtsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$SessionsTableFilterComposer
    extends Composer<_$AppDatabase, $SessionsTable> {
  $$SessionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entryType => $composableBuilder(
    column: $table.entryType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get reservedBlocks => $composableBuilder(
    column: $table.reservedBlocks,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get checkInAt => $composableBuilder(
    column: $table.checkInAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get checkOutAt => $composableBuilder(
    column: $table.checkOutAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get calculatedCharge => $composableBuilder(
    column: $table.calculatedCharge,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get finalCharge => $composableBuilder(
    column: $table.finalCharge,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get discountAmount => $composableBuilder(
    column: $table.discountAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get discountReason => $composableBuilder(
    column: $table.discountReason,
    builder: (column) => ColumnFilters(column),
  );

  $$PlayersTableFilterComposer get playerId {
    final $$PlayersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playerId,
      referencedTable: $db.players,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlayersTableFilterComposer(
            $db: $db,
            $table: $db.players,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SubscriptionsTableFilterComposer get subscriptionId {
    final $$SubscriptionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.subscriptionId,
      referencedTable: $db.subscriptions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubscriptionsTableFilterComposer(
            $db: $db,
            $table: $db.subscriptions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> subscriptionUsageLogsRefs(
    Expression<bool> Function($$SubscriptionUsageLogsTableFilterComposer f) f,
  ) {
    final $$SubscriptionUsageLogsTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.subscriptionUsageLogs,
          getReferencedColumn: (t) => t.sessionId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$SubscriptionUsageLogsTableFilterComposer(
                $db: $db,
                $table: $db.subscriptionUsageLogs,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> paymentsRefs(
    Expression<bool> Function($$PaymentsTableFilterComposer f) f,
  ) {
    final $$PaymentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.payments,
      getReferencedColumn: (t) => t.sessionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PaymentsTableFilterComposer(
            $db: $db,
            $table: $db.payments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> debtsRefs(
    Expression<bool> Function($$DebtsTableFilterComposer f) f,
  ) {
    final $$DebtsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.debts,
      getReferencedColumn: (t) => t.originatingSessionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DebtsTableFilterComposer(
            $db: $db,
            $table: $db.debts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SessionsTableOrderingComposer
    extends Composer<_$AppDatabase, $SessionsTable> {
  $$SessionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entryType => $composableBuilder(
    column: $table.entryType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get reservedBlocks => $composableBuilder(
    column: $table.reservedBlocks,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get checkInAt => $composableBuilder(
    column: $table.checkInAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get checkOutAt => $composableBuilder(
    column: $table.checkOutAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get calculatedCharge => $composableBuilder(
    column: $table.calculatedCharge,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get finalCharge => $composableBuilder(
    column: $table.finalCharge,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get discountAmount => $composableBuilder(
    column: $table.discountAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get discountReason => $composableBuilder(
    column: $table.discountReason,
    builder: (column) => ColumnOrderings(column),
  );

  $$PlayersTableOrderingComposer get playerId {
    final $$PlayersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playerId,
      referencedTable: $db.players,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlayersTableOrderingComposer(
            $db: $db,
            $table: $db.players,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SubscriptionsTableOrderingComposer get subscriptionId {
    final $$SubscriptionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.subscriptionId,
      referencedTable: $db.subscriptions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubscriptionsTableOrderingComposer(
            $db: $db,
            $table: $db.subscriptions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SessionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SessionsTable> {
  $$SessionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get entryType =>
      $composableBuilder(column: $table.entryType, builder: (column) => column);

  GeneratedColumn<int> get reservedBlocks => $composableBuilder(
    column: $table.reservedBlocks,
    builder: (column) => column,
  );

  GeneratedColumn<String> get checkInAt =>
      $composableBuilder(column: $table.checkInAt, builder: (column) => column);

  GeneratedColumn<String> get checkOutAt => $composableBuilder(
    column: $table.checkOutAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get calculatedCharge => $composableBuilder(
    column: $table.calculatedCharge,
    builder: (column) => column,
  );

  GeneratedColumn<int> get finalCharge => $composableBuilder(
    column: $table.finalCharge,
    builder: (column) => column,
  );

  GeneratedColumn<int> get discountAmount => $composableBuilder(
    column: $table.discountAmount,
    builder: (column) => column,
  );

  GeneratedColumn<String> get discountReason => $composableBuilder(
    column: $table.discountReason,
    builder: (column) => column,
  );

  $$PlayersTableAnnotationComposer get playerId {
    final $$PlayersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playerId,
      referencedTable: $db.players,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlayersTableAnnotationComposer(
            $db: $db,
            $table: $db.players,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SubscriptionsTableAnnotationComposer get subscriptionId {
    final $$SubscriptionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.subscriptionId,
      referencedTable: $db.subscriptions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubscriptionsTableAnnotationComposer(
            $db: $db,
            $table: $db.subscriptions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> subscriptionUsageLogsRefs<T extends Object>(
    Expression<T> Function($$SubscriptionUsageLogsTableAnnotationComposer a) f,
  ) {
    final $$SubscriptionUsageLogsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.subscriptionUsageLogs,
          getReferencedColumn: (t) => t.sessionId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$SubscriptionUsageLogsTableAnnotationComposer(
                $db: $db,
                $table: $db.subscriptionUsageLogs,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> paymentsRefs<T extends Object>(
    Expression<T> Function($$PaymentsTableAnnotationComposer a) f,
  ) {
    final $$PaymentsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.payments,
      getReferencedColumn: (t) => t.sessionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PaymentsTableAnnotationComposer(
            $db: $db,
            $table: $db.payments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> debtsRefs<T extends Object>(
    Expression<T> Function($$DebtsTableAnnotationComposer a) f,
  ) {
    final $$DebtsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.debts,
      getReferencedColumn: (t) => t.originatingSessionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DebtsTableAnnotationComposer(
            $db: $db,
            $table: $db.debts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SessionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SessionsTable,
          Session,
          $$SessionsTableFilterComposer,
          $$SessionsTableOrderingComposer,
          $$SessionsTableAnnotationComposer,
          $$SessionsTableCreateCompanionBuilder,
          $$SessionsTableUpdateCompanionBuilder,
          (Session, $$SessionsTableReferences),
          Session,
          PrefetchHooks Function({
            bool playerId,
            bool subscriptionId,
            bool subscriptionUsageLogsRefs,
            bool paymentsRefs,
            bool debtsRefs,
          })
        > {
  $$SessionsTableTableManager(_$AppDatabase db, $SessionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SessionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SessionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SessionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> playerId = const Value.absent(),
                Value<String> entryType = const Value.absent(),
                Value<int?> reservedBlocks = const Value.absent(),
                Value<String> checkInAt = const Value.absent(),
                Value<String?> checkOutAt = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String?> subscriptionId = const Value.absent(),
                Value<int> calculatedCharge = const Value.absent(),
                Value<int> finalCharge = const Value.absent(),
                Value<int> discountAmount = const Value.absent(),
                Value<String?> discountReason = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SessionsCompanion(
                id: id,
                playerId: playerId,
                entryType: entryType,
                reservedBlocks: reservedBlocks,
                checkInAt: checkInAt,
                checkOutAt: checkOutAt,
                status: status,
                subscriptionId: subscriptionId,
                calculatedCharge: calculatedCharge,
                finalCharge: finalCharge,
                discountAmount: discountAmount,
                discountReason: discountReason,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String playerId,
                required String entryType,
                Value<int?> reservedBlocks = const Value.absent(),
                required String checkInAt,
                Value<String?> checkOutAt = const Value.absent(),
                required String status,
                Value<String?> subscriptionId = const Value.absent(),
                required int calculatedCharge,
                required int finalCharge,
                required int discountAmount,
                Value<String?> discountReason = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SessionsCompanion.insert(
                id: id,
                playerId: playerId,
                entryType: entryType,
                reservedBlocks: reservedBlocks,
                checkInAt: checkInAt,
                checkOutAt: checkOutAt,
                status: status,
                subscriptionId: subscriptionId,
                calculatedCharge: calculatedCharge,
                finalCharge: finalCharge,
                discountAmount: discountAmount,
                discountReason: discountReason,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SessionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                playerId = false,
                subscriptionId = false,
                subscriptionUsageLogsRefs = false,
                paymentsRefs = false,
                debtsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (subscriptionUsageLogsRefs) db.subscriptionUsageLogs,
                    if (paymentsRefs) db.payments,
                    if (debtsRefs) db.debts,
                  ],
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
                        if (playerId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.playerId,
                                    referencedTable: $$SessionsTableReferences
                                        ._playerIdTable(db),
                                    referencedColumn: $$SessionsTableReferences
                                        ._playerIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (subscriptionId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.subscriptionId,
                                    referencedTable: $$SessionsTableReferences
                                        ._subscriptionIdTable(db),
                                    referencedColumn: $$SessionsTableReferences
                                        ._subscriptionIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (subscriptionUsageLogsRefs)
                        await $_getPrefetchedData<
                          Session,
                          $SessionsTable,
                          SubscriptionUsageLog
                        >(
                          currentTable: table,
                          referencedTable: $$SessionsTableReferences
                              ._subscriptionUsageLogsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$SessionsTableReferences(
                                db,
                                table,
                                p0,
                              ).subscriptionUsageLogsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.sessionId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (paymentsRefs)
                        await $_getPrefetchedData<
                          Session,
                          $SessionsTable,
                          Payment
                        >(
                          currentTable: table,
                          referencedTable: $$SessionsTableReferences
                              ._paymentsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$SessionsTableReferences(
                                db,
                                table,
                                p0,
                              ).paymentsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.sessionId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (debtsRefs)
                        await $_getPrefetchedData<
                          Session,
                          $SessionsTable,
                          Debt
                        >(
                          currentTable: table,
                          referencedTable: $$SessionsTableReferences
                              ._debtsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$SessionsTableReferences(
                                db,
                                table,
                                p0,
                              ).debtsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.originatingSessionId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$SessionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SessionsTable,
      Session,
      $$SessionsTableFilterComposer,
      $$SessionsTableOrderingComposer,
      $$SessionsTableAnnotationComposer,
      $$SessionsTableCreateCompanionBuilder,
      $$SessionsTableUpdateCompanionBuilder,
      (Session, $$SessionsTableReferences),
      Session,
      PrefetchHooks Function({
        bool playerId,
        bool subscriptionId,
        bool subscriptionUsageLogsRefs,
        bool paymentsRefs,
        bool debtsRefs,
      })
    >;
typedef $$SubscriptionUsageLogsTableCreateCompanionBuilder =
    SubscriptionUsageLogsCompanion Function({
      Value<int> id,
      required String subscriptionId,
      required String sessionId,
      required int minutesConsumed,
      required String createdAt,
    });
typedef $$SubscriptionUsageLogsTableUpdateCompanionBuilder =
    SubscriptionUsageLogsCompanion Function({
      Value<int> id,
      Value<String> subscriptionId,
      Value<String> sessionId,
      Value<int> minutesConsumed,
      Value<String> createdAt,
    });

final class $$SubscriptionUsageLogsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $SubscriptionUsageLogsTable,
          SubscriptionUsageLog
        > {
  $$SubscriptionUsageLogsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $SubscriptionsTable _subscriptionIdTable(_$AppDatabase db) =>
      db.subscriptions.createAlias(
        $_aliasNameGenerator(
          db.subscriptionUsageLogs.subscriptionId,
          db.subscriptions.id,
        ),
      );

  $$SubscriptionsTableProcessedTableManager get subscriptionId {
    final $_column = $_itemColumn<String>('subscription_id')!;

    final manager = $$SubscriptionsTableTableManager(
      $_db,
      $_db.subscriptions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_subscriptionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $SessionsTable _sessionIdTable(_$AppDatabase db) =>
      db.sessions.createAlias(
        $_aliasNameGenerator(
          db.subscriptionUsageLogs.sessionId,
          db.sessions.id,
        ),
      );

  $$SessionsTableProcessedTableManager get sessionId {
    final $_column = $_itemColumn<String>('session_id')!;

    final manager = $$SessionsTableTableManager(
      $_db,
      $_db.sessions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_sessionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$SubscriptionUsageLogsTableFilterComposer
    extends Composer<_$AppDatabase, $SubscriptionUsageLogsTable> {
  $$SubscriptionUsageLogsTableFilterComposer({
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

  ColumnFilters<int> get minutesConsumed => $composableBuilder(
    column: $table.minutesConsumed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$SubscriptionsTableFilterComposer get subscriptionId {
    final $$SubscriptionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.subscriptionId,
      referencedTable: $db.subscriptions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubscriptionsTableFilterComposer(
            $db: $db,
            $table: $db.subscriptions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SessionsTableFilterComposer get sessionId {
    final $$SessionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sessionId,
      referencedTable: $db.sessions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SessionsTableFilterComposer(
            $db: $db,
            $table: $db.sessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SubscriptionUsageLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $SubscriptionUsageLogsTable> {
  $$SubscriptionUsageLogsTableOrderingComposer({
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

  ColumnOrderings<int> get minutesConsumed => $composableBuilder(
    column: $table.minutesConsumed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$SubscriptionsTableOrderingComposer get subscriptionId {
    final $$SubscriptionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.subscriptionId,
      referencedTable: $db.subscriptions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubscriptionsTableOrderingComposer(
            $db: $db,
            $table: $db.subscriptions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SessionsTableOrderingComposer get sessionId {
    final $$SessionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sessionId,
      referencedTable: $db.sessions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SessionsTableOrderingComposer(
            $db: $db,
            $table: $db.sessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SubscriptionUsageLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SubscriptionUsageLogsTable> {
  $$SubscriptionUsageLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get minutesConsumed => $composableBuilder(
    column: $table.minutesConsumed,
    builder: (column) => column,
  );

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$SubscriptionsTableAnnotationComposer get subscriptionId {
    final $$SubscriptionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.subscriptionId,
      referencedTable: $db.subscriptions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubscriptionsTableAnnotationComposer(
            $db: $db,
            $table: $db.subscriptions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SessionsTableAnnotationComposer get sessionId {
    final $$SessionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sessionId,
      referencedTable: $db.sessions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SessionsTableAnnotationComposer(
            $db: $db,
            $table: $db.sessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SubscriptionUsageLogsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SubscriptionUsageLogsTable,
          SubscriptionUsageLog,
          $$SubscriptionUsageLogsTableFilterComposer,
          $$SubscriptionUsageLogsTableOrderingComposer,
          $$SubscriptionUsageLogsTableAnnotationComposer,
          $$SubscriptionUsageLogsTableCreateCompanionBuilder,
          $$SubscriptionUsageLogsTableUpdateCompanionBuilder,
          (SubscriptionUsageLog, $$SubscriptionUsageLogsTableReferences),
          SubscriptionUsageLog,
          PrefetchHooks Function({bool subscriptionId, bool sessionId})
        > {
  $$SubscriptionUsageLogsTableTableManager(
    _$AppDatabase db,
    $SubscriptionUsageLogsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SubscriptionUsageLogsTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$SubscriptionUsageLogsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$SubscriptionUsageLogsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> subscriptionId = const Value.absent(),
                Value<String> sessionId = const Value.absent(),
                Value<int> minutesConsumed = const Value.absent(),
                Value<String> createdAt = const Value.absent(),
              }) => SubscriptionUsageLogsCompanion(
                id: id,
                subscriptionId: subscriptionId,
                sessionId: sessionId,
                minutesConsumed: minutesConsumed,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String subscriptionId,
                required String sessionId,
                required int minutesConsumed,
                required String createdAt,
              }) => SubscriptionUsageLogsCompanion.insert(
                id: id,
                subscriptionId: subscriptionId,
                sessionId: sessionId,
                minutesConsumed: minutesConsumed,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SubscriptionUsageLogsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({subscriptionId = false, sessionId = false}) {
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
                    if (subscriptionId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.subscriptionId,
                                referencedTable:
                                    $$SubscriptionUsageLogsTableReferences
                                        ._subscriptionIdTable(db),
                                referencedColumn:
                                    $$SubscriptionUsageLogsTableReferences
                                        ._subscriptionIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (sessionId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.sessionId,
                                referencedTable:
                                    $$SubscriptionUsageLogsTableReferences
                                        ._sessionIdTable(db),
                                referencedColumn:
                                    $$SubscriptionUsageLogsTableReferences
                                        ._sessionIdTable(db)
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

typedef $$SubscriptionUsageLogsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SubscriptionUsageLogsTable,
      SubscriptionUsageLog,
      $$SubscriptionUsageLogsTableFilterComposer,
      $$SubscriptionUsageLogsTableOrderingComposer,
      $$SubscriptionUsageLogsTableAnnotationComposer,
      $$SubscriptionUsageLogsTableCreateCompanionBuilder,
      $$SubscriptionUsageLogsTableUpdateCompanionBuilder,
      (SubscriptionUsageLog, $$SubscriptionUsageLogsTableReferences),
      SubscriptionUsageLog,
      PrefetchHooks Function({bool subscriptionId, bool sessionId})
    >;
typedef $$ProductsTableCreateCompanionBuilder =
    ProductsCompanion Function({
      required String id,
      required String name,
      required String sku,
      required int unitPrice,
      required int currentStock,
      required bool isActive,
      Value<int> rowid,
    });
typedef $$ProductsTableUpdateCompanionBuilder =
    ProductsCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> sku,
      Value<int> unitPrice,
      Value<int> currentStock,
      Value<bool> isActive,
      Value<int> rowid,
    });

final class $$ProductsTableReferences
    extends BaseReferences<_$AppDatabase, $ProductsTable, Product> {
  $$ProductsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$SaleItemsTable, List<SaleItem>>
  _saleItemsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.saleItems,
    aliasName: $_aliasNameGenerator(db.products.id, db.saleItems.productId),
  );

  $$SaleItemsTableProcessedTableManager get saleItemsRefs {
    final manager = $$SaleItemsTableTableManager(
      $_db,
      $_db.saleItems,
    ).filter((f) => f.productId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_saleItemsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

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
    ).filter((f) => f.productId.id.sqlEquals($_itemColumn<String>('id')!));

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
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sku => $composableBuilder(
    column: $table.sku,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get unitPrice => $composableBuilder(
    column: $table.unitPrice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get currentStock => $composableBuilder(
    column: $table.currentStock,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> saleItemsRefs(
    Expression<bool> Function($$SaleItemsTableFilterComposer f) f,
  ) {
    final $$SaleItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.saleItems,
      getReferencedColumn: (t) => t.productId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SaleItemsTableFilterComposer(
            $db: $db,
            $table: $db.saleItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

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
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sku => $composableBuilder(
    column: $table.sku,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get unitPrice => $composableBuilder(
    column: $table.unitPrice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get currentStock => $composableBuilder(
    column: $table.currentStock,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
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
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get sku =>
      $composableBuilder(column: $table.sku, builder: (column) => column);

  GeneratedColumn<int> get unitPrice =>
      $composableBuilder(column: $table.unitPrice, builder: (column) => column);

  GeneratedColumn<int> get currentStock => $composableBuilder(
    column: $table.currentStock,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  Expression<T> saleItemsRefs<T extends Object>(
    Expression<T> Function($$SaleItemsTableAnnotationComposer a) f,
  ) {
    final $$SaleItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.saleItems,
      getReferencedColumn: (t) => t.productId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SaleItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.saleItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

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
          PrefetchHooks Function({
            bool saleItemsRefs,
            bool inventoryMovementsRefs,
          })
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
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> sku = const Value.absent(),
                Value<int> unitPrice = const Value.absent(),
                Value<int> currentStock = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProductsCompanion(
                id: id,
                name: name,
                sku: sku,
                unitPrice: unitPrice,
                currentStock: currentStock,
                isActive: isActive,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String sku,
                required int unitPrice,
                required int currentStock,
                required bool isActive,
                Value<int> rowid = const Value.absent(),
              }) => ProductsCompanion.insert(
                id: id,
                name: name,
                sku: sku,
                unitPrice: unitPrice,
                currentStock: currentStock,
                isActive: isActive,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ProductsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({saleItemsRefs = false, inventoryMovementsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (saleItemsRefs) db.saleItems,
                    if (inventoryMovementsRefs) db.inventoryMovements,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (saleItemsRefs)
                        await $_getPrefetchedData<
                          Product,
                          $ProductsTable,
                          SaleItem
                        >(
                          currentTable: table,
                          referencedTable: $$ProductsTableReferences
                              ._saleItemsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProductsTableReferences(
                                db,
                                table,
                                p0,
                              ).saleItemsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.productId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (inventoryMovementsRefs)
                        await $_getPrefetchedData<
                          Product,
                          $ProductsTable,
                          InventoryMovement
                        >(
                          currentTable: table,
                          referencedTable: $$ProductsTableReferences
                              ._inventoryMovementsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProductsTableReferences(
                                db,
                                table,
                                p0,
                              ).inventoryMovementsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.productId == item.id,
                              ),
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
      PrefetchHooks Function({bool saleItemsRefs, bool inventoryMovementsRefs})
    >;
typedef $$ProductSalesTableCreateCompanionBuilder =
    ProductSalesCompanion Function({
      required String id,
      Value<String?> playerId,
      required String soldAt,
      required int totalCharge,
      required String status,
      Value<int> rowid,
    });
typedef $$ProductSalesTableUpdateCompanionBuilder =
    ProductSalesCompanion Function({
      Value<String> id,
      Value<String?> playerId,
      Value<String> soldAt,
      Value<int> totalCharge,
      Value<String> status,
      Value<int> rowid,
    });

final class $$ProductSalesTableReferences
    extends BaseReferences<_$AppDatabase, $ProductSalesTable, ProductSale> {
  $$ProductSalesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PlayersTable _playerIdTable(_$AppDatabase db) =>
      db.players.createAlias(
        $_aliasNameGenerator(db.productSales.playerId, db.players.id),
      );

  $$PlayersTableProcessedTableManager? get playerId {
    final $_column = $_itemColumn<String>('player_id');
    if ($_column == null) return null;
    final manager = $$PlayersTableTableManager(
      $_db,
      $_db.players,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_playerIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$SaleItemsTable, List<SaleItem>>
  _saleItemsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.saleItems,
    aliasName: $_aliasNameGenerator(db.productSales.id, db.saleItems.saleId),
  );

  $$SaleItemsTableProcessedTableManager get saleItemsRefs {
    final manager = $$SaleItemsTableTableManager(
      $_db,
      $_db.saleItems,
    ).filter((f) => f.saleId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_saleItemsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$PaymentsTable, List<Payment>> _paymentsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.payments,
    aliasName: $_aliasNameGenerator(db.productSales.id, db.payments.saleId),
  );

  $$PaymentsTableProcessedTableManager get paymentsRefs {
    final manager = $$PaymentsTableTableManager(
      $_db,
      $_db.payments,
    ).filter((f) => f.saleId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_paymentsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$DebtsTable, List<Debt>> _debtsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.debts,
    aliasName: $_aliasNameGenerator(
      db.productSales.id,
      db.debts.originatingSaleId,
    ),
  );

  $$DebtsTableProcessedTableManager get debtsRefs {
    final manager = $$DebtsTableTableManager($_db, $_db.debts).filter(
      (f) => f.originatingSaleId.id.sqlEquals($_itemColumn<String>('id')!),
    );

    final cache = $_typedResult.readTableOrNull(_debtsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$InventoryMovementsTable, List<InventoryMovement>>
  _inventoryMovementsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.inventoryMovements,
        aliasName: $_aliasNameGenerator(
          db.productSales.id,
          db.inventoryMovements.associatedSaleId,
        ),
      );

  $$InventoryMovementsTableProcessedTableManager get inventoryMovementsRefs {
    final manager =
        $$InventoryMovementsTableTableManager(
          $_db,
          $_db.inventoryMovements,
        ).filter(
          (f) => f.associatedSaleId.id.sqlEquals($_itemColumn<String>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _inventoryMovementsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ProductSalesTableFilterComposer
    extends Composer<_$AppDatabase, $ProductSalesTable> {
  $$ProductSalesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get soldAt => $composableBuilder(
    column: $table.soldAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalCharge => $composableBuilder(
    column: $table.totalCharge,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  $$PlayersTableFilterComposer get playerId {
    final $$PlayersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playerId,
      referencedTable: $db.players,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlayersTableFilterComposer(
            $db: $db,
            $table: $db.players,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> saleItemsRefs(
    Expression<bool> Function($$SaleItemsTableFilterComposer f) f,
  ) {
    final $$SaleItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.saleItems,
      getReferencedColumn: (t) => t.saleId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SaleItemsTableFilterComposer(
            $db: $db,
            $table: $db.saleItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> paymentsRefs(
    Expression<bool> Function($$PaymentsTableFilterComposer f) f,
  ) {
    final $$PaymentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.payments,
      getReferencedColumn: (t) => t.saleId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PaymentsTableFilterComposer(
            $db: $db,
            $table: $db.payments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> debtsRefs(
    Expression<bool> Function($$DebtsTableFilterComposer f) f,
  ) {
    final $$DebtsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.debts,
      getReferencedColumn: (t) => t.originatingSaleId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DebtsTableFilterComposer(
            $db: $db,
            $table: $db.debts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> inventoryMovementsRefs(
    Expression<bool> Function($$InventoryMovementsTableFilterComposer f) f,
  ) {
    final $$InventoryMovementsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.inventoryMovements,
      getReferencedColumn: (t) => t.associatedSaleId,
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

class $$ProductSalesTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductSalesTable> {
  $$ProductSalesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get soldAt => $composableBuilder(
    column: $table.soldAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalCharge => $composableBuilder(
    column: $table.totalCharge,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  $$PlayersTableOrderingComposer get playerId {
    final $$PlayersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playerId,
      referencedTable: $db.players,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlayersTableOrderingComposer(
            $db: $db,
            $table: $db.players,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProductSalesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductSalesTable> {
  $$ProductSalesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get soldAt =>
      $composableBuilder(column: $table.soldAt, builder: (column) => column);

  GeneratedColumn<int> get totalCharge => $composableBuilder(
    column: $table.totalCharge,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  $$PlayersTableAnnotationComposer get playerId {
    final $$PlayersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playerId,
      referencedTable: $db.players,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlayersTableAnnotationComposer(
            $db: $db,
            $table: $db.players,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> saleItemsRefs<T extends Object>(
    Expression<T> Function($$SaleItemsTableAnnotationComposer a) f,
  ) {
    final $$SaleItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.saleItems,
      getReferencedColumn: (t) => t.saleId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SaleItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.saleItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> paymentsRefs<T extends Object>(
    Expression<T> Function($$PaymentsTableAnnotationComposer a) f,
  ) {
    final $$PaymentsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.payments,
      getReferencedColumn: (t) => t.saleId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PaymentsTableAnnotationComposer(
            $db: $db,
            $table: $db.payments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> debtsRefs<T extends Object>(
    Expression<T> Function($$DebtsTableAnnotationComposer a) f,
  ) {
    final $$DebtsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.debts,
      getReferencedColumn: (t) => t.originatingSaleId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DebtsTableAnnotationComposer(
            $db: $db,
            $table: $db.debts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> inventoryMovementsRefs<T extends Object>(
    Expression<T> Function($$InventoryMovementsTableAnnotationComposer a) f,
  ) {
    final $$InventoryMovementsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.inventoryMovements,
          getReferencedColumn: (t) => t.associatedSaleId,
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

class $$ProductSalesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProductSalesTable,
          ProductSale,
          $$ProductSalesTableFilterComposer,
          $$ProductSalesTableOrderingComposer,
          $$ProductSalesTableAnnotationComposer,
          $$ProductSalesTableCreateCompanionBuilder,
          $$ProductSalesTableUpdateCompanionBuilder,
          (ProductSale, $$ProductSalesTableReferences),
          ProductSale,
          PrefetchHooks Function({
            bool playerId,
            bool saleItemsRefs,
            bool paymentsRefs,
            bool debtsRefs,
            bool inventoryMovementsRefs,
          })
        > {
  $$ProductSalesTableTableManager(_$AppDatabase db, $ProductSalesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductSalesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductSalesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductSalesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> playerId = const Value.absent(),
                Value<String> soldAt = const Value.absent(),
                Value<int> totalCharge = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProductSalesCompanion(
                id: id,
                playerId: playerId,
                soldAt: soldAt,
                totalCharge: totalCharge,
                status: status,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String?> playerId = const Value.absent(),
                required String soldAt,
                required int totalCharge,
                required String status,
                Value<int> rowid = const Value.absent(),
              }) => ProductSalesCompanion.insert(
                id: id,
                playerId: playerId,
                soldAt: soldAt,
                totalCharge: totalCharge,
                status: status,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ProductSalesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                playerId = false,
                saleItemsRefs = false,
                paymentsRefs = false,
                debtsRefs = false,
                inventoryMovementsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (saleItemsRefs) db.saleItems,
                    if (paymentsRefs) db.payments,
                    if (debtsRefs) db.debts,
                    if (inventoryMovementsRefs) db.inventoryMovements,
                  ],
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
                        if (playerId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.playerId,
                                    referencedTable:
                                        $$ProductSalesTableReferences
                                            ._playerIdTable(db),
                                    referencedColumn:
                                        $$ProductSalesTableReferences
                                            ._playerIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (saleItemsRefs)
                        await $_getPrefetchedData<
                          ProductSale,
                          $ProductSalesTable,
                          SaleItem
                        >(
                          currentTable: table,
                          referencedTable: $$ProductSalesTableReferences
                              ._saleItemsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProductSalesTableReferences(
                                db,
                                table,
                                p0,
                              ).saleItemsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.saleId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (paymentsRefs)
                        await $_getPrefetchedData<
                          ProductSale,
                          $ProductSalesTable,
                          Payment
                        >(
                          currentTable: table,
                          referencedTable: $$ProductSalesTableReferences
                              ._paymentsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProductSalesTableReferences(
                                db,
                                table,
                                p0,
                              ).paymentsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.saleId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (debtsRefs)
                        await $_getPrefetchedData<
                          ProductSale,
                          $ProductSalesTable,
                          Debt
                        >(
                          currentTable: table,
                          referencedTable: $$ProductSalesTableReferences
                              ._debtsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProductSalesTableReferences(
                                db,
                                table,
                                p0,
                              ).debtsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.originatingSaleId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (inventoryMovementsRefs)
                        await $_getPrefetchedData<
                          ProductSale,
                          $ProductSalesTable,
                          InventoryMovement
                        >(
                          currentTable: table,
                          referencedTable: $$ProductSalesTableReferences
                              ._inventoryMovementsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProductSalesTableReferences(
                                db,
                                table,
                                p0,
                              ).inventoryMovementsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.associatedSaleId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ProductSalesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProductSalesTable,
      ProductSale,
      $$ProductSalesTableFilterComposer,
      $$ProductSalesTableOrderingComposer,
      $$ProductSalesTableAnnotationComposer,
      $$ProductSalesTableCreateCompanionBuilder,
      $$ProductSalesTableUpdateCompanionBuilder,
      (ProductSale, $$ProductSalesTableReferences),
      ProductSale,
      PrefetchHooks Function({
        bool playerId,
        bool saleItemsRefs,
        bool paymentsRefs,
        bool debtsRefs,
        bool inventoryMovementsRefs,
      })
    >;
typedef $$SaleItemsTableCreateCompanionBuilder =
    SaleItemsCompanion Function({
      Value<int> id,
      required String saleId,
      required String productId,
      required String productNameSnapshot,
      required int quantity,
      required int unitPriceSnapshot,
    });
typedef $$SaleItemsTableUpdateCompanionBuilder =
    SaleItemsCompanion Function({
      Value<int> id,
      Value<String> saleId,
      Value<String> productId,
      Value<String> productNameSnapshot,
      Value<int> quantity,
      Value<int> unitPriceSnapshot,
    });

final class $$SaleItemsTableReferences
    extends BaseReferences<_$AppDatabase, $SaleItemsTable, SaleItem> {
  $$SaleItemsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ProductSalesTable _saleIdTable(_$AppDatabase db) =>
      db.productSales.createAlias(
        $_aliasNameGenerator(db.saleItems.saleId, db.productSales.id),
      );

  $$ProductSalesTableProcessedTableManager get saleId {
    final $_column = $_itemColumn<String>('sale_id')!;

    final manager = $$ProductSalesTableTableManager(
      $_db,
      $_db.productSales,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_saleIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ProductsTable _productIdTable(_$AppDatabase db) =>
      db.products.createAlias(
        $_aliasNameGenerator(db.saleItems.productId, db.products.id),
      );

  $$ProductsTableProcessedTableManager get productId {
    final $_column = $_itemColumn<String>('product_id')!;

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

class $$SaleItemsTableFilterComposer
    extends Composer<_$AppDatabase, $SaleItemsTable> {
  $$SaleItemsTableFilterComposer({
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

  ColumnFilters<String> get productNameSnapshot => $composableBuilder(
    column: $table.productNameSnapshot,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get unitPriceSnapshot => $composableBuilder(
    column: $table.unitPriceSnapshot,
    builder: (column) => ColumnFilters(column),
  );

  $$ProductSalesTableFilterComposer get saleId {
    final $$ProductSalesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.saleId,
      referencedTable: $db.productSales,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductSalesTableFilterComposer(
            $db: $db,
            $table: $db.productSales,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

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

class $$SaleItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $SaleItemsTable> {
  $$SaleItemsTableOrderingComposer({
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

  ColumnOrderings<String> get productNameSnapshot => $composableBuilder(
    column: $table.productNameSnapshot,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get unitPriceSnapshot => $composableBuilder(
    column: $table.unitPriceSnapshot,
    builder: (column) => ColumnOrderings(column),
  );

  $$ProductSalesTableOrderingComposer get saleId {
    final $$ProductSalesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.saleId,
      referencedTable: $db.productSales,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductSalesTableOrderingComposer(
            $db: $db,
            $table: $db.productSales,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

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

class $$SaleItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SaleItemsTable> {
  $$SaleItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get productNameSnapshot => $composableBuilder(
    column: $table.productNameSnapshot,
    builder: (column) => column,
  );

  GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<int> get unitPriceSnapshot => $composableBuilder(
    column: $table.unitPriceSnapshot,
    builder: (column) => column,
  );

  $$ProductSalesTableAnnotationComposer get saleId {
    final $$ProductSalesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.saleId,
      referencedTable: $db.productSales,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductSalesTableAnnotationComposer(
            $db: $db,
            $table: $db.productSales,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

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

class $$SaleItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SaleItemsTable,
          SaleItem,
          $$SaleItemsTableFilterComposer,
          $$SaleItemsTableOrderingComposer,
          $$SaleItemsTableAnnotationComposer,
          $$SaleItemsTableCreateCompanionBuilder,
          $$SaleItemsTableUpdateCompanionBuilder,
          (SaleItem, $$SaleItemsTableReferences),
          SaleItem,
          PrefetchHooks Function({bool saleId, bool productId})
        > {
  $$SaleItemsTableTableManager(_$AppDatabase db, $SaleItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SaleItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SaleItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SaleItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> saleId = const Value.absent(),
                Value<String> productId = const Value.absent(),
                Value<String> productNameSnapshot = const Value.absent(),
                Value<int> quantity = const Value.absent(),
                Value<int> unitPriceSnapshot = const Value.absent(),
              }) => SaleItemsCompanion(
                id: id,
                saleId: saleId,
                productId: productId,
                productNameSnapshot: productNameSnapshot,
                quantity: quantity,
                unitPriceSnapshot: unitPriceSnapshot,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String saleId,
                required String productId,
                required String productNameSnapshot,
                required int quantity,
                required int unitPriceSnapshot,
              }) => SaleItemsCompanion.insert(
                id: id,
                saleId: saleId,
                productId: productId,
                productNameSnapshot: productNameSnapshot,
                quantity: quantity,
                unitPriceSnapshot: unitPriceSnapshot,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SaleItemsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({saleId = false, productId = false}) {
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
                    if (saleId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.saleId,
                                referencedTable: $$SaleItemsTableReferences
                                    ._saleIdTable(db),
                                referencedColumn: $$SaleItemsTableReferences
                                    ._saleIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (productId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.productId,
                                referencedTable: $$SaleItemsTableReferences
                                    ._productIdTable(db),
                                referencedColumn: $$SaleItemsTableReferences
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

typedef $$SaleItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SaleItemsTable,
      SaleItem,
      $$SaleItemsTableFilterComposer,
      $$SaleItemsTableOrderingComposer,
      $$SaleItemsTableAnnotationComposer,
      $$SaleItemsTableCreateCompanionBuilder,
      $$SaleItemsTableUpdateCompanionBuilder,
      (SaleItem, $$SaleItemsTableReferences),
      SaleItem,
      PrefetchHooks Function({bool saleId, bool productId})
    >;
typedef $$PaymentsTableCreateCompanionBuilder =
    PaymentsCompanion Function({
      required String id,
      required String paymentGroupId,
      Value<String?> playerId,
      required String paymentMethod,
      required int amountPaid,
      required int tipAmount,
      required String status,
      required String createdAt,
      Value<String?> sessionId,
      Value<String?> saleId,
      Value<int> rowid,
    });
typedef $$PaymentsTableUpdateCompanionBuilder =
    PaymentsCompanion Function({
      Value<String> id,
      Value<String> paymentGroupId,
      Value<String?> playerId,
      Value<String> paymentMethod,
      Value<int> amountPaid,
      Value<int> tipAmount,
      Value<String> status,
      Value<String> createdAt,
      Value<String?> sessionId,
      Value<String?> saleId,
      Value<int> rowid,
    });

final class $$PaymentsTableReferences
    extends BaseReferences<_$AppDatabase, $PaymentsTable, Payment> {
  $$PaymentsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PlayersTable _playerIdTable(_$AppDatabase db) => db.players
      .createAlias($_aliasNameGenerator(db.payments.playerId, db.players.id));

  $$PlayersTableProcessedTableManager? get playerId {
    final $_column = $_itemColumn<String>('player_id');
    if ($_column == null) return null;
    final manager = $$PlayersTableTableManager(
      $_db,
      $_db.players,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_playerIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $SessionsTable _sessionIdTable(_$AppDatabase db) => db.sessions
      .createAlias($_aliasNameGenerator(db.payments.sessionId, db.sessions.id));

  $$SessionsTableProcessedTableManager? get sessionId {
    final $_column = $_itemColumn<String>('session_id');
    if ($_column == null) return null;
    final manager = $$SessionsTableTableManager(
      $_db,
      $_db.sessions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_sessionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ProductSalesTable _saleIdTable(_$AppDatabase db) =>
      db.productSales.createAlias(
        $_aliasNameGenerator(db.payments.saleId, db.productSales.id),
      );

  $$ProductSalesTableProcessedTableManager? get saleId {
    final $_column = $_itemColumn<String>('sale_id');
    if ($_column == null) return null;
    final manager = $$ProductSalesTableTableManager(
      $_db,
      $_db.productSales,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_saleIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$DebtPaymentsTable, List<DebtPayment>>
  _debtPaymentsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.debtPayments,
    aliasName: $_aliasNameGenerator(db.payments.id, db.debtPayments.paymentId),
  );

  $$DebtPaymentsTableProcessedTableManager get debtPaymentsRefs {
    final manager = $$DebtPaymentsTableTableManager(
      $_db,
      $_db.debtPayments,
    ).filter((f) => f.paymentId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_debtPaymentsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$PaymentsTableFilterComposer
    extends Composer<_$AppDatabase, $PaymentsTable> {
  $$PaymentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get paymentGroupId => $composableBuilder(
    column: $table.paymentGroupId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get paymentMethod => $composableBuilder(
    column: $table.paymentMethod,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get amountPaid => $composableBuilder(
    column: $table.amountPaid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get tipAmount => $composableBuilder(
    column: $table.tipAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$PlayersTableFilterComposer get playerId {
    final $$PlayersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playerId,
      referencedTable: $db.players,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlayersTableFilterComposer(
            $db: $db,
            $table: $db.players,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SessionsTableFilterComposer get sessionId {
    final $$SessionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sessionId,
      referencedTable: $db.sessions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SessionsTableFilterComposer(
            $db: $db,
            $table: $db.sessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProductSalesTableFilterComposer get saleId {
    final $$ProductSalesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.saleId,
      referencedTable: $db.productSales,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductSalesTableFilterComposer(
            $db: $db,
            $table: $db.productSales,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> debtPaymentsRefs(
    Expression<bool> Function($$DebtPaymentsTableFilterComposer f) f,
  ) {
    final $$DebtPaymentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.debtPayments,
      getReferencedColumn: (t) => t.paymentId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DebtPaymentsTableFilterComposer(
            $db: $db,
            $table: $db.debtPayments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PaymentsTableOrderingComposer
    extends Composer<_$AppDatabase, $PaymentsTable> {
  $$PaymentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get paymentGroupId => $composableBuilder(
    column: $table.paymentGroupId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get paymentMethod => $composableBuilder(
    column: $table.paymentMethod,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get amountPaid => $composableBuilder(
    column: $table.amountPaid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get tipAmount => $composableBuilder(
    column: $table.tipAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$PlayersTableOrderingComposer get playerId {
    final $$PlayersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playerId,
      referencedTable: $db.players,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlayersTableOrderingComposer(
            $db: $db,
            $table: $db.players,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SessionsTableOrderingComposer get sessionId {
    final $$SessionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sessionId,
      referencedTable: $db.sessions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SessionsTableOrderingComposer(
            $db: $db,
            $table: $db.sessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProductSalesTableOrderingComposer get saleId {
    final $$ProductSalesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.saleId,
      referencedTable: $db.productSales,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductSalesTableOrderingComposer(
            $db: $db,
            $table: $db.productSales,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PaymentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PaymentsTable> {
  $$PaymentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get paymentGroupId => $composableBuilder(
    column: $table.paymentGroupId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get paymentMethod => $composableBuilder(
    column: $table.paymentMethod,
    builder: (column) => column,
  );

  GeneratedColumn<int> get amountPaid => $composableBuilder(
    column: $table.amountPaid,
    builder: (column) => column,
  );

  GeneratedColumn<int> get tipAmount =>
      $composableBuilder(column: $table.tipAmount, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$PlayersTableAnnotationComposer get playerId {
    final $$PlayersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playerId,
      referencedTable: $db.players,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlayersTableAnnotationComposer(
            $db: $db,
            $table: $db.players,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SessionsTableAnnotationComposer get sessionId {
    final $$SessionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sessionId,
      referencedTable: $db.sessions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SessionsTableAnnotationComposer(
            $db: $db,
            $table: $db.sessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProductSalesTableAnnotationComposer get saleId {
    final $$ProductSalesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.saleId,
      referencedTable: $db.productSales,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductSalesTableAnnotationComposer(
            $db: $db,
            $table: $db.productSales,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> debtPaymentsRefs<T extends Object>(
    Expression<T> Function($$DebtPaymentsTableAnnotationComposer a) f,
  ) {
    final $$DebtPaymentsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.debtPayments,
      getReferencedColumn: (t) => t.paymentId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DebtPaymentsTableAnnotationComposer(
            $db: $db,
            $table: $db.debtPayments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PaymentsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PaymentsTable,
          Payment,
          $$PaymentsTableFilterComposer,
          $$PaymentsTableOrderingComposer,
          $$PaymentsTableAnnotationComposer,
          $$PaymentsTableCreateCompanionBuilder,
          $$PaymentsTableUpdateCompanionBuilder,
          (Payment, $$PaymentsTableReferences),
          Payment,
          PrefetchHooks Function({
            bool playerId,
            bool sessionId,
            bool saleId,
            bool debtPaymentsRefs,
          })
        > {
  $$PaymentsTableTableManager(_$AppDatabase db, $PaymentsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PaymentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PaymentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PaymentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> paymentGroupId = const Value.absent(),
                Value<String?> playerId = const Value.absent(),
                Value<String> paymentMethod = const Value.absent(),
                Value<int> amountPaid = const Value.absent(),
                Value<int> tipAmount = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String> createdAt = const Value.absent(),
                Value<String?> sessionId = const Value.absent(),
                Value<String?> saleId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PaymentsCompanion(
                id: id,
                paymentGroupId: paymentGroupId,
                playerId: playerId,
                paymentMethod: paymentMethod,
                amountPaid: amountPaid,
                tipAmount: tipAmount,
                status: status,
                createdAt: createdAt,
                sessionId: sessionId,
                saleId: saleId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String paymentGroupId,
                Value<String?> playerId = const Value.absent(),
                required String paymentMethod,
                required int amountPaid,
                required int tipAmount,
                required String status,
                required String createdAt,
                Value<String?> sessionId = const Value.absent(),
                Value<String?> saleId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PaymentsCompanion.insert(
                id: id,
                paymentGroupId: paymentGroupId,
                playerId: playerId,
                paymentMethod: paymentMethod,
                amountPaid: amountPaid,
                tipAmount: tipAmount,
                status: status,
                createdAt: createdAt,
                sessionId: sessionId,
                saleId: saleId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PaymentsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                playerId = false,
                sessionId = false,
                saleId = false,
                debtPaymentsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (debtPaymentsRefs) db.debtPayments,
                  ],
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
                        if (playerId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.playerId,
                                    referencedTable: $$PaymentsTableReferences
                                        ._playerIdTable(db),
                                    referencedColumn: $$PaymentsTableReferences
                                        ._playerIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (sessionId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.sessionId,
                                    referencedTable: $$PaymentsTableReferences
                                        ._sessionIdTable(db),
                                    referencedColumn: $$PaymentsTableReferences
                                        ._sessionIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (saleId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.saleId,
                                    referencedTable: $$PaymentsTableReferences
                                        ._saleIdTable(db),
                                    referencedColumn: $$PaymentsTableReferences
                                        ._saleIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (debtPaymentsRefs)
                        await $_getPrefetchedData<
                          Payment,
                          $PaymentsTable,
                          DebtPayment
                        >(
                          currentTable: table,
                          referencedTable: $$PaymentsTableReferences
                              ._debtPaymentsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PaymentsTableReferences(
                                db,
                                table,
                                p0,
                              ).debtPaymentsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.paymentId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$PaymentsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PaymentsTable,
      Payment,
      $$PaymentsTableFilterComposer,
      $$PaymentsTableOrderingComposer,
      $$PaymentsTableAnnotationComposer,
      $$PaymentsTableCreateCompanionBuilder,
      $$PaymentsTableUpdateCompanionBuilder,
      (Payment, $$PaymentsTableReferences),
      Payment,
      PrefetchHooks Function({
        bool playerId,
        bool sessionId,
        bool saleId,
        bool debtPaymentsRefs,
      })
    >;
typedef $$DebtsTableCreateCompanionBuilder =
    DebtsCompanion Function({
      required String id,
      required String playerId,
      required int originalAmount,
      required int remainingAmount,
      required String createdAt,
      required String status,
      Value<String?> originatingSessionId,
      Value<String?> originatingSaleId,
      Value<String?> originatingSubscriptionId,
      Value<int> rowid,
    });
typedef $$DebtsTableUpdateCompanionBuilder =
    DebtsCompanion Function({
      Value<String> id,
      Value<String> playerId,
      Value<int> originalAmount,
      Value<int> remainingAmount,
      Value<String> createdAt,
      Value<String> status,
      Value<String?> originatingSessionId,
      Value<String?> originatingSaleId,
      Value<String?> originatingSubscriptionId,
      Value<int> rowid,
    });

final class $$DebtsTableReferences
    extends BaseReferences<_$AppDatabase, $DebtsTable, Debt> {
  $$DebtsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PlayersTable _playerIdTable(_$AppDatabase db) => db.players
      .createAlias($_aliasNameGenerator(db.debts.playerId, db.players.id));

  $$PlayersTableProcessedTableManager get playerId {
    final $_column = $_itemColumn<String>('player_id')!;

    final manager = $$PlayersTableTableManager(
      $_db,
      $_db.players,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_playerIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $SessionsTable _originatingSessionIdTable(_$AppDatabase db) =>
      db.sessions.createAlias(
        $_aliasNameGenerator(db.debts.originatingSessionId, db.sessions.id),
      );

  $$SessionsTableProcessedTableManager? get originatingSessionId {
    final $_column = $_itemColumn<String>('originating_session_id');
    if ($_column == null) return null;
    final manager = $$SessionsTableTableManager(
      $_db,
      $_db.sessions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(
      _originatingSessionIdTable($_db),
    );
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ProductSalesTable _originatingSaleIdTable(_$AppDatabase db) =>
      db.productSales.createAlias(
        $_aliasNameGenerator(db.debts.originatingSaleId, db.productSales.id),
      );

  $$ProductSalesTableProcessedTableManager? get originatingSaleId {
    final $_column = $_itemColumn<String>('originating_sale_id');
    if ($_column == null) return null;
    final manager = $$ProductSalesTableTableManager(
      $_db,
      $_db.productSales,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_originatingSaleIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $SubscriptionsTable _originatingSubscriptionIdTable(
    _$AppDatabase db,
  ) => db.subscriptions.createAlias(
    $_aliasNameGenerator(
      db.debts.originatingSubscriptionId,
      db.subscriptions.id,
    ),
  );

  $$SubscriptionsTableProcessedTableManager? get originatingSubscriptionId {
    final $_column = $_itemColumn<String>('originating_subscription_id');
    if ($_column == null) return null;
    final manager = $$SubscriptionsTableTableManager(
      $_db,
      $_db.subscriptions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(
      _originatingSubscriptionIdTable($_db),
    );
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$DebtPaymentsTable, List<DebtPayment>>
  _debtPaymentsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.debtPayments,
    aliasName: $_aliasNameGenerator(db.debts.id, db.debtPayments.debtId),
  );

  $$DebtPaymentsTableProcessedTableManager get debtPaymentsRefs {
    final manager = $$DebtPaymentsTableTableManager(
      $_db,
      $_db.debtPayments,
    ).filter((f) => f.debtId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_debtPaymentsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$DebtsTableFilterComposer extends Composer<_$AppDatabase, $DebtsTable> {
  $$DebtsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get originalAmount => $composableBuilder(
    column: $table.originalAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get remainingAmount => $composableBuilder(
    column: $table.remainingAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  $$PlayersTableFilterComposer get playerId {
    final $$PlayersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playerId,
      referencedTable: $db.players,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlayersTableFilterComposer(
            $db: $db,
            $table: $db.players,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SessionsTableFilterComposer get originatingSessionId {
    final $$SessionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.originatingSessionId,
      referencedTable: $db.sessions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SessionsTableFilterComposer(
            $db: $db,
            $table: $db.sessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProductSalesTableFilterComposer get originatingSaleId {
    final $$ProductSalesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.originatingSaleId,
      referencedTable: $db.productSales,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductSalesTableFilterComposer(
            $db: $db,
            $table: $db.productSales,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SubscriptionsTableFilterComposer get originatingSubscriptionId {
    final $$SubscriptionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.originatingSubscriptionId,
      referencedTable: $db.subscriptions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubscriptionsTableFilterComposer(
            $db: $db,
            $table: $db.subscriptions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> debtPaymentsRefs(
    Expression<bool> Function($$DebtPaymentsTableFilterComposer f) f,
  ) {
    final $$DebtPaymentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.debtPayments,
      getReferencedColumn: (t) => t.debtId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DebtPaymentsTableFilterComposer(
            $db: $db,
            $table: $db.debtPayments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DebtsTableOrderingComposer
    extends Composer<_$AppDatabase, $DebtsTable> {
  $$DebtsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get originalAmount => $composableBuilder(
    column: $table.originalAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get remainingAmount => $composableBuilder(
    column: $table.remainingAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  $$PlayersTableOrderingComposer get playerId {
    final $$PlayersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playerId,
      referencedTable: $db.players,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlayersTableOrderingComposer(
            $db: $db,
            $table: $db.players,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SessionsTableOrderingComposer get originatingSessionId {
    final $$SessionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.originatingSessionId,
      referencedTable: $db.sessions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SessionsTableOrderingComposer(
            $db: $db,
            $table: $db.sessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProductSalesTableOrderingComposer get originatingSaleId {
    final $$ProductSalesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.originatingSaleId,
      referencedTable: $db.productSales,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductSalesTableOrderingComposer(
            $db: $db,
            $table: $db.productSales,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SubscriptionsTableOrderingComposer get originatingSubscriptionId {
    final $$SubscriptionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.originatingSubscriptionId,
      referencedTable: $db.subscriptions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubscriptionsTableOrderingComposer(
            $db: $db,
            $table: $db.subscriptions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DebtsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DebtsTable> {
  $$DebtsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get originalAmount => $composableBuilder(
    column: $table.originalAmount,
    builder: (column) => column,
  );

  GeneratedColumn<int> get remainingAmount => $composableBuilder(
    column: $table.remainingAmount,
    builder: (column) => column,
  );

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  $$PlayersTableAnnotationComposer get playerId {
    final $$PlayersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playerId,
      referencedTable: $db.players,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlayersTableAnnotationComposer(
            $db: $db,
            $table: $db.players,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SessionsTableAnnotationComposer get originatingSessionId {
    final $$SessionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.originatingSessionId,
      referencedTable: $db.sessions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SessionsTableAnnotationComposer(
            $db: $db,
            $table: $db.sessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProductSalesTableAnnotationComposer get originatingSaleId {
    final $$ProductSalesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.originatingSaleId,
      referencedTable: $db.productSales,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductSalesTableAnnotationComposer(
            $db: $db,
            $table: $db.productSales,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SubscriptionsTableAnnotationComposer get originatingSubscriptionId {
    final $$SubscriptionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.originatingSubscriptionId,
      referencedTable: $db.subscriptions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubscriptionsTableAnnotationComposer(
            $db: $db,
            $table: $db.subscriptions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> debtPaymentsRefs<T extends Object>(
    Expression<T> Function($$DebtPaymentsTableAnnotationComposer a) f,
  ) {
    final $$DebtPaymentsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.debtPayments,
      getReferencedColumn: (t) => t.debtId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DebtPaymentsTableAnnotationComposer(
            $db: $db,
            $table: $db.debtPayments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DebtsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DebtsTable,
          Debt,
          $$DebtsTableFilterComposer,
          $$DebtsTableOrderingComposer,
          $$DebtsTableAnnotationComposer,
          $$DebtsTableCreateCompanionBuilder,
          $$DebtsTableUpdateCompanionBuilder,
          (Debt, $$DebtsTableReferences),
          Debt,
          PrefetchHooks Function({
            bool playerId,
            bool originatingSessionId,
            bool originatingSaleId,
            bool originatingSubscriptionId,
            bool debtPaymentsRefs,
          })
        > {
  $$DebtsTableTableManager(_$AppDatabase db, $DebtsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DebtsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DebtsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DebtsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> playerId = const Value.absent(),
                Value<int> originalAmount = const Value.absent(),
                Value<int> remainingAmount = const Value.absent(),
                Value<String> createdAt = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String?> originatingSessionId = const Value.absent(),
                Value<String?> originatingSaleId = const Value.absent(),
                Value<String?> originatingSubscriptionId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DebtsCompanion(
                id: id,
                playerId: playerId,
                originalAmount: originalAmount,
                remainingAmount: remainingAmount,
                createdAt: createdAt,
                status: status,
                originatingSessionId: originatingSessionId,
                originatingSaleId: originatingSaleId,
                originatingSubscriptionId: originatingSubscriptionId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String playerId,
                required int originalAmount,
                required int remainingAmount,
                required String createdAt,
                required String status,
                Value<String?> originatingSessionId = const Value.absent(),
                Value<String?> originatingSaleId = const Value.absent(),
                Value<String?> originatingSubscriptionId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DebtsCompanion.insert(
                id: id,
                playerId: playerId,
                originalAmount: originalAmount,
                remainingAmount: remainingAmount,
                createdAt: createdAt,
                status: status,
                originatingSessionId: originatingSessionId,
                originatingSaleId: originatingSaleId,
                originatingSubscriptionId: originatingSubscriptionId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$DebtsTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                playerId = false,
                originatingSessionId = false,
                originatingSaleId = false,
                originatingSubscriptionId = false,
                debtPaymentsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (debtPaymentsRefs) db.debtPayments,
                  ],
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
                        if (playerId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.playerId,
                                    referencedTable: $$DebtsTableReferences
                                        ._playerIdTable(db),
                                    referencedColumn: $$DebtsTableReferences
                                        ._playerIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (originatingSessionId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.originatingSessionId,
                                    referencedTable: $$DebtsTableReferences
                                        ._originatingSessionIdTable(db),
                                    referencedColumn: $$DebtsTableReferences
                                        ._originatingSessionIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (originatingSaleId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.originatingSaleId,
                                    referencedTable: $$DebtsTableReferences
                                        ._originatingSaleIdTable(db),
                                    referencedColumn: $$DebtsTableReferences
                                        ._originatingSaleIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (originatingSubscriptionId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn:
                                        table.originatingSubscriptionId,
                                    referencedTable: $$DebtsTableReferences
                                        ._originatingSubscriptionIdTable(db),
                                    referencedColumn: $$DebtsTableReferences
                                        ._originatingSubscriptionIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (debtPaymentsRefs)
                        await $_getPrefetchedData<
                          Debt,
                          $DebtsTable,
                          DebtPayment
                        >(
                          currentTable: table,
                          referencedTable: $$DebtsTableReferences
                              ._debtPaymentsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DebtsTableReferences(
                                db,
                                table,
                                p0,
                              ).debtPaymentsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.debtId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$DebtsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DebtsTable,
      Debt,
      $$DebtsTableFilterComposer,
      $$DebtsTableOrderingComposer,
      $$DebtsTableAnnotationComposer,
      $$DebtsTableCreateCompanionBuilder,
      $$DebtsTableUpdateCompanionBuilder,
      (Debt, $$DebtsTableReferences),
      Debt,
      PrefetchHooks Function({
        bool playerId,
        bool originatingSessionId,
        bool originatingSaleId,
        bool originatingSubscriptionId,
        bool debtPaymentsRefs,
      })
    >;
typedef $$DebtPaymentsTableCreateCompanionBuilder =
    DebtPaymentsCompanion Function({
      Value<int> id,
      required String debtId,
      required String paymentId,
      required int amountApplied,
      required String createdAt,
    });
typedef $$DebtPaymentsTableUpdateCompanionBuilder =
    DebtPaymentsCompanion Function({
      Value<int> id,
      Value<String> debtId,
      Value<String> paymentId,
      Value<int> amountApplied,
      Value<String> createdAt,
    });

final class $$DebtPaymentsTableReferences
    extends BaseReferences<_$AppDatabase, $DebtPaymentsTable, DebtPayment> {
  $$DebtPaymentsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $DebtsTable _debtIdTable(_$AppDatabase db) => db.debts.createAlias(
    $_aliasNameGenerator(db.debtPayments.debtId, db.debts.id),
  );

  $$DebtsTableProcessedTableManager get debtId {
    final $_column = $_itemColumn<String>('debt_id')!;

    final manager = $$DebtsTableTableManager(
      $_db,
      $_db.debts,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_debtIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $PaymentsTable _paymentIdTable(_$AppDatabase db) =>
      db.payments.createAlias(
        $_aliasNameGenerator(db.debtPayments.paymentId, db.payments.id),
      );

  $$PaymentsTableProcessedTableManager get paymentId {
    final $_column = $_itemColumn<String>('payment_id')!;

    final manager = $$PaymentsTableTableManager(
      $_db,
      $_db.payments,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_paymentIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$DebtPaymentsTableFilterComposer
    extends Composer<_$AppDatabase, $DebtPaymentsTable> {
  $$DebtPaymentsTableFilterComposer({
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

  ColumnFilters<int> get amountApplied => $composableBuilder(
    column: $table.amountApplied,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$DebtsTableFilterComposer get debtId {
    final $$DebtsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.debtId,
      referencedTable: $db.debts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DebtsTableFilterComposer(
            $db: $db,
            $table: $db.debts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PaymentsTableFilterComposer get paymentId {
    final $$PaymentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.paymentId,
      referencedTable: $db.payments,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PaymentsTableFilterComposer(
            $db: $db,
            $table: $db.payments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DebtPaymentsTableOrderingComposer
    extends Composer<_$AppDatabase, $DebtPaymentsTable> {
  $$DebtPaymentsTableOrderingComposer({
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

  ColumnOrderings<int> get amountApplied => $composableBuilder(
    column: $table.amountApplied,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$DebtsTableOrderingComposer get debtId {
    final $$DebtsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.debtId,
      referencedTable: $db.debts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DebtsTableOrderingComposer(
            $db: $db,
            $table: $db.debts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PaymentsTableOrderingComposer get paymentId {
    final $$PaymentsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.paymentId,
      referencedTable: $db.payments,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PaymentsTableOrderingComposer(
            $db: $db,
            $table: $db.payments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DebtPaymentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DebtPaymentsTable> {
  $$DebtPaymentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get amountApplied => $composableBuilder(
    column: $table.amountApplied,
    builder: (column) => column,
  );

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$DebtsTableAnnotationComposer get debtId {
    final $$DebtsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.debtId,
      referencedTable: $db.debts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DebtsTableAnnotationComposer(
            $db: $db,
            $table: $db.debts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PaymentsTableAnnotationComposer get paymentId {
    final $$PaymentsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.paymentId,
      referencedTable: $db.payments,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PaymentsTableAnnotationComposer(
            $db: $db,
            $table: $db.payments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DebtPaymentsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DebtPaymentsTable,
          DebtPayment,
          $$DebtPaymentsTableFilterComposer,
          $$DebtPaymentsTableOrderingComposer,
          $$DebtPaymentsTableAnnotationComposer,
          $$DebtPaymentsTableCreateCompanionBuilder,
          $$DebtPaymentsTableUpdateCompanionBuilder,
          (DebtPayment, $$DebtPaymentsTableReferences),
          DebtPayment,
          PrefetchHooks Function({bool debtId, bool paymentId})
        > {
  $$DebtPaymentsTableTableManager(_$AppDatabase db, $DebtPaymentsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DebtPaymentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DebtPaymentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DebtPaymentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> debtId = const Value.absent(),
                Value<String> paymentId = const Value.absent(),
                Value<int> amountApplied = const Value.absent(),
                Value<String> createdAt = const Value.absent(),
              }) => DebtPaymentsCompanion(
                id: id,
                debtId: debtId,
                paymentId: paymentId,
                amountApplied: amountApplied,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String debtId,
                required String paymentId,
                required int amountApplied,
                required String createdAt,
              }) => DebtPaymentsCompanion.insert(
                id: id,
                debtId: debtId,
                paymentId: paymentId,
                amountApplied: amountApplied,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DebtPaymentsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({debtId = false, paymentId = false}) {
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
                    if (debtId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.debtId,
                                referencedTable: $$DebtPaymentsTableReferences
                                    ._debtIdTable(db),
                                referencedColumn: $$DebtPaymentsTableReferences
                                    ._debtIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (paymentId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.paymentId,
                                referencedTable: $$DebtPaymentsTableReferences
                                    ._paymentIdTable(db),
                                referencedColumn: $$DebtPaymentsTableReferences
                                    ._paymentIdTable(db)
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

typedef $$DebtPaymentsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DebtPaymentsTable,
      DebtPayment,
      $$DebtPaymentsTableFilterComposer,
      $$DebtPaymentsTableOrderingComposer,
      $$DebtPaymentsTableAnnotationComposer,
      $$DebtPaymentsTableCreateCompanionBuilder,
      $$DebtPaymentsTableUpdateCompanionBuilder,
      (DebtPayment, $$DebtPaymentsTableReferences),
      DebtPayment,
      PrefetchHooks Function({bool debtId, bool paymentId})
    >;
typedef $$InventoryMovementsTableCreateCompanionBuilder =
    InventoryMovementsCompanion Function({
      Value<int> id,
      required String productId,
      required String movementType,
      required int quantityChange,
      required int stockBefore,
      required int stockAfter,
      Value<String?> notes,
      required String createdAt,
      Value<String?> associatedSaleId,
    });
typedef $$InventoryMovementsTableUpdateCompanionBuilder =
    InventoryMovementsCompanion Function({
      Value<int> id,
      Value<String> productId,
      Value<String> movementType,
      Value<int> quantityChange,
      Value<int> stockBefore,
      Value<int> stockAfter,
      Value<String?> notes,
      Value<String> createdAt,
      Value<String?> associatedSaleId,
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
    final $_column = $_itemColumn<String>('product_id')!;

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

  static $ProductSalesTable _associatedSaleIdTable(_$AppDatabase db) =>
      db.productSales.createAlias(
        $_aliasNameGenerator(
          db.inventoryMovements.associatedSaleId,
          db.productSales.id,
        ),
      );

  $$ProductSalesTableProcessedTableManager? get associatedSaleId {
    final $_column = $_itemColumn<String>('associated_sale_id');
    if ($_column == null) return null;
    final manager = $$ProductSalesTableTableManager(
      $_db,
      $_db.productSales,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_associatedSaleIdTable($_db));
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

  ColumnFilters<String> get movementType => $composableBuilder(
    column: $table.movementType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get quantityChange => $composableBuilder(
    column: $table.quantityChange,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get stockBefore => $composableBuilder(
    column: $table.stockBefore,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get stockAfter => $composableBuilder(
    column: $table.stockAfter,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
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

  $$ProductSalesTableFilterComposer get associatedSaleId {
    final $$ProductSalesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.associatedSaleId,
      referencedTable: $db.productSales,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductSalesTableFilterComposer(
            $db: $db,
            $table: $db.productSales,
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

  ColumnOrderings<String> get movementType => $composableBuilder(
    column: $table.movementType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get quantityChange => $composableBuilder(
    column: $table.quantityChange,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get stockBefore => $composableBuilder(
    column: $table.stockBefore,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get stockAfter => $composableBuilder(
    column: $table.stockAfter,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
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

  $$ProductSalesTableOrderingComposer get associatedSaleId {
    final $$ProductSalesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.associatedSaleId,
      referencedTable: $db.productSales,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductSalesTableOrderingComposer(
            $db: $db,
            $table: $db.productSales,
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

  GeneratedColumn<String> get movementType => $composableBuilder(
    column: $table.movementType,
    builder: (column) => column,
  );

  GeneratedColumn<int> get quantityChange => $composableBuilder(
    column: $table.quantityChange,
    builder: (column) => column,
  );

  GeneratedColumn<int> get stockBefore => $composableBuilder(
    column: $table.stockBefore,
    builder: (column) => column,
  );

  GeneratedColumn<int> get stockAfter => $composableBuilder(
    column: $table.stockAfter,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

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

  $$ProductSalesTableAnnotationComposer get associatedSaleId {
    final $$ProductSalesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.associatedSaleId,
      referencedTable: $db.productSales,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductSalesTableAnnotationComposer(
            $db: $db,
            $table: $db.productSales,
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
          PrefetchHooks Function({bool productId, bool associatedSaleId})
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
                Value<String> productId = const Value.absent(),
                Value<String> movementType = const Value.absent(),
                Value<int> quantityChange = const Value.absent(),
                Value<int> stockBefore = const Value.absent(),
                Value<int> stockAfter = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String> createdAt = const Value.absent(),
                Value<String?> associatedSaleId = const Value.absent(),
              }) => InventoryMovementsCompanion(
                id: id,
                productId: productId,
                movementType: movementType,
                quantityChange: quantityChange,
                stockBefore: stockBefore,
                stockAfter: stockAfter,
                notes: notes,
                createdAt: createdAt,
                associatedSaleId: associatedSaleId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String productId,
                required String movementType,
                required int quantityChange,
                required int stockBefore,
                required int stockAfter,
                Value<String?> notes = const Value.absent(),
                required String createdAt,
                Value<String?> associatedSaleId = const Value.absent(),
              }) => InventoryMovementsCompanion.insert(
                id: id,
                productId: productId,
                movementType: movementType,
                quantityChange: quantityChange,
                stockBefore: stockBefore,
                stockAfter: stockAfter,
                notes: notes,
                createdAt: createdAt,
                associatedSaleId: associatedSaleId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$InventoryMovementsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({productId = false, associatedSaleId = false}) {
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
                        if (associatedSaleId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.associatedSaleId,
                                    referencedTable:
                                        $$InventoryMovementsTableReferences
                                            ._associatedSaleIdTable(db),
                                    referencedColumn:
                                        $$InventoryMovementsTableReferences
                                            ._associatedSaleIdTable(db)
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
      PrefetchHooks Function({bool productId, bool associatedSaleId})
    >;
typedef $$EndDayClosesTableCreateCompanionBuilder =
    EndDayClosesCompanion Function({
      required String id,
      required String closedAt,
      required String businessDate,
      required int expectedCash,
      required int expectedCard,
      required int countedCash,
      required int countedCard,
      required int cashMismatch,
      required int cardMismatch,
      required int totalDebtIssued,
      required int totalDebtCollected,
      required int totalTips,
      required bool isMissedClose,
      required String backupStatus,
      Value<int> rowid,
    });
typedef $$EndDayClosesTableUpdateCompanionBuilder =
    EndDayClosesCompanion Function({
      Value<String> id,
      Value<String> closedAt,
      Value<String> businessDate,
      Value<int> expectedCash,
      Value<int> expectedCard,
      Value<int> countedCash,
      Value<int> countedCard,
      Value<int> cashMismatch,
      Value<int> cardMismatch,
      Value<int> totalDebtIssued,
      Value<int> totalDebtCollected,
      Value<int> totalTips,
      Value<bool> isMissedClose,
      Value<String> backupStatus,
      Value<int> rowid,
    });

class $$EndDayClosesTableFilterComposer
    extends Composer<_$AppDatabase, $EndDayClosesTable> {
  $$EndDayClosesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get closedAt => $composableBuilder(
    column: $table.closedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get businessDate => $composableBuilder(
    column: $table.businessDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get expectedCash => $composableBuilder(
    column: $table.expectedCash,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get expectedCard => $composableBuilder(
    column: $table.expectedCard,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get countedCash => $composableBuilder(
    column: $table.countedCash,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get countedCard => $composableBuilder(
    column: $table.countedCard,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get cashMismatch => $composableBuilder(
    column: $table.cashMismatch,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get cardMismatch => $composableBuilder(
    column: $table.cardMismatch,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalDebtIssued => $composableBuilder(
    column: $table.totalDebtIssued,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalDebtCollected => $composableBuilder(
    column: $table.totalDebtCollected,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalTips => $composableBuilder(
    column: $table.totalTips,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isMissedClose => $composableBuilder(
    column: $table.isMissedClose,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get backupStatus => $composableBuilder(
    column: $table.backupStatus,
    builder: (column) => ColumnFilters(column),
  );
}

class $$EndDayClosesTableOrderingComposer
    extends Composer<_$AppDatabase, $EndDayClosesTable> {
  $$EndDayClosesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get closedAt => $composableBuilder(
    column: $table.closedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get businessDate => $composableBuilder(
    column: $table.businessDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get expectedCash => $composableBuilder(
    column: $table.expectedCash,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get expectedCard => $composableBuilder(
    column: $table.expectedCard,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get countedCash => $composableBuilder(
    column: $table.countedCash,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get countedCard => $composableBuilder(
    column: $table.countedCard,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get cashMismatch => $composableBuilder(
    column: $table.cashMismatch,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get cardMismatch => $composableBuilder(
    column: $table.cardMismatch,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalDebtIssued => $composableBuilder(
    column: $table.totalDebtIssued,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalDebtCollected => $composableBuilder(
    column: $table.totalDebtCollected,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalTips => $composableBuilder(
    column: $table.totalTips,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isMissedClose => $composableBuilder(
    column: $table.isMissedClose,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get backupStatus => $composableBuilder(
    column: $table.backupStatus,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$EndDayClosesTableAnnotationComposer
    extends Composer<_$AppDatabase, $EndDayClosesTable> {
  $$EndDayClosesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get closedAt =>
      $composableBuilder(column: $table.closedAt, builder: (column) => column);

  GeneratedColumn<String> get businessDate => $composableBuilder(
    column: $table.businessDate,
    builder: (column) => column,
  );

  GeneratedColumn<int> get expectedCash => $composableBuilder(
    column: $table.expectedCash,
    builder: (column) => column,
  );

  GeneratedColumn<int> get expectedCard => $composableBuilder(
    column: $table.expectedCard,
    builder: (column) => column,
  );

  GeneratedColumn<int> get countedCash => $composableBuilder(
    column: $table.countedCash,
    builder: (column) => column,
  );

  GeneratedColumn<int> get countedCard => $composableBuilder(
    column: $table.countedCard,
    builder: (column) => column,
  );

  GeneratedColumn<int> get cashMismatch => $composableBuilder(
    column: $table.cashMismatch,
    builder: (column) => column,
  );

  GeneratedColumn<int> get cardMismatch => $composableBuilder(
    column: $table.cardMismatch,
    builder: (column) => column,
  );

  GeneratedColumn<int> get totalDebtIssued => $composableBuilder(
    column: $table.totalDebtIssued,
    builder: (column) => column,
  );

  GeneratedColumn<int> get totalDebtCollected => $composableBuilder(
    column: $table.totalDebtCollected,
    builder: (column) => column,
  );

  GeneratedColumn<int> get totalTips =>
      $composableBuilder(column: $table.totalTips, builder: (column) => column);

  GeneratedColumn<bool> get isMissedClose => $composableBuilder(
    column: $table.isMissedClose,
    builder: (column) => column,
  );

  GeneratedColumn<String> get backupStatus => $composableBuilder(
    column: $table.backupStatus,
    builder: (column) => column,
  );
}

class $$EndDayClosesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EndDayClosesTable,
          EndDayClose,
          $$EndDayClosesTableFilterComposer,
          $$EndDayClosesTableOrderingComposer,
          $$EndDayClosesTableAnnotationComposer,
          $$EndDayClosesTableCreateCompanionBuilder,
          $$EndDayClosesTableUpdateCompanionBuilder,
          (
            EndDayClose,
            BaseReferences<_$AppDatabase, $EndDayClosesTable, EndDayClose>,
          ),
          EndDayClose,
          PrefetchHooks Function()
        > {
  $$EndDayClosesTableTableManager(_$AppDatabase db, $EndDayClosesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EndDayClosesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EndDayClosesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EndDayClosesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> closedAt = const Value.absent(),
                Value<String> businessDate = const Value.absent(),
                Value<int> expectedCash = const Value.absent(),
                Value<int> expectedCard = const Value.absent(),
                Value<int> countedCash = const Value.absent(),
                Value<int> countedCard = const Value.absent(),
                Value<int> cashMismatch = const Value.absent(),
                Value<int> cardMismatch = const Value.absent(),
                Value<int> totalDebtIssued = const Value.absent(),
                Value<int> totalDebtCollected = const Value.absent(),
                Value<int> totalTips = const Value.absent(),
                Value<bool> isMissedClose = const Value.absent(),
                Value<String> backupStatus = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => EndDayClosesCompanion(
                id: id,
                closedAt: closedAt,
                businessDate: businessDate,
                expectedCash: expectedCash,
                expectedCard: expectedCard,
                countedCash: countedCash,
                countedCard: countedCard,
                cashMismatch: cashMismatch,
                cardMismatch: cardMismatch,
                totalDebtIssued: totalDebtIssued,
                totalDebtCollected: totalDebtCollected,
                totalTips: totalTips,
                isMissedClose: isMissedClose,
                backupStatus: backupStatus,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String closedAt,
                required String businessDate,
                required int expectedCash,
                required int expectedCard,
                required int countedCash,
                required int countedCard,
                required int cashMismatch,
                required int cardMismatch,
                required int totalDebtIssued,
                required int totalDebtCollected,
                required int totalTips,
                required bool isMissedClose,
                required String backupStatus,
                Value<int> rowid = const Value.absent(),
              }) => EndDayClosesCompanion.insert(
                id: id,
                closedAt: closedAt,
                businessDate: businessDate,
                expectedCash: expectedCash,
                expectedCard: expectedCard,
                countedCash: countedCash,
                countedCard: countedCard,
                cashMismatch: cashMismatch,
                cardMismatch: cardMismatch,
                totalDebtIssued: totalDebtIssued,
                totalDebtCollected: totalDebtCollected,
                totalTips: totalTips,
                isMissedClose: isMissedClose,
                backupStatus: backupStatus,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$EndDayClosesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EndDayClosesTable,
      EndDayClose,
      $$EndDayClosesTableFilterComposer,
      $$EndDayClosesTableOrderingComposer,
      $$EndDayClosesTableAnnotationComposer,
      $$EndDayClosesTableCreateCompanionBuilder,
      $$EndDayClosesTableUpdateCompanionBuilder,
      (
        EndDayClose,
        BaseReferences<_$AppDatabase, $EndDayClosesTable, EndDayClose>,
      ),
      EndDayClose,
      PrefetchHooks Function()
    >;
typedef $$AuditEventsTableCreateCompanionBuilder =
    AuditEventsCompanion Function({
      Value<int> id,
      required String eventType,
      required String description,
      required String triggeredAt,
      Value<String?> metadata,
    });
typedef $$AuditEventsTableUpdateCompanionBuilder =
    AuditEventsCompanion Function({
      Value<int> id,
      Value<String> eventType,
      Value<String> description,
      Value<String> triggeredAt,
      Value<String?> metadata,
    });

final class $$AuditEventsTableReferences
    extends BaseReferences<_$AppDatabase, $AuditEventsTable, AuditEvent> {
  $$AuditEventsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$CorrectionsTable, List<Correction>>
  _correctionsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.corrections,
    aliasName: $_aliasNameGenerator(
      db.auditEvents.id,
      db.corrections.auditEventId,
    ),
  );

  $$CorrectionsTableProcessedTableManager get correctionsRefs {
    final manager = $$CorrectionsTableTableManager(
      $_db,
      $_db.corrections,
    ).filter((f) => f.auditEventId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_correctionsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$AuditEventsTableFilterComposer
    extends Composer<_$AppDatabase, $AuditEventsTable> {
  $$AuditEventsTableFilterComposer({
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

  ColumnFilters<String> get eventType => $composableBuilder(
    column: $table.eventType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get triggeredAt => $composableBuilder(
    column: $table.triggeredAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get metadata => $composableBuilder(
    column: $table.metadata,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> correctionsRefs(
    Expression<bool> Function($$CorrectionsTableFilterComposer f) f,
  ) {
    final $$CorrectionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.corrections,
      getReferencedColumn: (t) => t.auditEventId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CorrectionsTableFilterComposer(
            $db: $db,
            $table: $db.corrections,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AuditEventsTableOrderingComposer
    extends Composer<_$AppDatabase, $AuditEventsTable> {
  $$AuditEventsTableOrderingComposer({
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

  ColumnOrderings<String> get eventType => $composableBuilder(
    column: $table.eventType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get triggeredAt => $composableBuilder(
    column: $table.triggeredAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get metadata => $composableBuilder(
    column: $table.metadata,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AuditEventsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AuditEventsTable> {
  $$AuditEventsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get eventType =>
      $composableBuilder(column: $table.eventType, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get triggeredAt => $composableBuilder(
    column: $table.triggeredAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get metadata =>
      $composableBuilder(column: $table.metadata, builder: (column) => column);

  Expression<T> correctionsRefs<T extends Object>(
    Expression<T> Function($$CorrectionsTableAnnotationComposer a) f,
  ) {
    final $$CorrectionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.corrections,
      getReferencedColumn: (t) => t.auditEventId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CorrectionsTableAnnotationComposer(
            $db: $db,
            $table: $db.corrections,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AuditEventsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AuditEventsTable,
          AuditEvent,
          $$AuditEventsTableFilterComposer,
          $$AuditEventsTableOrderingComposer,
          $$AuditEventsTableAnnotationComposer,
          $$AuditEventsTableCreateCompanionBuilder,
          $$AuditEventsTableUpdateCompanionBuilder,
          (AuditEvent, $$AuditEventsTableReferences),
          AuditEvent,
          PrefetchHooks Function({bool correctionsRefs})
        > {
  $$AuditEventsTableTableManager(_$AppDatabase db, $AuditEventsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AuditEventsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AuditEventsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AuditEventsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> eventType = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> triggeredAt = const Value.absent(),
                Value<String?> metadata = const Value.absent(),
              }) => AuditEventsCompanion(
                id: id,
                eventType: eventType,
                description: description,
                triggeredAt: triggeredAt,
                metadata: metadata,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String eventType,
                required String description,
                required String triggeredAt,
                Value<String?> metadata = const Value.absent(),
              }) => AuditEventsCompanion.insert(
                id: id,
                eventType: eventType,
                description: description,
                triggeredAt: triggeredAt,
                metadata: metadata,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AuditEventsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({correctionsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (correctionsRefs) db.corrections],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (correctionsRefs)
                    await $_getPrefetchedData<
                      AuditEvent,
                      $AuditEventsTable,
                      Correction
                    >(
                      currentTable: table,
                      referencedTable: $$AuditEventsTableReferences
                          ._correctionsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$AuditEventsTableReferences(
                            db,
                            table,
                            p0,
                          ).correctionsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.auditEventId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$AuditEventsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AuditEventsTable,
      AuditEvent,
      $$AuditEventsTableFilterComposer,
      $$AuditEventsTableOrderingComposer,
      $$AuditEventsTableAnnotationComposer,
      $$AuditEventsTableCreateCompanionBuilder,
      $$AuditEventsTableUpdateCompanionBuilder,
      (AuditEvent, $$AuditEventsTableReferences),
      AuditEvent,
      PrefetchHooks Function({bool correctionsRefs})
    >;
typedef $$BackupRunsTableCreateCompanionBuilder =
    BackupRunsCompanion Function({
      Value<int> id,
      required String triggeredAt,
      required String triggerType,
      required String status,
      required String backupFilename,
      Value<String?> errorMessage,
    });
typedef $$BackupRunsTableUpdateCompanionBuilder =
    BackupRunsCompanion Function({
      Value<int> id,
      Value<String> triggeredAt,
      Value<String> triggerType,
      Value<String> status,
      Value<String> backupFilename,
      Value<String?> errorMessage,
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

  ColumnFilters<String> get triggeredAt => $composableBuilder(
    column: $table.triggeredAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get triggerType => $composableBuilder(
    column: $table.triggerType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get backupFilename => $composableBuilder(
    column: $table.backupFilename,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get errorMessage => $composableBuilder(
    column: $table.errorMessage,
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

  ColumnOrderings<String> get triggeredAt => $composableBuilder(
    column: $table.triggeredAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get triggerType => $composableBuilder(
    column: $table.triggerType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get backupFilename => $composableBuilder(
    column: $table.backupFilename,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get errorMessage => $composableBuilder(
    column: $table.errorMessage,
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

  GeneratedColumn<String> get triggeredAt => $composableBuilder(
    column: $table.triggeredAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get triggerType => $composableBuilder(
    column: $table.triggerType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get backupFilename => $composableBuilder(
    column: $table.backupFilename,
    builder: (column) => column,
  );

  GeneratedColumn<String> get errorMessage => $composableBuilder(
    column: $table.errorMessage,
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
                Value<String> triggeredAt = const Value.absent(),
                Value<String> triggerType = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String> backupFilename = const Value.absent(),
                Value<String?> errorMessage = const Value.absent(),
              }) => BackupRunsCompanion(
                id: id,
                triggeredAt: triggeredAt,
                triggerType: triggerType,
                status: status,
                backupFilename: backupFilename,
                errorMessage: errorMessage,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String triggeredAt,
                required String triggerType,
                required String status,
                required String backupFilename,
                Value<String?> errorMessage = const Value.absent(),
              }) => BackupRunsCompanion.insert(
                id: id,
                triggeredAt: triggeredAt,
                triggerType: triggerType,
                status: status,
                backupFilename: backupFilename,
                errorMessage: errorMessage,
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
typedef $$SystemSettingsTableCreateCompanionBuilder =
    SystemSettingsCompanion Function({
      required String key,
      required String value,
      required String updatedAt,
      Value<int> rowid,
    });
typedef $$SystemSettingsTableUpdateCompanionBuilder =
    SystemSettingsCompanion Function({
      Value<String> key,
      Value<String> value,
      Value<String> updatedAt,
      Value<int> rowid,
    });

class $$SystemSettingsTableFilterComposer
    extends Composer<_$AppDatabase, $SystemSettingsTable> {
  $$SystemSettingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SystemSettingsTableOrderingComposer
    extends Composer<_$AppDatabase, $SystemSettingsTable> {
  $$SystemSettingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SystemSettingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SystemSettingsTable> {
  $$SystemSettingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  GeneratedColumn<String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$SystemSettingsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SystemSettingsTable,
          SystemSetting,
          $$SystemSettingsTableFilterComposer,
          $$SystemSettingsTableOrderingComposer,
          $$SystemSettingsTableAnnotationComposer,
          $$SystemSettingsTableCreateCompanionBuilder,
          $$SystemSettingsTableUpdateCompanionBuilder,
          (
            SystemSetting,
            BaseReferences<_$AppDatabase, $SystemSettingsTable, SystemSetting>,
          ),
          SystemSetting,
          PrefetchHooks Function()
        > {
  $$SystemSettingsTableTableManager(
    _$AppDatabase db,
    $SystemSettingsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SystemSettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SystemSettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SystemSettingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> key = const Value.absent(),
                Value<String> value = const Value.absent(),
                Value<String> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SystemSettingsCompanion(
                key: key,
                value: value,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String key,
                required String value,
                required String updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => SystemSettingsCompanion.insert(
                key: key,
                value: value,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SystemSettingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SystemSettingsTable,
      SystemSetting,
      $$SystemSettingsTableFilterComposer,
      $$SystemSettingsTableOrderingComposer,
      $$SystemSettingsTableAnnotationComposer,
      $$SystemSettingsTableCreateCompanionBuilder,
      $$SystemSettingsTableUpdateCompanionBuilder,
      (
        SystemSetting,
        BaseReferences<_$AppDatabase, $SystemSettingsTable, SystemSetting>,
      ),
      SystemSetting,
      PrefetchHooks Function()
    >;
typedef $$CorrectionsTableCreateCompanionBuilder =
    CorrectionsCompanion Function({
      Value<int> id,
      required String originalId,
      required String originalTable,
      required String correctionType,
      required int auditEventId,
      required String createdAt,
    });
typedef $$CorrectionsTableUpdateCompanionBuilder =
    CorrectionsCompanion Function({
      Value<int> id,
      Value<String> originalId,
      Value<String> originalTable,
      Value<String> correctionType,
      Value<int> auditEventId,
      Value<String> createdAt,
    });

final class $$CorrectionsTableReferences
    extends BaseReferences<_$AppDatabase, $CorrectionsTable, Correction> {
  $$CorrectionsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $AuditEventsTable _auditEventIdTable(_$AppDatabase db) =>
      db.auditEvents.createAlias(
        $_aliasNameGenerator(db.corrections.auditEventId, db.auditEvents.id),
      );

  $$AuditEventsTableProcessedTableManager get auditEventId {
    final $_column = $_itemColumn<int>('audit_event_id')!;

    final manager = $$AuditEventsTableTableManager(
      $_db,
      $_db.auditEvents,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_auditEventIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$CorrectionsTableFilterComposer
    extends Composer<_$AppDatabase, $CorrectionsTable> {
  $$CorrectionsTableFilterComposer({
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

  ColumnFilters<String> get originalId => $composableBuilder(
    column: $table.originalId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get originalTable => $composableBuilder(
    column: $table.originalTable,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get correctionType => $composableBuilder(
    column: $table.correctionType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$AuditEventsTableFilterComposer get auditEventId {
    final $$AuditEventsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.auditEventId,
      referencedTable: $db.auditEvents,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AuditEventsTableFilterComposer(
            $db: $db,
            $table: $db.auditEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CorrectionsTableOrderingComposer
    extends Composer<_$AppDatabase, $CorrectionsTable> {
  $$CorrectionsTableOrderingComposer({
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

  ColumnOrderings<String> get originalId => $composableBuilder(
    column: $table.originalId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get originalTable => $composableBuilder(
    column: $table.originalTable,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get correctionType => $composableBuilder(
    column: $table.correctionType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$AuditEventsTableOrderingComposer get auditEventId {
    final $$AuditEventsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.auditEventId,
      referencedTable: $db.auditEvents,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AuditEventsTableOrderingComposer(
            $db: $db,
            $table: $db.auditEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CorrectionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CorrectionsTable> {
  $$CorrectionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get originalId => $composableBuilder(
    column: $table.originalId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get originalTable => $composableBuilder(
    column: $table.originalTable,
    builder: (column) => column,
  );

  GeneratedColumn<String> get correctionType => $composableBuilder(
    column: $table.correctionType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$AuditEventsTableAnnotationComposer get auditEventId {
    final $$AuditEventsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.auditEventId,
      referencedTable: $db.auditEvents,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AuditEventsTableAnnotationComposer(
            $db: $db,
            $table: $db.auditEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CorrectionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CorrectionsTable,
          Correction,
          $$CorrectionsTableFilterComposer,
          $$CorrectionsTableOrderingComposer,
          $$CorrectionsTableAnnotationComposer,
          $$CorrectionsTableCreateCompanionBuilder,
          $$CorrectionsTableUpdateCompanionBuilder,
          (Correction, $$CorrectionsTableReferences),
          Correction,
          PrefetchHooks Function({bool auditEventId})
        > {
  $$CorrectionsTableTableManager(_$AppDatabase db, $CorrectionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CorrectionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CorrectionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CorrectionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> originalId = const Value.absent(),
                Value<String> originalTable = const Value.absent(),
                Value<String> correctionType = const Value.absent(),
                Value<int> auditEventId = const Value.absent(),
                Value<String> createdAt = const Value.absent(),
              }) => CorrectionsCompanion(
                id: id,
                originalId: originalId,
                originalTable: originalTable,
                correctionType: correctionType,
                auditEventId: auditEventId,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String originalId,
                required String originalTable,
                required String correctionType,
                required int auditEventId,
                required String createdAt,
              }) => CorrectionsCompanion.insert(
                id: id,
                originalId: originalId,
                originalTable: originalTable,
                correctionType: correctionType,
                auditEventId: auditEventId,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CorrectionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({auditEventId = false}) {
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
                    if (auditEventId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.auditEventId,
                                referencedTable: $$CorrectionsTableReferences
                                    ._auditEventIdTable(db),
                                referencedColumn: $$CorrectionsTableReferences
                                    ._auditEventIdTable(db)
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

typedef $$CorrectionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CorrectionsTable,
      Correction,
      $$CorrectionsTableFilterComposer,
      $$CorrectionsTableOrderingComposer,
      $$CorrectionsTableAnnotationComposer,
      $$CorrectionsTableCreateCompanionBuilder,
      $$CorrectionsTableUpdateCompanionBuilder,
      (Correction, $$CorrectionsTableReferences),
      Correction,
      PrefetchHooks Function({bool auditEventId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$PlayersTableTableManager get players =>
      $$PlayersTableTableManager(_db, _db.players);
  $$PlayerPhonesTableTableManager get playerPhones =>
      $$PlayerPhonesTableTableManager(_db, _db.playerPhones);
  $$SubscriptionsTableTableManager get subscriptions =>
      $$SubscriptionsTableTableManager(_db, _db.subscriptions);
  $$SessionsTableTableManager get sessions =>
      $$SessionsTableTableManager(_db, _db.sessions);
  $$SubscriptionUsageLogsTableTableManager get subscriptionUsageLogs =>
      $$SubscriptionUsageLogsTableTableManager(_db, _db.subscriptionUsageLogs);
  $$ProductsTableTableManager get products =>
      $$ProductsTableTableManager(_db, _db.products);
  $$ProductSalesTableTableManager get productSales =>
      $$ProductSalesTableTableManager(_db, _db.productSales);
  $$SaleItemsTableTableManager get saleItems =>
      $$SaleItemsTableTableManager(_db, _db.saleItems);
  $$PaymentsTableTableManager get payments =>
      $$PaymentsTableTableManager(_db, _db.payments);
  $$DebtsTableTableManager get debts =>
      $$DebtsTableTableManager(_db, _db.debts);
  $$DebtPaymentsTableTableManager get debtPayments =>
      $$DebtPaymentsTableTableManager(_db, _db.debtPayments);
  $$InventoryMovementsTableTableManager get inventoryMovements =>
      $$InventoryMovementsTableTableManager(_db, _db.inventoryMovements);
  $$EndDayClosesTableTableManager get endDayCloses =>
      $$EndDayClosesTableTableManager(_db, _db.endDayCloses);
  $$AuditEventsTableTableManager get auditEvents =>
      $$AuditEventsTableTableManager(_db, _db.auditEvents);
  $$BackupRunsTableTableManager get backupRuns =>
      $$BackupRunsTableTableManager(_db, _db.backupRuns);
  $$SystemSettingsTableTableManager get systemSettings =>
      $$SystemSettingsTableTableManager(_db, _db.systemSettings);
  $$CorrectionsTableTableManager get corrections =>
      $$CorrectionsTableTableManager(_db, _db.corrections);
}
