import 'package:flutter/material.dart';
import 'package:to_do_list/routes/home/Profile/components/statistic_card.dart';
import 'package:to_do_list/routes/home/Profile/components/task_card.dart';
import 'package:to_do_list/routes/home/Profile/components/user_inform.dart';

import '../../../../data/models/profile.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          UserInform(size: size),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          for (var i = 0; i < listProfile.length; i++)
                            TaskCardProfile(
                                title: listProfile[i].title,
                                tasknum: listProfile[i].event,
                                text: listProfile[i].text,
                                color: listProfile[i].color),
                        ]),
                  ),
                  StatisticCard(
                    event: 60,
                    quickNote: 40,
                    toDo: 80,
                  )
                ],
              ))
        ]));
  }
}
