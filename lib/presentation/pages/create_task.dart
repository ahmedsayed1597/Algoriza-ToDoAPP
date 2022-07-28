import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:to_do_phase_1/models/task_model.dart';
import 'package:to_do_phase_1/servcies/task_database.dart';

import '../cubit/cubit.dart';
import '../cubit/states.dart';

class CreateTask extends StatelessWidget {
  CreateTask({Key? key}) : super(key: key);
  var titleController = TextEditingController();
  var dateController = TextEditingController();
  var startTimeController = TextEditingController();
  var endTimeController = TextEditingController();
  DatabaseService db = DatabaseService();
  String reminderController = '';

  TaskModel taskmodel = new TaskModel();

  List<String> reminderOptions = <String>[
    '1 day before',
    '1 hour before',
    '30 min before',
    '10 min before',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_rounded, color: Colors.black),
          ),
          elevation: 0.5,
          backgroundColor: Colors.white,
          title: const Text(
            "Add task",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Stack(children: [
          ListView(
            children: [
              titleFieldInput(
                  titleController, "Title", "Design team meating", taskmodel),
              dateFieldInput(
                  dateController, "Date", "2022-05-28", context, taskmodel),
              Row(
                children: [
                  Flexible(
                    child: startTimeFieldInput(startTimeController,
                        "Start time", "09:00 Am", context, taskmodel),
                  ),
                  Flexible(
                    child: endTimeFieldInput(endTimeController, "End time",
                        "14:30 Pm", context, taskmodel),
                  ),
                ],
              ),
              reminderInput(
                  reminderOptions, "Remind", "10 minute early", taskmodel),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CreateTaskButton(context, taskmodel, titleController, db),
          ),
        ]),
      ),
    );
  }
}

Widget titleFieldInput(titleController, label, hintText, taskmodel) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 15,
        ),
        TextFormField(
          onChanged: (value) {
            //taskButton.setTitle(value);
            //CreateTaskButton().setTitle(value);
            taskmodel.setTitle(value);
            var x = taskmodel.getTitle();
            print(x + "ahmed");
            //CreateTaskButton().title = x;

            //print(titleController.text);
          },
          controller: titleController,
          validator: (value) {
            print(titleController.text);
            if (value == null || value.isEmpty) {
              print(value);

              return 'Please enter some text';
            }
            print(titleController.text);
            return null;
          },
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: const BorderSide(
                color: Colors.grey,
              ),
            ),
            filled: true,
            fillColor: const Color.fromARGB(255, 240, 235, 235),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide.none),
            //border: InputBorder.none,
            hintText: hintText,
          ),
        ),
      ],
    ),
  );
}

Widget startTimeFieldInput(
    timeController, label, hintText, context, taskmodel) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 15,
        ),
        TextFormField(
          onChanged: (value) {
            //taskmodel.setStartTime(value);
          },
          showCursor: false,
          keyboardType: TextInputType.none,
          controller: timeController,
          onTap: () {
            showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            ).then((value) {
              timeController.text = value?.format(context).toString();
              taskmodel.setStartTime(timeController.text);

              print(
                value!.format(context),
              );
            });
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              print(value);
              return 'Please enter some text';
            }
            print(timeController);
            return null;
          },
          decoration: InputDecoration(
              suffixIcon: const Icon(Icons.alarm),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: const BorderSide(
                  color: Colors.grey,
                ),
              ),
              filled: true,
              fillColor: const Color.fromARGB(255, 240, 235, 235),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide.none),
              //border: InputBorder.none,
              hintText: hintText),
        ),
      ],
    ),
  );
}

Widget endTimeFieldInput(timeController, label, hintText, context, taskmodel) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 15,
        ),
        TextFormField(
          onChanged: (value) {
            //taskmodel.setEndtTime(value);
          },
          showCursor: false,
          keyboardType: TextInputType.none,
          controller: timeController,
          onTap: () {
            showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            ).then((value) {
              timeController.text = value?.format(context).toString();
              taskmodel.setEndTime(timeController.text);
              print(
                value!.format(context),
              );
            });
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              print(value);
              return 'Please enter some text';
            }
            print(timeController);
            return null;
          },
          decoration: InputDecoration(
              suffixIcon: const Icon(Icons.alarm),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: const BorderSide(
                  color: Colors.grey,
                ),
              ),
              filled: true,
              fillColor: const Color.fromARGB(255, 240, 235, 235),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide.none),
              //border: InputBorder.none,
              hintText: hintText),
        ),
      ],
    ),
  );
}

Widget dateFieldInput(dateController, label, hintText, context, taskmodel) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 15,
        ),
        TextFormField(
          onChanged: (value) {
            //taskmodel.setDate(value);
          },
          showCursor: false,
          keyboardType: TextInputType.none,
          controller: dateController,
          onTap: () {
            showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime.parse('2030-05-03'),
            ).then((value) {
              dateController.text = DateFormat.yMMMd().format(value!);
              taskmodel.setDate(dateController.text);
              print(
                DateFormat.yMMMd().format(value!),
              );
            });
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              print(value);
              return 'Please enter some text';
            }
            print(dateController);
            return null;
          },
          decoration: InputDecoration(
              suffixIcon: const Icon(
                Icons.arrow_drop_down,
                color: Colors.grey,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: const BorderSide(
                  color: Colors.grey,
                ),
              ),
              filled: true,
              fillColor: const Color.fromARGB(255, 240, 235, 235),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide.none),
              //border: InputBorder.none,
              hintText: hintText),
        ),
      ],
    ),
  );
}

Widget reminderInput(List<String> reminderOptionList, String label,
    String hintText, TaskModel taskmodel) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 15),
        DropdownButtonFormField(
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: const BorderSide(
                color: Colors.grey,
              ),
            ),
            filled: true,
            fillColor: const Color.fromARGB(255, 240, 235, 235),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide.none),
            //border: InputBorder.none,
          ),
          hint: Text(hintText),
          items:
              reminderOptionList.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (value) {
            taskmodel.setReminder(value.toString());
          },
        ),
      ],
    ),
  );
}

Widget CreateTaskButton(context, taskmodel, titleController, db) {
  return Padding(
    padding: const EdgeInsets.all(20),
    child: Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          primary: Colors.green,
        ),
        onPressed: () async {
          await db.insertToDatabase(
            title: taskmodel.getTitle(),
            date: taskmodel.getDate(),
            startTime: taskmodel.getStartTime(),
            endTime: taskmodel.getEndTime(),
            reminder: taskmodel.getReminder(),
          );
          //ToDoCubit().allTasks();

          // print(CreateTask().taskModel.getTitle());
          // var x = taskmodel.getTitle();
          // print(x);

          //List<Map> tasks = await db.getDataFromDatebase();

          //print(tasks[3]["title"]);

          Navigator.pushNamed(context, '/all_tasks');
        },
        child: const Text('Create a task'),
      ),
    ),
  );
}
