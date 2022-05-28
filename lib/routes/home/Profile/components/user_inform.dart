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
    required this.email,
    required this.phoneNumber,
    required this.photoUrl,
    required this.name,
  }) : super(key: key);

  final Size size;
  final String email;
  final String phoneNumber;
  final String photoUrl;
  final String name;

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  InkWell(
                      onTap: () {
                        Hero(
                          tag: '${photoUrl}',
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: NetworkImage(photoUrl),
                          ),
                        );
                      },
                      child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: user?.photoURL != null
                              ? Image.network(
                                  "${user?.photoURL}",
                                  width: 80,
                                  height: 80,
                                  fit: BoxFit.cover,
                                )
                              : Image.network(
                                  "${photoUrl}",
                                  width: 80,
                                  height: 80,
                                  fit: BoxFit.cover,
                                ))),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AppTextTitle(
                            text:
                                "${user?.displayName != null ? user?.displayName : name}",
                            fontsize: 18,
                            textColor: kTextColor),
                        AppTextBody(
                            content:
                                "${user?.email != null ? user?.email : email}",
                            fontsize: 16,
                            textColor: kGreyTextColor),
                        AppTextBody(
                            content:
                                "${user?.phoneNumber != null ? user?.phoneNumber : phoneNumber}",
                            fontsize: 16,
                            textColor: kGreyTextColor)
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: IconButton(
                        icon: Icon(Icons.exit_to_app_outlined,
                            color: kPrimaryColor),
                        onPressed: () =>
                            context.read<AuthBloc>().add(SignOutRequested())),
                  )
                ],
              ),
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
