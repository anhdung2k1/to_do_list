import 'package:flutter/material.dart';

class NoteIcon extends StatefulWidget {
  final int index;
  final String text;
  bool check;
  NoteIcon(
      {required this.index, required this.text, required this.check, Key? key})
      : super(key: key);

  @override
  State<NoteIcon> createState() => _NoteIconState();
}

class _NoteIconState extends State<NoteIcon> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          widget.check = !widget.check;
        });
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                color: widget.check ? Color(0xFF979797) : Colors.white,
                borderRadius: BorderRadius.circular(3),
                border: Border.all(
                  color: Color(0xFF979797),
                ),
              ),
            ),
          ),
          SizedBox(width: 11),
          Text(
            widget.text,
            style: TextStyle(
              fontSize: 16,
              height: 30 / 16,
              fontWeight: FontWeight.w400,
              decoration: widget.check
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
            ),
          )
        ],
      ),
    );
  }
}
