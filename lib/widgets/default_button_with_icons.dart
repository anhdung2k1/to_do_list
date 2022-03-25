import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:to_do_list/constant/constant.dart';

class DefaultButtonGoogle extends StatelessWidget {
  const DefaultButtonGoogle({
    Key? key,
    required this.text,
    this.customWidth = 293,
    this.backgroundcolor = Colors.white,
    this.color = Colors.black,
  }) : super(key: key);
  final String text;
  final double customWidth;
  final Color backgroundcolor;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: customWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: backgroundcolor,
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(flex: 2),
            Icon(
              FontAwesomeIcons.google,
              color: kWhiteTextColor,
              size: 32,
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 12,
              ),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 18,
                  color: color,
                ),
              ),
            ),
            Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}
