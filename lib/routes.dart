import 'package:to_do_list/routes/home/forgot_password/forgot_password_screen.dart';
import 'package:to_do_list/routes/home/home_screen.dart';
import 'package:to_do_list/routes/home/sign_up/sign_up.dart';
import 'package:to_do_list/routes/reset_password/reset_password_screen.dart';
import 'package:to_do_list/routes/successful/successful_screen.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/routes/sign_in/sign_in_screen.dart';
import 'package:to_do_list/routes/walkthrough/walkthrough_screen.dart';

final Map<String, WidgetBuilder> routes = {
  WalkThroughScreen.routeName: (context) => WalkThroughScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  ResetPasswordScreen.routeName: (context) => ResetPasswordScreen(),
  SuccessfulScreen.routeName: (context) => SuccessfulScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
};
