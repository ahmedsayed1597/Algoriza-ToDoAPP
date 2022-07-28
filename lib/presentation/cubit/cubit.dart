import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:to_do_phase_1/presentation/cubit/states.dart';
import 'package:to_do_phase_1/servcies/task_database.dart';
import 'package:path/path.dart';

class ToDoCubit extends Cubit<ToDoStates> {
  ToDoCubit()
      : super(
          InitialState(),
        );

  static ToDoCubit get(context) => BlocProvider.of(context);
  DatabaseService db = DatabaseService();
  /*late Future<Database>*/ late Database database;
  late Database databaseValue;
  var tasks;

  Future CreateDatabase() async {
    //String databasePath = getDatabasesPath().then((value) => {join(value, "ahmed7.db");});
    //String path = join(databasePath, "ahmed7.db");
    database = await openDatabase("ahmed8.db", version: 1,
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

      // getDataFromDatebase().then((value) {
      //   tasks = value;
      //   print(tasks);
      // });
    }).then((value) {
      databaseValue = value;
      emit(AppCreateDatabaseState());
      print("errrrrrrrrrrrrrror");
      throw "eroor";
    });
  }

  void CreatTask() {
    print("Craete Task Page Now");

    emit(AppCreateTask());
  }

  getDataFromDatabase() async {
    this.tasks = db.getDataFromDatebase().then((value) => {this.tasks = value});

    print(tasks);
    emit(getDataFromDatabase());
  }

  allTasks() {
    emit(AllTasks());
    print("all task page");
  }
}
