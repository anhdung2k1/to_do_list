import 'package:flutter/material.dart';

class SignInContent extends StatelessWidget {
  const SignInContent({
    Key? key,
    required this.text1,
    required this.text2,
  }) : super(key: key);
  final String text1, text2;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 62),
        Text(
          text1,
          style: TextStyle(
            color: Color(0xFF313131),
            fontSize: 32,
          ),
        ),
        SizedBox(height: 12),
        Text(
          text2,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xFF9B9B9B),
          ),
        ),
        SizedBox(height: 48),
      ],
    );
  }
}
