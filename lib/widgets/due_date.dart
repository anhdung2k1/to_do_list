import 'package:flutter/material.dart';
import 'package:to_do_list/constant/constant.dart';
import 'package:to_do_list/widgets/AppText.dart';
import 'package:to_do_list/widgets/default_button.dart';

import '../routes/home/components/head_date.dart';
import 'Date_Due.dart';

class DueDate extends StatefulWidget {
  DueDate({Key? key}) : super(key: key);

  @override
  State<DueDate> createState() => _DueDateState();
}

class _DueDateState extends State<DueDate> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: AppTextTitle(
        fontsize: 14,
        text: 'AUGUST 2018',
        textColor: kTextColor,
      ),
      content: Container(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          HeadDate(width: 32, color: kTextColor),
          Date_Due(function: () {}, index_begin: 0, index_end: 7),
          Date_Due(function: () {}, index_begin: 7, index_end: 14),
          Date_Due(function: () {}, index_begin: 14, index_end: 21),
          Date_Due(function: () {}, index_begin: 21, index_end: 28),
          Date_Due(function: () {}, index_begin: 28, index_end: 35),
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: DefaultButton(
                text: 'Done',
                color: kWhiteTextColor,
                backgroundcolor: kPrimaryColor,
                customWidth: 150),
          )
        ],
      )),
    );
  }
}
