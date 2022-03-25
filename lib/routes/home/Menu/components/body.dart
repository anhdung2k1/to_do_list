import 'package:flutter/material.dart';
import 'package:to_do_list/constant/constant.dart';
import 'package:to_do_list/widgets/AppText.dart';

class MenuBody extends StatelessWidget {
  MenuBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> ProjectName = ['Personal', 'Teamworks', 'Home', 'Meet'];
    final List<double> TaskNums = [10, 5, 10, 10];
    final List<String> ImagePath = [
      'assets/icons/Oval_PJ_1.png',
      'assets/icons/Oval_PJ_2.png',
      'assets/icons/Oval_PJ_3.png',
      'assets/icons/Oval_PJ_4.png',
    ];
    return Padding(
      padding: EdgeInsets.only(left: 16, top: 51),
      child: GridView.builder(
          itemCount: ProjectName.length,
          gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1,
              crossAxisSpacing: 13,
              mainAxisSpacing: 24),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 180,
              width: 165,
              decoration: BoxDecoration(
                color: kWhiteTextColor,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white70,
                    spreadRadius: 5,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  )
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Stack(
                      children: [
                        Image.asset("assets/icons/Oval_Outlined.png"),
                        Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 6, vertical: 6),
                            child: Image.asset(ImagePath[index])),
                      ],
                    ),
                  ),
                  AppTextTitle(
                      text: "${ProjectName[index]}",
                      fontsize: 18,
                      textColor: kTextColor),
                  AppTextTitle(
                      text: "${TaskNums[index]} Tasks",
                      fontsize: 16,
                      textColor: Color(0xFF9A9A9A))
                ],
              ),
            );
          }),
    );
  }
}
