import 'package:flutter/material.dart';
import 'package:to_do_phase_1/widget/add_task_button.dart';
import 'package:to_do_phase_1/widget/to_do_icon.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    return (SafeArea(
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0.5,
            backgroundColor: Colors.white,
            title: const Text(
              "Board",
              style: TextStyle(color: Colors.black),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/schedule');
                },
                icon: const Icon(
                  Icons.calendar_month,
                  color: Colors.green,
                  size: 35,
                ),
              ),
            ],
            bottom: const TabBar(
              isScrollable: true,
              indicatorColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.label,
              unselectedLabelStyle: TextStyle(color: Colors.red),
              tabs: [
                Tab(
                  child: Text(
                    "All",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Tab(
                  child: Text(
                    "Completed",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Tab(
                  child: Text(
                    "Uncompleted",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Tab(
                  child: Text(
                    "Favorite",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          body: Stack(children: [
            TabBarView(
              children: [
                ToDoIcon(),
                Icon(Icons.directions_transit),
                Icon(Icons.directions_bike),
                Icon(Icons.directions_bike),
              ],
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: AddTaskButton(),
            ),
          ]),
        ),
      ),
    ));
  }
}
