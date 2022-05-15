import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/helper/keyboard.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/constant/constant.dart';
import 'package:to_do_list/routes/home/forgot_password/forgot_password_screen.dart';
import 'package:to_do_list/routes/home/home_screen.dart';
import 'package:to_do_list/routes/home/sign_up/sign_up.dart';
import 'package:to_do_list/widgets/AppText.dart';
import 'package:to_do_list/widgets/CustomSnackBarContent.dart';
import 'package:to_do_list/widgets/default_button.dart';
import 'package:to_do_list/widgets/default_button_with_icons.dart';
import 'package:to_do_list/widgets/form_error.dart';
import 'package:to_do_list/widgets/sign_in.dart';

import '../../../bloc/auth_bloc/auth_bloc.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
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

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool remember = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocListener<AuthBloc, AuthState>(listener: (context, state) {
      if (state is Authenticated) {
        Navigator.pushNamed(context, HomeScreen.routeName);
      }
      if (state is AuthError) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: CustomSnackBarContent(
            errorText: state.error,
          ),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ));
      }
    }, child: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      if (state is Loading) {
        return const Center(child: CircularProgressIndicator());
      }
      if (state is UnAuthenticated) {
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
                          text2: "Sign in to continue",
                        ),
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
                                    context, SignUpScreen.routeName);
                              },
                              child: AppTextBody(
                                content: "Sign Up",
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
                          onTap: () {
                            _authenticatedWithEmailAndPassword(context);
                          },
                          child: DefaultButton(
                            text: 'Sign In',
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
                            _authenticatedWithGoogle(context);
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
      return Container();
    }));
  }

  void _authenticatedWithEmailAndPassword(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<AuthBloc>(context).add(
          SignInRequested(_emailController.text, _passwordController.text));
      _formKey.currentState!.save();
      KeyboardUtil.hideKeyboard(context);
    }
  }

  void _authenticatedWithGoogle(BuildContext context) {
    BlocProvider.of<AuthBloc>(context).add(GoogleSignInRequested());
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      controller: _passwordController,
      onSaved: (newValue) => _passwordController.text = newValue!,
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
      controller: _emailController,
      onSaved: (newValue) => _emailController.text = newValue!,
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
}
