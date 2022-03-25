import 'package:flutter/material.dart';
import 'package:to_do_list/constant/constant.dart';

class AddMember extends StatelessWidget {
  const AddMember({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Container(
        width: 90,
        height: 48,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            color: Color(0xFFF4F4F4)),
        child: InkWell(
          onTap: () {},
          child: Center(
            child: Text(
              "Anyone",
              style: TextStyle(
                  color: Color(0xFF313131),
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
