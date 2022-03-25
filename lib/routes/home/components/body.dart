import 'package:to_do_list/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/routes/home/components/ValueDate.dart';

import 'head_date.dart';
import 'task_card.dart';
import 'work_list_date.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isToday = true;
  bool isFullMonth = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: builderAppBar(size),
      body: Container(
        height: size.height,
        child: Stack(
          children: [
            Positioned(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    !isToday
                        ? Padding(
                            padding: const EdgeInsets.only(
                              top: 14,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "August 2018 ".toUpperCase(),
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            isFullMonth = !isFullMonth;
                                          });
                                        },
                                        child: Image.asset(
                                          isFullMonth
                                              ? "assets/icons/month_up.png"
                                              : "assets/icons/month_down.png",
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                HeadDate(),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 6,
                                    horizontal: 17,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      ValueDate(
                                        index: 0,
                                      ),
                                      ValueDate(
                                        index: 1,
                                      ),
                                      ValueDate(
                                        index: 2,
                                      ),
                                      ValueDate(
                                        index: 3,
                                      ),
                                      ValueDate(
                                        index: 4,
                                      ),
                                      ValueDate(
                                        index: 5,
                                      ),
                                      ValueDate(
                                        index: 6,
                                      ),
                                    ],
                                  ),
                                ),
                                isFullMonth
                                    ? Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 6,
                                          horizontal: 17,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            ValueDate(
                                              index: 7,
                                            ),
                                            ValueDate(
                                              index: 8,
                                            ),
                                            ValueDate(
                                              index: 9,
                                            ),
                                            ValueDate(
                                              index: 10,
                                            ),
                                            ValueDate(
                                              index: 11,
                                            ),
                                            ValueDate(
                                              index: 12,
                                            ),
                                            ValueDate(
                                              index: 13,
                                            ),
                                          ],
                                        ),
                                      )
                                    : SizedBox(),
                                isFullMonth
                                    ? Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 6,
                                          horizontal: 17,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            ValueDate(
                                              index: 14,
                                            ),
                                            ValueDate(
                                              index: 15,
                                            ),
                                            ValueDate(
                                              index: 16,
                                            ),
                                            ValueDate(
                                              index: 17,
                                            ),
                                            ValueDate(
                                              index: 18,
                                            ),
                                            ValueDate(
                                              index: 19,
                                            ),
                                            ValueDate(
                                              index: 20,
                                            ),
                                          ],
                                        ),
                                      )
                                    : SizedBox(),
                                isFullMonth
                                    ? Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 6,
                                          horizontal: 17,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            ValueDate(
                                              index: 21,
                                            ),
                                            ValueDate(
                                              index: 22,
                                            ),
                                            ValueDate(
                                              index: 23,
                                            ),
                                            ValueDate(
                                              index: 24,
                                            ),
                                            ValueDate(
                                              index: 25,
                                            ),
                                            ValueDate(
                                              index: 26,
                                            ),
                                            ValueDate(
                                              index: 27,
                                            ),
                                          ],
                                        ),
                                      )
                                    : SizedBox(),
                                isFullMonth
                                    ? Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 6,
                                          horizontal: 17,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            ValueDate(
                                              index: 28,
                                            ),
                                            ValueDate(
                                              index: 29,
                                            ),
                                            ValueDate(
                                              index: 30,
                                            ),
                                            ValueDate(
                                              index: 31,
                                            ),
                                            ValueDate(
                                              index: 32,
                                            ),
                                            ValueDate(
                                              index: 33,
                                            ),
                                            ValueDate(
                                              index: 34,
                                            ),
                                          ],
                                        ),
                                      )
                                    : SizedBox(),
                                SizedBox(height: 20),
                                Container(
                                  height: 1,
                                  width: size.width,
                                  color: kTextColor.withOpacity(.1),
                                )
                              ],
                            ),
                          )
                        : SizedBox(),
                    Container(
                      width: double.infinity,
                      color: Color(0xFFFDFDFD),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 8),
                          WorkListDate(date: "Today, Aug 4/2018"),
                          TaskCard(
                            index: 0,
                          ),
                          TaskCard(
                            index: 1,
                          ),
                          TaskCard(
                            index: 2,
                          ),
                          WorkListDate(date: "Tomorrow,Aug 5/2018"),
                          TaskCard(
                            index: 3,
                          ),
                          TaskCard(
                            index: 4,
                          ),
                          TaskCard(
                            index: 5,
                          ),
                          SizedBox(height: 80)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar builderAppBar(Size size) {
    return AppBar(
      automaticallyImplyLeading: false,
      actions: [
        InkWell(
          onTap: () {
            setState(() {
              isToday = true;
            });
          },
          child: Container(
            width: size.width * .5,
            child: Stack(
              children: [
                Positioned(
                  top: 18,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Text(
                      "Today",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.white.withOpacity(isToday ? 1 : .5),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 1,
                  left: 46,
                  child: Container(
                    width: 96,
                    height: 3,
                    color: Colors.white.withOpacity(isToday ? 1 : 0),
                  ),
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              isToday = false;
            });
          },
          child: Container(
            width: size.width * .5,
            child: Stack(
              children: [
                Positioned(
                  top: 18,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Text(
                      "Month",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.white.withOpacity(isToday ? .5 : 1),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 1,
                  left: 46,
                  child: Container(
                    width: 96,
                    height: 3,
                    color: Colors.white.withOpacity(isToday ? 0 : 1),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
