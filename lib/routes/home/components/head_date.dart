import 'package:flutter/material.dart';

class HeadDate extends StatelessWidget {
  const HeadDate({
    required this.color,
    required this.width,
    Key? key,
  }) : super(key: key);
  final Color color;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 6,
        horizontal: 17,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: width,
            child: Center(
              child: Text(
                'M',
                style: TextStyle(
                  color: color,
                ),
              ),
            ),
          ),
          Container(
            width: width,
            child: Center(
              child: Text(
                'T',
                style: TextStyle(
                  color: color,
                ),
              ),
            ),
          ),
          Container(
            width: width,
            child: Center(
              child: Text(
                'W',
                style: TextStyle(
                  color: color,
                ),
              ),
            ),
          ),
          Container(
            width: width,
            child: Center(
              child: Text(
                'T',
                style: TextStyle(
                  color: color,
                ),
              ),
            ),
          ),
          Container(
            width: width,
            child: Center(
              child: Text(
                'F',
                style: TextStyle(
                  color: color,
                ),
              ),
            ),
          ),
          Container(
            width: width,
            child: Center(
              child: Text(
                'S',
                style: TextStyle(
                  color: color,
                ),
              ),
            ),
          ),
          Container(
            width: width,
            child: Center(
              child: Text(
                'S',
                style: TextStyle(
                  color: color,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
