import 'package:flutter/material.dart';
import 'package:to_do_list/constant/constant.dart';
import 'package:to_do_list/data/models/dates.dart';

class ValueDate extends StatelessWidget {
  const ValueDate({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      width: 20,
      child: Column(
        children: [
          Center(
            child: Text(
              DataCustom[index].day.toString(),
              style: TextStyle(
                color: DataCustom[index].isMonth
                    ? Colors.black
                    : Color(0xFF9A9A9A),
              ),
            ),
          ),
          SizedBox(height: 11),
          Container(
            width: 5,
            height: 5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: !DataCustom[index].isTask ? Colors.white : kPrimaryColor,
            ),
          )
        ],
      ),
    );
  }
}
