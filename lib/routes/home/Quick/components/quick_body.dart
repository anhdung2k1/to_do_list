import 'package:flutter/material.dart';
import 'package:to_do_list/constant/constant.dart';
import 'package:to_do_list/routes/home/Quick/components/quick_note_card.dart';
import 'package:to_do_list/routes/home/Quick/components/quick_note_checklist.dart';

class QuickBody extends StatefulWidget {
  const QuickBody({Key? key}) : super(key: key);

  @override
  State<QuickBody> createState() => _QuickBodyState();
}

class _QuickBodyState extends State<QuickBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuickNoteCard(
            title: 'Meeting with Jessica in Central Park at 10:30PM',
            color: kBlueTaskColor,
          ),
          QuickCheckList(
            title: 'Home work today',
            index: 0,
            color: kGreenTaskColor,
          ),
          QuickNoteCard(
            title: 'Replace dashboard icon with more colorful ones',
            color: kPinkTaskColor,
          ),
          QuickNoteCard(
            title: 'Meeting with Jessica in Central Park at 10:30PM',
            color: kBlueTaskColor,
          ),
          QuickNoteCard(
            title: 'Replace dashboard icon with more colorful ones',
            color: kPinkTaskColor,
          ),
        ],
      ),
    );
  }
}
