import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/constant/constant.dart';
import 'package:to_do_list/data/models/profile.dart';
import 'package:to_do_list/routes/home/Profile/components/statisticCircle.dart';
import 'package:to_do_list/widgets/AppText.dart';

class StatisticCard extends StatelessWidget {
  const StatisticCard({
    required this.list_profile,
    Key? key,
  }) : super(key: key);
  final List<Profile> list_profile;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final auth = FirebaseAuth.instance.currentUser;
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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (var i = 0; i < list_profile.length; i++)
                    if (auth?.email == list_profile[i].email)
                      for (var j = 0; j < list_profile[i].listTask.length; j++)
                        StatisticCircle(
                          color: Color(int.parse(list_profile[i].listColor[j])),
                          text: list_profile[i].listPercentage[j].toString() +
                              "%",
                          title: list_profile[i].listTask[j],
                        ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
