import 'package:flutter/material.dart';
import 'package:to_do_list/constant/constant.dart';
import 'package:to_do_list/models/profile.dart';
import 'package:to_do_list/widgets/AppText.dart';

class TaskCardProfile extends StatelessWidget {
  String title;
  int tasknum;
  String text;
  Color color;
  TaskCardProfile(
      {required this.title,
      required this.tasknum,
      required this.text,
      required this.color,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 160,
          height: 100,
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: kWhiteTextColor,
                  blurRadius: 5.0,
                  offset: Offset(5, 0),
                )
              ]),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 27, left: 24),
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      AppTextTitle(
                          text: title,
                          fontsize: 18,
                          textColor: kWhiteTextColor),
                      SizedBox(height: 6),
                      AppTextBody(
                          content: tasknum.toString() + " " + text,
                          fontsize: 14,
                          textColor: kWhiteTextColor)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 10)
      ],
    );
  }
}
