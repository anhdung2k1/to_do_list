import 'package:flutter/material.dart';
import 'package:to_do_list/routes/home/Menu/components/body.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDFDFD),
      body: MenuBody(),
    );
  }
}
