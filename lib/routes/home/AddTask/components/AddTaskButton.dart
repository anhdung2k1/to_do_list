import 'package:flutter/material.dart';
import 'package:to_do_list/constant/constant.dart';

class AddTaskButton extends StatelessWidget {
  AddTaskButton({required this.title, required this.press, Key? key})
      : super(key: key);
  final Function press;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints.tightFor(width: 295, height: 48),
        child: ElevatedButton(
          onPressed: () => press,
          child:
              Text(title, style: TextStyle(fontSize: 18, color: Colors.white)),
          style: ElevatedButton.styleFrom(
            primary: kPrimaryColor,
          ),
        ),
      ),
    );
  }
}
