import 'package:flutter/material.dart';
import 'package:to_do_list/constant/constant.dart';
import 'package:to_do_list/routes/home/Profile/components/statisticCircle.dart';
import 'package:to_do_list/widgets/AppText.dart';

class StatisticCard extends StatelessWidget {
  const StatisticCard({
    required this.event,
    required this.toDo,
    required this.quickNote,
    Key? key,
  }) : super(key: key);
  final double event, toDo, quickNote;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Container(
        width: size.width,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                  offset: Offset(2, 10),
                  blurRadius: 3,
                  color: Color(0x80E3E3E3))
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppTextTitle(
                text: "Statistic", fontsize: 18, textColor: kTextColor),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                StatisticCircle(
                  color: kPrimaryColor,
                  text: event.toString() + "%",
                  title: "Events",
                ),
                StatisticCircle(
                  color: kBlueTaskColor,
                  text: toDo.toString() + "%",
                  title: "To do",
                ),
                StatisticCircle(
                  color: kPurpleTaskColor,
                  text: quickNote.toString() + "%",
                  title: "Quick Notes",
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
