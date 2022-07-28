import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_phase_1/presentation/cubit/cubit.dart';
import 'package:to_do_phase_1/presentation/cubit/states.dart';

import 'package:to_do_phase_1/servcies/task_database.dart';
import 'package:to_do_phase_1/widget/add_task_button.dart';

class ToDoIcon extends StatefulWidget {
  ToDoIcon({Key? key}) : super(key: key);

  @override
  State<ToDoIcon> createState() => _ToDoIconState();
}

class _ToDoIconState extends State<ToDoIcon> {
  DatabaseService db = DatabaseService();
  var tasks;

  @override
  void initState() {
    setState(() {
      getDataFromDatabase();
    });
  }

  getDataFromDatabase() async {
    this.tasks = await db.getDataFromDatebase();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ListView.separated(
          itemBuilder: (context, index) => buildTaskItem(tasks[index]),
          separatorBuilder: (context, index) => Container(
                width: double.infinity,
                height: 1,
                color: Colors.grey[300],
              ),
          itemCount: tasks.length),
    ]);
  }
}

Widget buildTaskItem(tasks) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        CircleAvatar(
          child: Text(
            textAlign: TextAlign.center,

            tasks["date"].toString(),
            //'$tasks[index]["date"]',
            style: TextStyle(fontSize: 11, color: Colors.white),
          ),
          radius: 30,
          backgroundColor: Color.fromARGB(255, 54, 231, 244),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            tasks["title"].toString(),
            maxLines: 1,
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        PopupMenuButton(
            enableFeedback: true,
            itemBuilder: (context) => const [
                  PopupMenuItem(
                    child: Text("Uncompleted"),
                    value: 1,
                  ),
                  PopupMenuItem(
                    child: Text("Favorite"),
                    value: 2,
                  ),
                  PopupMenuItem(
                    child: const Text("Delete"),
                    value: 3,
                  ),
                ]),
      ],
    ),
  );
}
