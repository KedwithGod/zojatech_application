import 'package:sqflite/sqflite.dart';

import '../imports/general_import.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future init() async {
    _database = await _initDatabase();

  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'app_database.db');
     print('Database path: $path');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE civil_servant_category(
        id INTEGER PRIMARY KEY,
        name TEXT,
        description TEXT
      )
    ''');
  }

  Future<bool> checkIfTableExists(String tableName) async {
    final db = await database;
    var result = await db.rawQuery(
        "SELECT name FROM sqlite_master WHERE type='table' AND name='$tableName';");
    return result.isNotEmpty;
  }

  Future<void> createTable(String tableName, Map<String, String> fields) async {
    final db = await database;

    // Generate the SQL statement to create the table
    String createTableSQL = _generateCreateTableSQL(tableName, fields);
    await db.execute(createTableSQL);
  }

  String _generateCreateTableSQL(String tableName, Map<String, String> fields) {
    StringBuffer sql = StringBuffer("CREATE TABLE $tableName (");

    // Add fields to the create table statement
    fields.forEach((field, type) {
      sql.write("$field $type, ");
    });

    // Remove the last comma and space, and close the SQL statement
    sql.write(");");
    String sqlString = sql.toString().replaceAll(", );", ");");

    return sqlString;
  }

  Future<int> insertRecord(
      String tableName, Map<String, dynamic> record) async {
    Database db = await database;
    return await db.insert(tableName, record);
  }

  Future<int> updateRecord(
      String tableName, Map<String, dynamic> record, int id) async {
    Database db = await database;
    return await db.update(tableName, record, where: 'id = ?', whereArgs: [id]);
  }

  Future<Map<String, dynamic>?> getRecordById(String tableName, int id) async {
    Database db = await database;
    List<Map<String, dynamic>> maps =
        await db.query(tableName, where: 'id = ?', whereArgs: [id]);
    if (maps.isNotEmpty) {
      return maps.first;
    }
    return null;
  }

  Future<List<Map<String, dynamic>>> getRecords(String tableName) async {
    Database db = await database;
    List<Map<String, dynamic>> maps = await db.query(tableName);
    return maps;
  }

  Future<void> deleteRecord(String tableName, int id) async {
    Database db = await database;
    await db.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }

Map<String, String> generateFieldsMap(Map<String, dynamic> modelInstance) {

    Map<String, String> fieldsMap = {};

    modelInstance.forEach((key, value) {
 
      String fieldType;

      if (key == 'id') {
        fieldType = 'INTEGER PRIMARY KEY';
      } else {
        switch (value.runtimeType) {
          case int:
            fieldType = 'INTEGER';
            break;
          case double:
            fieldType = 'REAL';
            break;
          case String:
            fieldType = 'TEXT';
            break;
          case List:
            fieldType = 'TEXT';
            // Ensure to store the list as a JSON-encoded string
            modelInstance[key] = json.encode(value);
            break;
          default:
            fieldType = 'TEXT';
        }
      }

      fieldsMap[key] = fieldType;
    });

    return fieldsMap;
  }
}
