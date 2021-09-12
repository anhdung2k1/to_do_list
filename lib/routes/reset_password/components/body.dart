import 'package:to_do_list/routes/successful/successful_screen.dart';
import 'package:to_do_list/widgets/default_button.dart';
import 'package:to_do_list/widgets/sign_in.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            width: size.width,
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 50),
                  InkWell(
                    onTap: () {
                      setState(() {
                        Navigator.pop(context);
                      });
                    },
                    child: SizedBox(
                      child: Image.asset(
                        "assets/icons/navigator_pop.png",
                        width: 25.2,
                        height: 17.71,
                      ),
                    ),
                  ),
                  SignInContent(
                    text1: "Reset Password",
                    text2:
                        "Reset code was sent to your email. Please \nenter the code and creae new password",
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Reset code",
                      hintText: "Enter your number",
                    ),
                  ),
                  SizedBox(height: 38),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "New password",
                      hintText: "Enter your password",
                    ),
                  ),
                  SizedBox(height: 38),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Confirm password",
                      hintText: "Enter your confirm password",
                    ),
                  ),
                  SizedBox(height: 68),
                  InkWell(
                    onTap: () {
                      setState(() {
                        Navigator.pushNamed(
                          context,
                          SuccessfulScreen.routeName,
                        );
                      });
                    },
                    child: DefaultButton(
                      text: 'Change password',
                      backgroundcolor: Color(0xFFF96060),
                      color: Colors.white,
                      customWidth: size.width - 48,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
