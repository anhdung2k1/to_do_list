import 'package:flutter/material.dart';
import 'package:to_do_list/routes/home/Quick/components/quick_body.dart';

class Quick extends StatelessWidget {
  const Quick({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: QuickBody(),
    );
  }
}
