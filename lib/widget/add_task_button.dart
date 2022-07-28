import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_phase_1/presentation/cubit/states.dart';

import '../presentation/cubit/cubit.dart';

class AddTaskButton extends StatelessWidget {
  const AddTaskButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ToDoCubit(),
      child: BlocConsumer<ToDoCubit, ToDoStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
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
                onPressed: () {
                  ToDoCubit()..CreatTask();

                  Navigator.pushNamed(context, '/create_task');
                },
                child: const Text('Add a task'),
              ),
            ),
          );
        },
      ),
    );
  }
}
