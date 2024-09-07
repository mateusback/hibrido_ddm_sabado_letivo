import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;

  DatabaseHelper.internal();

  static Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await initDb();
    return _db!;
  }

  initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'vertebrates.db');

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
        CREATE TABLE vertebrates(
          id INTEGER PRIMARY KEY,
          name TEXT,
          species TEXT,
          vertebralColumnType TEXT
        )
      ''');
    });
  }

  Future<void> close() async {
    var dbClient = await db;
    return dbClient.close();
  }
}
