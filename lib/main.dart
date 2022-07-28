import 'package:flutter/material.dart';
import 'package:to_do_phase_1/presentation/pages/create_task.dart';
import 'package:to_do_phase_1/presentation/pages/home_layout.dart';
import 'package:to_do_phase_1/presentation/pages/schedule.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/all_tasks': (context) => const HomeLayout(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/create_task': (context) => CreateTask(),
        '/schedule': (context) => const Schedule(),
      },
      home: const HomeLayout(),
    );
  }
}
