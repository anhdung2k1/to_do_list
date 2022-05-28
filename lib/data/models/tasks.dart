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

  get isSelected => true;

  @override
  List<Object?> get props => [text, time, confirm];

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
  Task.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : text = doc.data()!["text"],
        confirm = doc.data()!["confirm"],
        time = doc.data()!["time"];
}
