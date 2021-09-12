import 'package:flutter/material.dart';

import 'components/body.dart';

class WalkThroughScreen extends StatelessWidget {
  static String routeName = '/walkthrough_screen';
  const WalkThroughScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
