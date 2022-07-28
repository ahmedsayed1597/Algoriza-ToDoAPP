import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqlDp {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await intialDb();
      return _db;
    } else {
      return _db;
    }
  }

  intialDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, "ahmed3.db");
    Database mydb = await openDatabase(path, onCreate: _oncreate);
  }

  _oncreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE Tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT, reminder TEXT)');
    print('onCreate ================================');
  }

  readData() async {
    Database? mydb = await this.db;
    List<Map> response = await mydb!.rawQuery('SELECT * FROM "Tasks"');
    return response;
  }

  insertData() async {
    Database? mydb = await this.db;
    int response = await mydb!.rawInsert(
        'INSERT INTO Tasks (title, date, time, status, reminder) VALUES("ahmed","mohamed", "22:00am", "uncompleted", "10 minutes early")');
    return response;
  }

  updateData() async {
    Database? mydb = await this.db;
    int response = await mydb!.rawUpdate(
        'INSERT INTO Tasks (title, date, time, status, reminder) VALUES("ahmed","mohamed", "22:00am", "uncompleted", "10 minutes early")');
    return response;
  }

  deleteData() async {
    Database? mydb = await this.db;
    int response = await mydb!.rawDelete(
        'INSERT INTO Tasks (title, date, time, status, reminder) VALUES("ahmed","mohamed", "22:00am", "uncompleted", "10 minutes early")');
    return response;
  }
}
