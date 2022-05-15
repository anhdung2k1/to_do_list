import 'package:flutter/material.dart';
import 'package:to_do_list/routes/home/TestScreen/components/test_page_body.dart';

class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TestPageBody(),
    );
  }
}
