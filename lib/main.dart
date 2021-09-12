import 'package:flutter/material.dart';
import 'package:to_do_list/theme.dart';
import 'package:to_do_list/routes/walkthrough/walkthrough_screen.dart';
import 'package:to_do_list/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      title: 'To-do-list',
      theme: theme(),
      routes: routes,
      initialRoute: WalkThroughScreen.routeName,
    );
  }
}