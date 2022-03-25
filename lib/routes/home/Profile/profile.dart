import 'package:flutter/material.dart';
import 'package:to_do_list/routes/home/Profile/components/profile_body.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProfileBody(),
    );
  }
}
