import 'package:flutter/material.dart';

class InputTitle extends StatelessWidget {
  InputTitle({required this.controller, Key? key}) : super(key: key);
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 344,
      height: 66,
      child: TextFormField(
        controller: controller,
        onSaved: (value) => controller.text = value!,
        showCursor: false,
        decoration: InputDecoration(
            hintText: 'Title',
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            contentPadding: EdgeInsets.only(left: 24, top: 20),
            hintStyle: TextStyle(
                fontFamily: 'AvenirNextRoundedPro',
                fontSize: 18,
                fontWeight: FontWeight.bold)),
        style: TextStyle(
            fontSize: 18,
            fontFamily: 'AvenirNextRoundedPro',
            fontWeight: FontWeight.bold),
        textAlign: TextAlign.start,
      ),
      color: Color(0xFFF4F4F4),
    );
  }
}
