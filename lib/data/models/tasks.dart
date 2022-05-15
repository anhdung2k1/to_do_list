import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final String text;
  final String time;
  bool confirm;

  Task({
    required this.text,
    required this.time,
    required this.confirm,
  });
  Task copyWith({bool? confirm, String? text, String? time}) {
    return Task(
      text: text ?? this.text,
      confirm: confirm ?? this.confirm,
      time: time ?? this.time,
    );
  }

  @override
  List<Object?> get props => [text, time, confirm];

  static Task fromSnapshot(DocumentSnapshot snapshot) {
    Task task = Task(
        confirm: snapshot['confirm'],
        text: snapshot['text'],
        time: snapshot['time']);
    return task;
  }

  static Task fromJson(Map<String, dynamic> json) {
    Task task = Task(
      confirm: json['confirm'],
      text: json['text'],
      time: json['time'],
    );
    return task;
  }

  Map<String, dynamic> toJson() => {
        'text': this.text,
        'confirm': this.confirm,
        'time': this.time,
      };
}

List<Task> list_task_raw = [
  Task(
    text: 'Task 1',
    time: '10:00',
    confirm: false,
  ),
  Task(
    text: 'Task 2',
    time: '10:00',
    confirm: false,
  ),
  Task(
    text: 'Task 3',
    time: '10:00',
    confirm: false,
  ),
  Task(
    text: 'Task 4',
    time: '10:00',
    confirm: false,
  ),
  Task(
    text: 'Task 5',
    time: '10:00',
    confirm: false,
  ),
  Task(
    text: 'Task 6',
    time: '10:00',
    confirm: false,
  ),
  Task(
    text: 'Task 7',
    time: '10:00',
    confirm: false,
  ),
  Task(
    text: 'Task 8',
    time: '10:00',
    confirm: false,
  ),
];
