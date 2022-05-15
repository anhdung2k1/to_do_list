import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do_list/constant/constant.dart';

class CustomSnackBarContent extends StatelessWidget {
  const CustomSnackBarContent({
    required this.errorText,
    Key? key,
  }) : super(key: key);
  final String errorText;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: EdgeInsets.all(16),
          height: 90,
          decoration: BoxDecoration(
            color: Color(0xFFC72C41),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Row(
            children: [
              const SizedBox(width: 48),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Oh snap!",
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                    const Spacer(),
                    Text(
                      errorText,
                      style: TextStyle(fontSize: 14, color: kGreenTaskColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
            bottom: 0,
            child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                ),
                child: SvgPicture.asset(
                  "assets/icons/bubbles.svg",
                  height: 48,
                  width: 40,
                  color: Color(0xFF801336),
                ))),
        Positioned(
            top: -20,
            left: 0,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset("assets/icons/fail.svg", height: 40),
                Positioned(
                    top: 10,
                    child:
                        SvgPicture.asset("assets/icons/close.svg", height: 16)),
              ],
            ))
      ],
    );
  }
}
