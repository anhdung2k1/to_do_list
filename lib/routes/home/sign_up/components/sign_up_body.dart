import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/constant/constant.dart';
import 'package:to_do_list/routes/home/forgot_password/forgot_password_screen.dart';
import 'package:to_do_list/routes/sign_in/sign_in_screen.dart';
import 'package:to_do_list/widgets/AppText.dart';
import 'package:to_do_list/widgets/default_button.dart';
import 'package:to_do_list/widgets/default_button_with_icons.dart';
import 'package:to_do_list/widgets/form_error.dart';
import 'package:to_do_list/widgets/sign_in.dart';

import '../../../../bloc/auth_bloc/auth_bloc.dart';
import '../../../../widgets/CustomSnackBarContent.dart';

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

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  bool remember = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
      if (state is Authenticated) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => SignInScreen()));
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
    }, builder: (context, state) {
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
                          onTap: () {
                            _createAccountWithEmailAndPassword(context);
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
                            BlocProvider.of<AuthBloc>(context)
                                .add(GoogleSignInRequested());
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
    });
  }

  void _createAccountWithEmailAndPassword(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<AuthBloc>(context).add(
          SignUpRequested(_emailController.text, _passwordController.text));
    }
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
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

  TextFormField buildNameFormField() {
    return TextFormField(
      onSaved: (newValue) => _nameController.text = newValue!,
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
