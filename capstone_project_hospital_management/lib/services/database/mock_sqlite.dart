import 'package:capstone_project_hospital_management/model/mock_patient.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabasePatient {
  static final DatabasePatient _databasePatient = DatabasePatient._internal();

  factory DatabasePatient() => _databasePatient;
  DatabasePatient._internal();

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    //melakukan inisialisasi data
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();

    // final path = join(databasePath, 'nft_database.db');
    final path = join(databasePath, 'mockPatient.db');

    return await openDatabase(
      path,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE mockpatient(id INTEGER PRIMARY KEY AUTOINCREMENT, idPatient INTEGER NOT NULL, name TEXT NOT NULL, doB INTEGER NOT NULL, address TEXT NOT NULL, gender TEXT NOT NULL, diagnosis TEXT NOT NULL, prescription TEXT NOT NULL, isDone BOOLEAN NOT NULL)',
        );
      },
      version: 1,
      onConfigure: (db) async => await db.execute('PRAGMA foreign_keys = ON'),
    );
  }

  Future<int> insertPatient(MockPatient patient) async {
    final db = await _databasePatient.database;

    final hasil = await db.insert(
      'mockpatient',
      patient.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return hasil;
  }

  Future<MockPatient> certainPatient(int id) async {
    final db = await _databasePatient.database;
    final List<Map<String, dynamic>> maps =
        await db.query('mockpatient', where: 'id = ?', whereArgs: [id]);
    return MockPatient.fromMap(maps[0]);
  }

  Future<MockPatient> namePatient(String name) async {
    final db = await _databasePatient.database;
    final List<Map<String, dynamic>> maps =
        await db.query('mockpatient', where: 'name = ?', whereArgs: [name]);
    return MockPatient.fromMap(maps[0]);
  }

  Future<List<MockPatient>> patients() async {
    final db = await _databasePatient.database;
    final List<Map<String, dynamic>> maps = await db.query('mockpatient');
    return List.generate(
        maps.length, (index) => MockPatient.fromMap(maps[index]));
  }

  Future<void> updatePatient(MockPatient patient) async {
    final db = await _databasePatient.database;

    await db.update(
      'mockpatient',
      patient.toMap(),
      where: 'id = ?',
      whereArgs: [patient.id],
    );
  }
}
