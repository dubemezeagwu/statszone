import "package:path/path.dart";
import "package:sqflite/sqflite.dart";
import "package:statszone/domain/app_domain.dart";

class LocalDatabase {
  static final LocalDatabase instance = LocalDatabase._internal();
  static Database? _database;

  LocalDatabase._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initializeDatabase("players.db");
    return _database!;
  }

  Future<Database> _initializeDatabase(String filePath) async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  Future _createDatabase(Database database, int version) async {
    const idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    const textType = "TEXT NOT NULL";
    const boolType = "BOOLEAN NOT NULL";
    const integerType = "INTEGER NOT NULL";

    await database.execute(""" 
    CREATE TABLE $tablePlayers (
      ${PlayerFields.id} $idType,
      ${PlayerFields.name} $textType,
      ${PlayerFields.firstName} $textType,
      ${PlayerFields.lastName} $textType,
      ${PlayerFields.age} $integerType,
      ${PlayerFields.dateOfBirth} $textType,
      ${PlayerFields.height} $textType,
      ${PlayerFields.weight} $textType,
      ${PlayerFields.nationality} $textType,
      ${PlayerFields.injured} $boolType,
      ${PlayerFields.image} $textType,
    )""");
  }

  Future<Player> createPlayer(Player player) async {
    final database = await instance.database;
    final id = await database.insert(tablePlayers, player.toDatabaseJson());
    return player.copyWith(id: id);
  }

  Future<Player> getPlayer(int id) async {
    final database = await instance.database;

    final maps = await database.query(tablePlayers,
        columns: PlayerFields.values,
        where: "${PlayerFields.id} = ? ?",
        whereArgs: [id]);

    if (maps.isNotEmpty) {
      return Player.fromDatabaseJson(maps.first);
    } else {
      throw Exception("ID $id not found");
    }
  }

  Future<List<Player>> getAllPlayers() async {
    final database = await instance.database;
    final result = await database.query(tablePlayers);

    return result.map((json) => Player.fromDatabaseJson(json)).toList();
  }

  Future<int> update(Player player) async {
    final database = await instance.database;

    return database.update(tablePlayers, player.toDatabaseJson(),
        where: "${PlayerFields.id} = ?", whereArgs: [player.id]);
  }

  Future<int> delete(int id) async {
    final database = await instance.database;

    return await database.delete(
      tablePlayers, 
      where: "${PlayerFields.id} = ?", whereArgs: [id]);
  }

  Future closeDatabase() async {
    final database = await instance.database;
    database.close();
  }
}

const String tablePlayers = "players";

class PlayerFields {
  static const List<String> values = [
    id,
    name,
    firstName,
    lastName,
    age,
    nationality,
    height,
    weight,
    image,
    injured,
    dateOfBirth
  ];
  static const String id = "_id";
  static const String name = "name";
  static const String firstName = "firstName";
  static const String lastName = "lastName";
  static const String age = "age";
  static const String nationality = "lastName";
  static const String height = "height";
  static const String weight = "weight";
  static const String image = "image";
  static const String injured = "injured";
  static const String dateOfBirth = "dateOfBirth";
}
