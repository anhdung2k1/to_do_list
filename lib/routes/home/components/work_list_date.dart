import 'package:flutter/material.dart';
class WorkListDate extends StatelessWidget{
  const WorkListDate({
    Key ? key,
    required this.date,
}) : super(key: key);
  final String date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 17,
        left: 20,
        bottom: 10,
      ),
      child: Text(
        date.toUpperCase(),
        style: TextStyle(
          fontSize: 14,
          color: Color(0xFF9A9A9A),
        ),
      ),
    );
  }
}