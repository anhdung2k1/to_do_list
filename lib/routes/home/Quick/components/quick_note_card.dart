import 'package:flutter/material.dart';

class QuickNoteCard extends StatelessWidget {
  final title, color;
  const QuickNoteCard({required this.title, required this.color, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.all(15),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: [
              BoxShadow(
                  color: Color(0x80E0E0E0).withOpacity(0.5),
                  spreadRadius: 0,
                  blurRadius: 9,
                  offset: Offset(5, 5))
            ]),
        width: size.width - 32.0,
        child: Material(
          child: Padding(
            padding: EdgeInsets.fromLTRB(32, 0, 19, 21),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: color,
                  width: 120,
                  height: 3,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
