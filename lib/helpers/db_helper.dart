import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  factory DBHelper() => _instance;
  DBHelper._internal();

  static Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'store.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE favorites(
            id INTEGER PRIMARY KEY,
            title TEXT,
            description TEXT,
            image TEXT
          );
        ''');
      },
    );
  }

  // INSERT FAVORITE
  Future<int> insertFavorite(Map<String, dynamic> data) async {
    final client = await db;
    return await client.insert(
      "favorites",
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // GET FAVORITES
  Future<List<Map<String, dynamic>>> getFavorites() async {
    final client = await db;
    return await client.query("favorites", orderBy: "id DESC");
  }

  // DELETE FAVORITE
  Future<int> deleteFavorite(int id) async {
    final client = await db;
    return await client.delete("favorites", where: "id = ?", whereArgs: [id]);
  }
}
