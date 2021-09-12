import 'package:to_do_list/routes/reset_password/reset_password_screen.dart';
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
                    text1: "Forgot Password",
                    text2:
                        "Please enter your email below to recevie \nyour password reset instructions",
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Username",
                      hintText: "Enter your username",
                    ),
                  ),
                  SizedBox(height: 32),
                  InkWell(
                    onTap: () {
                      setState(() {
                        Navigator.pushNamed(
                          context,
                          ResetPasswordScreen.routeName,
                        );
                      });
                    },
                    child: DefaultButton(
                      text: 'Send Request',
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
