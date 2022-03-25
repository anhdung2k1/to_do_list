import 'package:flutter/material.dart';
import 'package:to_do_list/constant/constant.dart';

class InputDescription extends StatelessWidget {
  const InputDescription({required this.controller, Key? key})
      : super(key: key);
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Container(
        height: 120,
        width: 295,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Color(0xFFFFFFFF),
            border: Border.all(color: Color(0xFFEAEAEA))),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 120,
                width: size.width,
                decoration: BoxDecoration(
                    color: Color(0xFFFFFF),
                    borderRadius: BorderRadius.circular(3),
                    border: Border.all(color: Color(0xFFEAEAEA))),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        controller: controller,
                        maxLines: 1,
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    Container(
                      color: Color(0xFFF8F8F8),
                      width: size.width,
                      height: 48,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: kDefaultPadding - 8.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: InkWell(
                            onTap: () {
                              print("Click Clipboard");
                            },
                            child: Image.asset(
                              "assets/icons/Clipboard.png",
                              width: 19,
                              height: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
