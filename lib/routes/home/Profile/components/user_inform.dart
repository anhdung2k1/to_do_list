import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/constant/constant.dart';
import 'package:to_do_list/routes/sign_in/sign_in_screen.dart';
import 'package:to_do_list/widgets/AppText.dart';

import '../../../../bloc/auth_bloc/auth_bloc.dart';

class UserInform extends StatelessWidget {
  const UserInform({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is UnAuthenticated) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => SignInScreen()),
              (route) => false);
        }
      },
      child: Container(
        margin: EdgeInsets.all(15),
        padding: EdgeInsets.all(15),
        width: size.height - 32.0,
        height: 190,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () {},
                child: Image.asset("assets/icons/setting.png"),
              ),
            ),
            Row(
              children: [
                InkWell(
                    onTap: () {},
                    child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: user.photoURL != null
                            ? Image.network("${user.photoURL}")
                            : Container())),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppTextTitle(
                          text:
                              "${user.displayName != null ? user.displayName : "N/A"}",
                          fontsize: 18,
                          textColor: kTextColor),
                      AppTextBody(
                          content: "${user.email}",
                          fontsize: 16,
                          textColor: kGreyTextColor)
                    ],
                  ),
                ),
              ],
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    AppTextTitle(
                        text: "120", fontsize: 18, textColor: kTextColor),
                    AppTextTitle(
                        text: "Create Tasks",
                        fontsize: 16,
                        textColor: kGreyTextColor),
                  ],
                ),
                Column(
                  children: [
                    AppTextTitle(
                        text: "80", fontsize: 18, textColor: kTextColor),
                    AppTextTitle(
                        text: "Completed Tasks",
                        fontsize: 16,
                        textColor: kGreyTextColor),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
