import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 42,
          ),
          Image.asset(
            "assets/images/logo.png",
            width: size.width * .4,
            fit: BoxFit.fitWidth,
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            "aking",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 48,
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(12, 0),
                  blurRadius: 25.0,
                  color: Colors.black26,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
