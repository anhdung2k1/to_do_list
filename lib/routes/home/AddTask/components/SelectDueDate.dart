import 'package:flutter/material.dart';

class SelectDueDate extends StatelessWidget {
  const SelectDueDate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 66,
      color: Color(0xFFF4F4F4),
      child: Row(
        children: [
          SizedBox(width: 25),
          Text("Due Date",
              style: TextStyle(
                  fontFamily: 'Avenir Next Rounded',
                  fontSize: 16,
                  fontWeight: FontWeight.w400)),
          SizedBox(width: 8),
          ConstrainedBox(
            constraints: BoxConstraints.tightFor(width: 90, height: 32),
            child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Anytime",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF6074F9),
                )),
          ),
        ],
      ),
    );
  }
}
