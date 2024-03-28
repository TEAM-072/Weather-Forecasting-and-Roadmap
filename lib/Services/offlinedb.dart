import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  static Database? _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDb();
    return _db!;
  }

  DatabaseHelper.internal();

  Future<Database> initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'my_database.db');

    // Open/create the database at a given path
    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        // Create tables
        await db.execute(
            'CREATE TABLE my_table(id INTEGER PRIMARY KEY, name TEXT)');
      },
    );
  }

  Future<int> insertData(String table, Map<String, dynamic> data) async {
    Database dbClient = await db;
    return await dbClient.insert(table, data);
  }

  Future<List<Map<String, dynamic>>> retrieveData(String table) async {
    Database dbClient = await db;
    return await dbClient.query(table);
  }

  Future<int> updateData(String table, Map<String, dynamic> data) async {
    Database dbClient = await db;
    return await dbClient
        .update(table, data, where: 'id = ?', whereArgs: [data['id']]);
  }

  Future<int> deleteData(String table, int id) async {
    Database dbClient = await db;
    return await dbClient.delete(table, where: 'id = ?', whereArgs: [id]);
  }
}
