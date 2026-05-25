import 'package:flutter_test/flutter_test.dart';
import 'package:drift/drift.dart' hide isNull, isNotNull;
import 'package:drift/native.dart';
import 'package:gravity_desktop_app_v2/core/database/local_database.dart'
    hide Player;
import 'package:gravity_desktop_app_v2/data/repositories/player_repository.dart';
import 'package:gravity_desktop_app_v2/domain/entities/player.dart';

void main() {
  late AppDatabase database;
  late PlayerRepository playerRepository;

  setUp(() {
    database = AppDatabase.forTesting(
      DatabaseConnection(NativeDatabase.memory()),
    );
    playerRepository = PlayerRepository(database);
  });

  tearDown(() async {
    await database.close();
  });

  group('PlayerRepository Serialization & Boundaries', () {
    test(
      'Maps Drift DB row accurately to and from immutable Player domain entity',
      () async {
        final nowStr = DateTime.now().toUtc().toIso8601String();
        final domainPlayer = Player(
          id: 'repository-player-uuid',
          fullName: 'Jane Doe',
          age: 26,
          createdAt: nowStr,
          updatedAt: nowStr,
          hasActiveSession: false,
        );

        // Act: Write using repository
        await playerRepository.insertPlayer(domainPlayer);

        // Act: Read using repository
        final retrievedPlayer = await playerRepository.getPlayer(
          'repository-player-uuid',
        );

        // Assert: Verify serialization mapped values correctly
        expect(retrievedPlayer, isNotNull);
        expect(retrievedPlayer!.id, domainPlayer.id);
        expect(retrievedPlayer.fullName, domainPlayer.fullName);
        expect(retrievedPlayer.age, domainPlayer.age);
        expect(retrievedPlayer.createdAt, domainPlayer.createdAt);
        expect(retrievedPlayer.updatedAt, domainPlayer.updatedAt);
        expect(retrievedPlayer.hasActiveSession, domainPlayer.hasActiveSession);
      },
    );

    test('Returns null when searching for non-existent player', () async {
      final retrievedPlayer = await playerRepository.getPlayer(
        'non-existent-uuid',
      );
      expect(retrievedPlayer, isNull);
    });
  });
}
