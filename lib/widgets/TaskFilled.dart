import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do_list/constant/constant.dart';
import '../data/models/tasks.dart';
import 'AppText.dart';

class TaskFilled extends StatefulWidget {
  TaskFilled({
    required this.isSelected,
    required this.text,
    Key? key,
  }) : super(key: key);
  bool isSelected;
  final String text;
  @override
  State<TaskFilled> createState() => _TaskFilledState();
}

class _TaskFilledState extends State<TaskFilled> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
            onPressed: () {
              widget.isSelected = !widget.isSelected;
            },
            child: AppTextTitle(
                text: widget.text, fontsize: 17, textColor: kTextColor)),
        Spacer(),
        widget.isSelected
            ? SvgPicture.asset(
                'assets/icons/tick.svg',
                height: 16,
                width: 12,
                color: Color(0xFF7ED321),
              )
            : Container(height: 20, width: 20),
      ],
    );
  }
}
