import 'package:bmi_app/features/bmi/domain/entities/bmi_history.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class BmiLocalDataSource {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'bmi_history.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE bmi_history (
        id INTEGER PRIMARY KEY AUTOINCREMENT, 
        weight REAL, 
        height REAL,
        isMetric INTEGER,
        bmiValue REAL, 
        category INTEGER
        )
        ''');
      },
    );
  }

  Future<void> insertHistory(BmiHistory history) async {
    final db = await database;
    await db.insert('bmi_history', {
      'weight': history.input.weight,
      'height': history.input.height,
      'isMetric': history.input.isMetric ? 1 : 0,
      'bmiValue': history.result.bmiValue,
      'category': history.result.resultCategory.category.index,
    });
  }

  Future<List<BmiHistory>> getHistory() async {
    final db = await database;
    final maps = await db.query('bmi_history', orderBy: 'id DESC');
    return maps.map((element) {
      return BmiHistory.fromMap(element);
    }).toList();
  }

  Future<void> deleteHistory(int id) async {
    final db = await database;
    await db.delete('bmi_history', where: 'id = ?', whereArgs: [id]);
  }
}
