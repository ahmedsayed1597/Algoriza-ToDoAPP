// ignore_for_file: invalid_required_positional_param

import 'dart:core';

class TaskModel {
  // TaskModel(this.date, this.title, this.startTime, this.endTime, this.reminder);
  var title;
  var date;
  var startTime;
  var endTime;
  var reminder;

  void setTitle(String title) {
    this.title = title;
  }

  getTitle() {
    return this.title;
  }

  void setDate(String date) {
    this.date = date;
  }

  getDate() {
    return this.date;
  }

  void setStartTime(String startTime) {
    this.startTime = startTime;
  }

  getStartTime() {
    return this.startTime;
  }

  void setEndTime(String endTime) {
    this.endTime = endTime;
  }

  getEndTime() {
    return this.endTime;
  }

  void setReminder(String reminder) {
    this.reminder = reminder;
  }

  getReminder() {
    return this.reminder;
  }

  // static final columns = ["title", "date", "time"];
  // TaskModel(this.title, this.date, this.time);
  // factory TaskModel.fromMap(Map<dynamic, dynamic> data) {
  //   return TaskModel(
  //     data['title'],
  //     data['date'],
  //     data['time'],
  //   );
  // }
  // Map<String, dynamic> toMap() => {
  //       "title": title,
  //       "date": date,
  //       "time": time,
  //     };
}
