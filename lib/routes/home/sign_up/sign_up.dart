import 'package:flutter/material.dart';

import 'components/sign_up_body.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = '/sign_up_screen';
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignUpBody(),
    );
  }
}
