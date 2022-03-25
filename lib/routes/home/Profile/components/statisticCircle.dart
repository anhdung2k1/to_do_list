import 'package:flutter/material.dart';
import 'package:to_do_list/constant/constant.dart';
import 'package:to_do_list/widgets/AppText.dart';

class StatisticCircle extends StatelessWidget {
  const StatisticCircle(
      {required this.color, required this.text, required this.title, Key? key})
      : super(key: key);
  final Color color;
  final String text;
  final title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 21, bottom: 14),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                border: Border.all(color: Color(0xFFE8E8E8), width: 1)),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
                    image: AssetImage("assets/images/statistic.png")),
              ),
              child: Center(
                child: AppTextTitle(
                    text: text, fontsize: 18, textColor: kTextColor),
              ),
            ),
          ),
          SizedBox(height: 14),
          AppTextBody(content: title, fontsize: 16, textColor: kTextColor)
        ],
      ),
    );
  }
}
