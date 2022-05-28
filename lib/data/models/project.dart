import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Project extends Equatable {
  final String id;
  final String color;
  final String name;
  final String number;

  Project(
      {required this.id,
      required this.color,
      required this.name,
      required this.number});

  @override
  List<Object?> get props => [id, color, name, number];

  static Project fromJson(Map<String, dynamic> json) {
    Project project = Project(
      id: json['id'],
      color: json['color'],
      name: json['name'],
      number: json['number'],
    );
    return project;
  }

  Map<String, dynamic> toJson() => {
        'id': this.id,
        'color': this.color,
        'name': this.name,
        'number': this.number
      };
  Project.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : name = doc.data()!["name"],
        id = doc.data()!["id"],
        number = doc.data()!["number"],
        color = doc.data()!["color"];
}
