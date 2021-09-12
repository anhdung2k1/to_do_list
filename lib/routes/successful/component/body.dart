import 'package:to_do_list/constant/constant.dart';
import 'package:to_do_list/routes/home/home_screen.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget{
  const Body({Key?key}): super(key:key);
  @override
  _BodyState createState() => _BodyState();
}
class _BodyState extends State<Body>
{
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: (){
        setState((){
          Navigator.pushNamed(context, HomeScreen.routeName,);
        });
      },
      child: Container(
        width: size.width,
          height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget> [
            Image.asset("assets/images/successful.png",
            width: 162,
                height: 170,
            ),
            SizedBox(height: 40),
            Text(
              "Succesful ! ",
              style: TextStyle(
                fontSize: 32,
                color: kTextColor,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "You have successfully change password. \nPlease use your new networks when \nlogging in.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: kTextColor,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}