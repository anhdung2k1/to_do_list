import 'package:to_do_list/routes/home/home_screen.dart';
import 'package:flutter/material.dart';

import 'package:to_do_list/constant/constant.dart';
import 'package:to_do_list/routes/forgot_password/forgot_password_screen.dart';
import 'package:to_do_list/widgets/default_button.dart';
import 'package:to_do_list/widgets/sign_in.dart';

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
        children: [
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
                    text1: "Welcome back",
                    text2: "Sign in to continue",
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Username",
                      hintText: "Enter your username",
                    ),
                  ),
                  SizedBox(height: 32),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
                      hintText: "Enter your password",
                    ),
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            ForgotPasswordScreen.routeName,
                          );
                        },
                        child: Text(
                          "Forgot password",
                          style: TextStyle(
                            color: kTextColor,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 80),
                  InkWell(
                    onTap: () {
                      setState(() {
                        Navigator.pushNamed(
                          context,
                          HomeScreen.routeName,
                        );
                      });
                    },
                    child: DefaultButton(
                      text: 'Log In',
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
