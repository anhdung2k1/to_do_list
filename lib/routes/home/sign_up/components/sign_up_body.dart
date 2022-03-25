import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/auth/authentication.dart';
import 'package:to_do_list/auth/google_sign_in.dart';
import 'package:to_do_list/constant/constant.dart';
import 'package:to_do_list/helper/keyboard.dart';
import 'package:to_do_list/routes/home/forgot_password/forgot_password_screen.dart';
import 'package:to_do_list/routes/home/home_screen.dart';
import 'package:to_do_list/routes/sign_in/sign_in_screen.dart';
import 'package:to_do_list/widgets/AppText.dart';
import 'package:to_do_list/widgets/default_button.dart';
import 'package:to_do_list/widgets/default_button_with_icons.dart';
import 'package:to_do_list/widgets/form_error.dart';
import 'package:to_do_list/widgets/sign_in.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({Key? key}) : super(key: key);

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  final List<String> errors = [];
  final _formKey = GlobalKey<FormState>();
  void addError({required String error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({required String error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String? email;
  String? password;
  String? name;
  bool remember = false;

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
              child: Form(
                key: _formKey,
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
                      text2: "Sign up to create your account",
                    ),
                    buildNameFormField(),
                    SizedBox(height: 32),
                    buildEmailFormField(),
                    SizedBox(height: 32),
                    buildPasswordFormField(),
                    FormError(errors: errors),
                    SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, SignInScreen.routeName);
                          },
                          child: AppTextBody(
                            content: "Sign In",
                            fontsize: 18,
                            textColor: kTextColor,
                          ),
                        ),
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
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          KeyboardUtil.hideKeyboard(context);
                        }
                        setState(() {
                          errors.clear();
                          signup(email!, password!);
                        });
                      },
                      child: DefaultButton(
                        text: 'Sign Up',
                        backgroundcolor: kPrimaryColor,
                        color: Colors.white,
                        customWidth: size.width - 48,
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: AppTextTitle(
                          text: "Or Sign In",
                          fontsize: 18,
                          textColor: kTextColor),
                    ),
                    SizedBox(height: 20),
                    InkWell(
                      onTap: () async {
                        final provider = Provider.of<GoogleSignInProvider>(
                            context,
                            listen: false);
                        await provider.googleLogin();
                        if (provider.hasListeners)
                          Navigator.pushNamed(context, HomeScreen.routeName);
                      },
                      child: Row(
                        children: [
                          DefaultButtonGoogle(
                            text: 'Sign In With Google',
                            backgroundcolor: kPurpleTaskColor,
                            color: Colors.white,
                            customWidth: size.width - 48,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: "Please Enter your Password");
        } else if (value.length >= 8) {
          removeError(error: "Password is too short");
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: "Please Enter your Password");
          return "";
        } else if (value.length < 8) {
          addError(error: "Password is too short");
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: "Please Enter your Email");
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: "Please Enter your Email");
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Username",
        hintText: "Enter your username",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  TextFormField buildNameFormField() {
    return TextFormField(
      onSaved: (newValue) => name = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: "Please Enter your Name");
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: "Please Enter your Name");
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Name",
        hintText: "Enter your Name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
