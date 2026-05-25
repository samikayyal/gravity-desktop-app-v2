import 'package:gravity_desktop_app_v2/core/database/local_database.dart'
    hide Player;
import 'package:gravity_desktop_app_v2/domain/entities/player.dart';

class PlayerRepository {
  final AppDatabase _db;

  PlayerRepository(this._db);

  /// Inserts a [Player] domain entity into the local database, converting it to a database row.
  Future<void> insertPlayer(Player player) async {
    await _db
        .into(_db.players)
        .insert(
          PlayersCompanion.insert(
            id: player.id,
            fullName: player.fullName,
            age: player.age,
            createdAt: player.createdAt,
            updatedAt: player.updatedAt,
            hasActiveSession: player.hasActiveSession,
          ),
        );
  }

  /// Retrieves a player by their ID from the database and maps the database row back into a [Player] domain model.
  Future<Player?> getPlayer(String id) async {
    final query = _db.select(_db.players)..where((tbl) => tbl.id.equals(id));
    final row = await query.getSingleOrNull();
    if (row == null) return null;

    return Player(
      id: row.id,
      fullName: row.fullName,
      age: row.age,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
      hasActiveSession: row.hasActiveSession,
    );
  }
}
