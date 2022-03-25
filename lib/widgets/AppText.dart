import 'package:flutter/material.dart';

@immutable
class AppTextTitle extends StatelessWidget {
  String text;
  double fontsize;
  Color textColor;
  AppTextTitle(
      {required this.text,
      required this.fontsize,
      required this.textColor,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: 'AvenirNextRoundedPro',
          fontSize: fontsize,
          color: textColor,
          fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    );
  }
}

class AppTextBody extends StatelessWidget {
  String content;
  double fontsize;
  Color textColor;
  AppTextBody(
      {required this.content,
      required this.fontsize,
      required this.textColor,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: TextStyle(
          fontFamily: 'AvenirNextRoundedPro',
          fontSize: fontsize,
          color: textColor,
          fontWeight: FontWeight.w400),
      textAlign: TextAlign.center,
    );
  }
}
