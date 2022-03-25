import 'package:flutter/material.dart';

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
                    backgroundImage: NetworkImage(
                        'https://scontent.fdad1-2.fna.fbcdn.net/v/t1.6435-9/152856388_2217721551693547_8820192401419514335_n.jpg?_nc_cat=106&ccb=1-5&_nc_sid=730e14&_nc_ohc=Wxm9uLvPzmcAX-7rQ8H&_nc_ht=scontent.fdad1-2.fna&oh=00_AT-6ER74p8Mg4sVJjZhhIkmJP56kP9t2YVSaBxevBcdwPA&oe=622E4345'),
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
