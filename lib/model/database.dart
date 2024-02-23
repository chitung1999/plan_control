import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'plan.dart';

class PlanDB {
  static final PlanDB _planDB = PlanDB._internal();
  factory PlanDB() => _planDB;
  PlanDB._internal();

  static Database? _database;

  Future<Database> get database async {
    _database ??= await initDB();
    return _database!;
  }

  Future<Database> initDB() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = join(dir.path, "PlanDB.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute(
          "CREATE TABLE PlanDB ("
            "title TEXT,"
            "time TEXT,"
            "description TEXT,"
            "isCompleted BIT"
          ")"
        );
      }
    );
  }

  Future<List<Plan>> getPlans() async {
    final db = await _planDB.database;
    var data = await db.rawQuery('SELECT * FROM PlanDB');
    List<Plan> plans =
    List.generate(data.length, (index) => Plan.fromMap(data[index]));
    return plans;
  }

  Future<void> insertPlan(Plan plan) async {
    final db = await _planDB.database;
    await db.rawInsert(
      'INSERT INTO PlanDB(title, time, description, isCompleted ) VALUES(?,?,?,?)',
      [plan.title, plan.time, plan.description, plan.isCompleted]
    );
  }

  // Future<void> editMovie(PlanItem plan) async {
  //   final db = await _planDB.database;
  //   await db.rawUpdate(
  //     'UPDATE PlanDB SET title=?,time=?,description=? WHERE ID=?',
  //     [plan.title, plan.time, plan.description, plan.isCompleted]
  //   );
  // }

  // Future<void> deleteMovie(String id) async {
  //   final db = await _databaseService.database;
  //   var data = await db.rawDelete('DELETE from Movies WHERE id=?', [id]);
  //   log('deleted $data');
  // }
}