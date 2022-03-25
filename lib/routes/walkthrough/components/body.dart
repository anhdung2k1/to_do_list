import 'package:to_do_list/routes/sign_in/sign_in_screen.dart';
import 'package:to_do_list/widgets/default_button.dart';
import 'package:flutter/material.dart';

import 'package:to_do_list/constant/constant.dart';
import 'content.dart';
import 'welcome.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  // ignore: unused_field
  PageController _pageController = PageController(initialPage: 0);
  int indexWalkThrough = 0;
  List<Map<String, String>> walkThroughData = [
    {
      "image1": "assets/images/walk_through_1_1.png",
      "image2": "assets/images/walk_through_1_2.png",
      "text1": "Welcome to aking",
      "text2": "Whats going to happen tomorrow?"
    },
    {
      "image1": "assets/images/walk_through_2_1.png",
      "image2": "assets/images/walk_through_2_2.png",
      "text1": "Work happens",
      "text2": "Get notified when work happens."
    },
    {
      "image1": "assets/images/walk_through_3_1.png",
      "image2": "assets/images/walk_through_3_2.png",
      "text1": "Tasks and assign",
      "text2": "Task and assign them to colleagues."
    },
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return (indexWalkThrough == 0)
        ? InkWell(
            onTap: () {
              setState(() {
                indexWalkThrough++;
              });
            },
            child: Welcome(),
          )
        : SafeArea(
            child: SizedBox(
              width: double.infinity,
              height: size.height,
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 4,
                    child: PageView.builder(
                      controller: _pageController,
                      onPageChanged: (value) {
                        setState(() {
                          indexWalkThrough = value + 1;
                        });
                      },
                      itemCount: 3,
                      itemBuilder: (context, index) => Content(
                        text1: walkThroughData[index]["text1"].toString(),
                        text2: walkThroughData[index]["text2"].toString(),
                        image1: walkThroughData[index]["image1"].toString(),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            walkThroughData.length,
                            (index) => buildDot(index: index),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 250,
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Image.asset(
                                  "${walkThroughData[indexWalkThrough - 1]["image2"]}",
                                  width: size.width,
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  width: size.width,
                                  height: 300,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      SizedBox(height: 40),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            if (indexWalkThrough < 3) {
                                              indexWalkThrough++;
                                              _pageController.animateToPage(
                                                indexWalkThrough - 1,
                                                duration: Duration(
                                                  milliseconds: 300,
                                                ),
                                                curve: Curves.easeIn,
                                              );
                                            } else {
                                              Navigator.pushNamed(context,
                                                  SignInScreen.routeName);
                                            }
                                          });
                                        },
                                        child: DefaultButton(
                                          text: "Get Started",
                                        ),
                                      ),
                                      SizedBox(height: 32),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            Navigator.pushNamed(context,
                                                SignInScreen.routeName);
                                          });
                                        },
                                        child: Text(
                                          "Log In",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 8),
      height: 8,
      width: 8,
      decoration: BoxDecoration(
        color: indexWalkThrough - 1 == index
            ? Colors.black
            : Color.fromARGB(100, 49, 49, 49),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
