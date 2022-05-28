import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String email;
  final String name;
  final String phone;
  final String photoURL;
  final Timestamp birthday;

  User({
    required this.id,
    required this.email,
    required this.name,
    required this.phone,
    required this.photoURL,
    required this.birthday,
  });

  @override
  List<Object?> get props => [id, email, name, phone, photoURL, birthday];

  static User fromJson(Map<String, dynamic> json) {
    User user = User(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      phone: json['phone'],
      photoURL: json['photoURL'],
      birthday: json['birthday'],
    );
    return user;
  }

  Map<String, dynamic> toJson() => {
        'id': this.id,
        'email': this.email,
        'name': this.name,
        'phone': this.phone,
        'photoURL': this.photoURL,
        'birthday': this.birthday,
      };
  User.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : name = doc.data()!["name"],
        id = doc.data()!["id"],
        email = doc.data()!["email"],
        phone = doc.data()!["phone"],
        photoURL = doc.data()!["photoURL"],
        birthday = doc.data()!["birthday"];
}
