import 'package:flutter/cupertino.dart';
import 'package:to_do_list/constant/constant.dart';

class Profile {
  String title;
  int event;
  String text;
  Color color;
  Profile(
      {required this.title,
      required this.event,
      required this.text,
      required this.color});
  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        title: json['title'],
        event: int.parse(json['event']),
        text: json['text'],
        color: Color(int.parse('0xFF' + json['color'])),
      );
}

List<Profile> listProfile = [
  Profile(title: "Events", event: 12, text: "Tasks", color: kPrimaryColor),
  Profile(title: "To do Task", event: 12, text: "Tasks", color: kBlueTaskColor),
  Profile(
      title: "Block Task", event: 2, text: "Tasks", color: kPurpleTaskColor),
];
