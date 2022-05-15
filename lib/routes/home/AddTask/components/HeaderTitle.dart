import 'package:flutter/material.dart';
import 'package:to_do_list/constant/constant.dart';

class HeaderTitle extends StatelessWidget {
  const HeaderTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            Text(
              'For',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(width: 8),
            Container(
              width: 130,
              height: 50,
              decoration: BoxDecoration(
                  color: Color(0xFFF4F4F4),
                  borderRadius: BorderRadius.circular(40)),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage(AvatarImagePath),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Anh Dung".toString().substring(0, 8),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            )
          ],
        ),
        Spacer(),
        Row(
          children: [
            Text('In',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            SizedBox(width: 8),
            Container(
              width: 90,
              height: 50,
              decoration: BoxDecoration(
                  color: Color(0xFFF4F4F4),
                  borderRadius: BorderRadius.circular(40)),
              child: InkWell(
                onTap: () {},
                child: Center(
                  child: Text(
                    "Project",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
