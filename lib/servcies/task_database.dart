import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:to_do_phase_1/models/task_model.dart';
import 'package:path/path.dart';

class DatabaseService {
  //DatabaseService._privateConstructor();
  // static final DatabaseService instance = DatabaseService._privateConstructor();

  late Database database;
  late List<Map> tasks;

  Future<void> CreateDatabase() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, "ahmed7.db");

    database = await openDatabase(path, version: 1,
        onCreate: (database, int version) async {
      print("created");

      await database
          .execute(
              'CREATE TABLE Tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, startTime TEXT, endTime TEXT, status TEXT, reminder TEXT)')
          .then((value) {
        print("Database created");
        //return true;
      }).catchError((error) {
        print(
          error.toString(),
        );
        //return false;
      });
    }, onOpen: (database) {
      print("opent");

      getDataFromDatebase().then((value) {
        tasks = value;
        print(tasks);
      });
    });
  }

  Future insertToDatabase({
    @required String? title,
    @required String? date,
    @required String? startTime,
    @required String? endTime,
    @required String? reminder,
  }) async {
    await CreateDatabase();
    return await database.transaction(
      (txn) async {
        txn
            .rawInsert(
                'INSERT INTO Tasks (title, date, startTime, endTime, status, reminder) VALUES("$title","$date", "$startTime", "$endTime","uncompleted", "$reminder")')
            .then((value) {
          print("Inserted sucessfully");
        }).catchError((error) {
          print(
            error.toString(),
          );
        });
        return null;
      },
    );
  }

  Future<List<Map>> getDataFromDatebase() async {
    await CreateDatabase();
    return await database.rawQuery('SELECT * FROM "Tasks"');
  }

  // Future<List<TaskModel>> getDataFromDatebase() async {
  //   // final db = await database;
  //   List<Map> results =
  //       await database.query("Tasks", columns: TaskModel.columns);

  //   results.forEach((result) {
  //     TaskModel task = TaskModel.fromMap(result);
  //     tasks.add(task);
  //   });
  //   return tasks;
  // }
}
