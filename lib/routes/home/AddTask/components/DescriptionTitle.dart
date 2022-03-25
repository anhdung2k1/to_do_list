import 'package:flutter/material.dart';
import 'package:to_do_list/constant/constant.dart';

class DescriptionTitle extends StatelessWidget {
  const DescriptionTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Text("Description",
          style: TextStyle(
              fontFamily: 'Avenir Next Rounded',
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xFF9E9E9E)),
          textAlign: TextAlign.center),
    );
  }
}
