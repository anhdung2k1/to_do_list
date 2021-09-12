import 'package:flutter/material.dart';
import 'component/body.dart';

class SuccessfulScreen extends StatelessWidget{
  static String routeName = '/successful_screen';
  const SuccessfulScreen({Key ? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Body(),
    );
  }
}