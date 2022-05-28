import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Profile extends Equatable {
  final String email;
  final String id;
  final List<String> listTask;
  final List<String> listColor;
  final List<String> taskNum;
  final List<dynamic> listPercentage;
  Profile(
      {required this.email,
      required this.id,
      required this.listTask,
      required this.taskNum,
      required this.listPercentage,
      required this.listColor});

  @override
  List<Object?> get props =>
      [id, taskNum, email, listTask, listColor, listPercentage];

  static Profile fromJson(Map<String, dynamic> json) {
    Profile profile = Profile(
      id: json['id'],
      taskNum: List.from(json['taskNum']),
      email: json['email'],
      listPercentage: List.from(json['listPercentage']),
      listTask: List.from(json['listTask']),
      listColor: List.from(json['listColor']),
    );
    return profile;
  }

  Map<String, dynamic> toJson() => {
        'id': this.id,
        'email': this.email,
        'taskNum': List.from(this.taskNum),
        'listTask': List.from(this.listTask),
        'listPercentage': List.from(this.listPercentage),
        'listColor': List.from(this.listColor),
      };
  Profile.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : email = doc.data()!["email"],
        id = doc.data()!["id"],
        taskNum = List.from(doc.data()!["taskNum"]),
        listColor = List.from(doc.data()!["listColor"]),
        listPercentage = List.from(doc.data()!["listPercentage"]),
        listTask = List.from(doc.data()!["listTask"]);
}
