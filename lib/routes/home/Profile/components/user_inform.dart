import 'package:flutter/material.dart';
import 'package:to_do_list/constant/constant.dart';
import 'package:to_do_list/widgets/AppText.dart';

class UserInform extends StatelessWidget {
  const UserInform({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(15),
      width: size.height - 32.0,
      height: 190,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: InkWell(
              onTap: () {},
              child: Image.asset("assets/icons/setting.png"),
            ),
          ),
          Row(
            children: [
              InkWell(
                onTap: () {},
                child: CircleAvatar(
                  maxRadius: 30,
                  backgroundImage: NetworkImage(AvatarImagePath),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppTextTitle(
                        text: "Dustin Tran",
                        fontsize: 18,
                        textColor: kTextColor),
                    AppTextBody(
                        content: "kudung053@gmail.com",
                        fontsize: 16,
                        textColor: kGreyTextColor)
                  ],
                ),
              )
            ],
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  AppTextTitle(
                      text: "120", fontsize: 18, textColor: kTextColor),
                  AppTextTitle(
                      text: "Create Tasks",
                      fontsize: 16,
                      textColor: kGreyTextColor),
                ],
              ),
              Column(
                children: [
                  AppTextTitle(text: "80", fontsize: 18, textColor: kTextColor),
                  AppTextTitle(
                      text: "Completed Tasks",
                      fontsize: 16,
                      textColor: kGreyTextColor),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
