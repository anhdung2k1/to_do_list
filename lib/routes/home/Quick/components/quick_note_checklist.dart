import 'package:flutter/material.dart';
import 'package:to_do_list/data/models/quick.dart';

import 'note_icon.dart';

class QuickCheckList extends StatefulWidget {
  final String title;
  int index;
  final Color color;
  QuickCheckList(
      {required this.title, required this.index, required this.color, Key? key})
      : super(key: key);

  @override
  State<QuickCheckList> createState() => _QuickCheckListState();
}

class _QuickCheckListState extends State<QuickCheckList> {
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
                  color: widget.color,
                  width: 120,
                  height: 3,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  widget.title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                for (int i = 0; i < listQuick.length; i++)
                  NoteIcon(
                    index: i,
                    text: listQuick[i].text,
                    check: listQuick[i].confirm,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
