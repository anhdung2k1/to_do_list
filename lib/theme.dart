import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:to_do_list/constant/constant.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: "Multi",
    inputDecorationTheme: inputDecorationTheme(),
    appBarTheme: appBarTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

InputDecorationTheme inputDecorationTheme() {
  return InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
    hintStyle: TextStyle(
      color: kLightTextColor,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: 2,
    ),
    labelStyle: TextStyle(
      color: kTextColor,
      fontSize: 20,
      fontWeight: FontWeight.w400,
    ),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    backgroundColor: kPrimaryColor,
    elevation: 0,
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.normal,
    ),
    systemOverlayStyle: SystemUiOverlayStyle.dark,
  );
}
