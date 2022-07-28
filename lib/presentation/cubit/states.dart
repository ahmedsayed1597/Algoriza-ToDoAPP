abstract class ToDoStates {}

class InitialState extends ToDoStates {}

class AppCreateTask extends ToDoStates {}

class AllTasks extends ToDoStates {}

class AppCreateDatabaseState extends ToDoStates {}

class AppInsertDatabaseState extends ToDoStates {}

class AppGetDatabaseState extends ToDoStates {
  final List<Map> tasks;
  AppGetDatabaseState(this.tasks);
}
