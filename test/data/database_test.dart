import 'package:flutter_test/flutter_test.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:gravity_desktop_app_v2/core/database/local_database.dart';

void main() {
  late AppDatabase database;

  setUp(() {
    // Instantiate a clean in-memory database per test run
    database = AppDatabase.forTesting(
      DatabaseConnection(NativeDatabase.memory()),
    );
  });

  tearDown(() async {
    await database.close();
  });

  group('Drift SQLite Baseline Tests', () {
    test('Can insert and retrieve a player profile', () async {
      // 1. Arrange - create domain row data
      const playerId = 'test-player-uuid-123';
      final playerRow = PlayersCompanion.insert(
        id: playerId,
        fullName: 'John Doe',
        age: 28,
        createdAt: DateTime.now().toUtc().toIso8601String(),
        updatedAt: DateTime.now().toUtc().toIso8601String(),
        hasActiveSession: false,
      );

      // 2. Act - insert into Drift
      await database.into(database.players).insert(playerRow);

      // 3. Assert - check details match
      final players = await database.select(database.players).get();
      expect(players.length, 1);
      expect(players.first.id, playerId);
      expect(players.first.fullName, 'John Doe');
      expect(players.first.age, 28);
      expect(
        players.first.hasActiveSession,
        isFalse,
      ); // Verify default value works
    });

    test(
      'Can write multiple phone numbers for a player with foreign keys',
      () async {
        const playerId = 'player-uuid-456';
        await database
            .into(database.players)
            .insert(
              PlayersCompanion.insert(
                id: playerId,
                fullName: 'Jane Smith',
                age: 22,
                createdAt: DateTime.now().toUtc().toIso8601String(),
                updatedAt: DateTime.now().toUtc().toIso8601String(),
                hasActiveSession: false,
              ),
            );

        // Insert primary phone
        await database
            .into(database.playerPhones)
            .insert(
              PlayerPhonesCompanion.insert(
                playerId: playerId,
                phoneNumber: '+963912345678',
                isPrimary: true,
              ),
            );

        // Insert secondary phone
        await database
            .into(database.playerPhones)
            .insert(
              PlayerPhonesCompanion.insert(
                playerId: playerId,
                phoneNumber: '+963987654321',
                isPrimary: false,
              ),
            );

        // Query phones
        final phones = await database.select(database.playerPhones).get();
        expect(phones.length, 2);
        expect(phones.first.playerId, playerId);
        expect(phones.first.isPrimary, isTrue);
        expect(phones.last.isPrimary, isFalse);
      },
    );

    test(
      'Can complete complex database operations inside a transaction',
      () async {
        const playerId = 'tx-player-789';
        const sessionId = 'tx-session-789';

        await database.transaction(() async {
          // 1. Create player
          await database
              .into(database.players)
              .insert(
                PlayersCompanion.insert(
                  id: playerId,
                  fullName: 'Bob Brown',
                  age: 35,
                  createdAt: DateTime.now().toUtc().toIso8601String(),
                  updatedAt: DateTime.now().toUtc().toIso8601String(),
                  hasActiveSession: true,
                ),
              );

          // 2. Create active session
          await database
              .into(database.sessions)
              .insert(
                SessionsCompanion.insert(
                  id: sessionId,
                  playerId: playerId,
                  entryType: 'open',
                  checkInAt: DateTime.now().toUtc().toIso8601String(),
                  status: 'active',
                  calculatedCharge: 0,
                  finalCharge: 0,
                  discountAmount: 0,
                ),
              );
        });

        // Verify transaction succeeded
        final session = await (database.select(
          database.sessions,
        )..where((tbl) => tbl.id.equals(sessionId))).getSingle();
        expect(session.status, 'active');
        expect(session.playerId, playerId);

        final player = await (database.select(
          database.players,
        )..where((tbl) => tbl.id.equals(playerId))).getSingle();
        expect(player.hasActiveSession, isTrue);
      },
    );
  });

  group('Settings & Export Tables Integrity', () {
    test('Can save and retrieve system settings', () async {
      await database
          .into(database.systemSettings)
          .insert(
            SystemSettingsCompanion.insert(
              key: 'leeway_minutes',
              value: '15',
              updatedAt: DateTime.now().toUtc().toIso8601String(),
            ),
          );

      final setting = await (database.select(
        database.systemSettings,
      )..where((tbl) => tbl.key.equals('leeway_minutes'))).getSingle();
      expect(setting.value, '15');
    });
  });
}
