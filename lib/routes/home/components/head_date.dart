import 'package:flutter/material.dart';

class HeadDate extends StatelessWidget{
  const HeadDate({
    Key ? key,
}) : super(key:key);
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
              width: 20,
                child: Center(
                  child: Text(
                    'M',
                    style: TextStyle(
                      color: Color(0xFF9A9A9A),
                    ),
                  ),
                ),
            ),
            Container(
              width: 20,
                child: Center(
                  child: Text(
                    'T',
                    style: TextStyle(
                      color: Color(0xFF9A9A9A),
                    ),
                  ),
                ),
            ),
            Container(
              width: 20,
                child: Center(
                child: Text(
                  'W',
                  style: TextStyle(
                    color: Color(0xFF9A9A9A),
            ),
                  ),
                ),
            ),
            Container(
              width: 20,
                child: Center(
                child: Text(
                  'T',
                  style: TextStyle(
                    color: Color(0xFF9A9A9A),
            ),
                  ),
                ),
            ),
            Container(
              width: 20,
                child: Center(
                  child: Text(
                    'F',
                    style: TextStyle(
                      color: Color(0xFF9A9A9A),
                    ),
                  ),
                ),
            ),
            Container(
              width: 20,
                child: Center(
                  child: Text(
                    'S',
                    style: TextStyle(
                      color: Color(0xFF9A9A9A),
                    ),
                  ),
                ),
            ),
            Container(
              width: 20,
                child: Center(
                  child: Text(
                    'S',
                    style: TextStyle(
                      color: Color(0xFF9A9A9A),
                    ),
                  ),
                ),
            ),
          ],
      ),
    );
  }
}