import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/bloc/profile_bloc/profile_bloc.dart';
import 'package:to_do_list/routes/home/Profile/components/statistic_card.dart';
import 'package:to_do_list/routes/home/Profile/components/task_card.dart';
import 'package:to_do_list/routes/home/Profile/components/user_inform.dart';

import '../../../../data/models/profile.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final auth = FirebaseAuth.instance.currentUser;
    return BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
      if (state is ProfileLoading) {
        return Center(child: CircularProgressIndicator());
      }
      if (state is UnLoadedProfile) {
        context.read<ProfileBloc>().add(LoadProfile());
      }
      if (state is ProfileLoaded) {
        return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              for (int i = 0; i < state.users.length; i++)
                if (auth?.email == state.users[i].email)
                  UserInform(
                    size: size,
                    email: state.users[i].email,
                    name: state.users[i].name,
                    phoneNumber: state.users[i].phone,
                    photoUrl: state.users[i].photoURL,
                  ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            for (var i = 0; i < state.profiles.length; i++)
                              if (auth?.email == state.profiles[i].email)
                                for (var j = 0;
                                    j < state.profiles[i].listTask.length;
                                    j++)
                                  TaskCardProfile(
                                      title: state.profiles[i].listTask[j],
                                      tasknum: int.parse(
                                          state.profiles[i].taskNum[j]),
                                      text: "Tasks",
                                      color: Color(int.parse(
                                          state.profiles[i].listColor[j]))),
                          ]),
                    ),
                  ),
                  StatisticCard(
                    list_profile: state.profiles,
                  )
                ],
              )
            ]));
      } else {
        return Text('Error');
      }
    });
  }
}
