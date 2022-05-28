import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/bloc/task_bloc/task_bloc.dart';
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
    return BlocBuilder<TaskBloc, TaskState>(
        bloc: BlocProvider.of<TaskBloc>(context),
        builder: (context, state) {
          if (state is TaskLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is TaskLoaded) {
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "August 2018 ".toUpperCase(),
                                                style: TextStyle(
                                                  fontSize: 14,
                                                ),
                                              ),
                                              InkWell(
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
                                            ],
                                          ),
                                          SizedBox(height: 10),
                                          HeadDate(
                                              width: 20, color: kGreyTextColor),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 6,
                                              horizontal: 17,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                for (int i = 0; i < 7; i++)
                                                  ValueDate(
                                                    index: i,
                                                  ),
                                              ],
                                            ),
                                          ),
                                          isFullMonth
                                              ? Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    vertical: 6,
                                                    horizontal: 17,
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: <Widget>[
                                                      for (int i = 7;
                                                          i < 14;
                                                          i++)
                                                        ValueDate(
                                                          index: i,
                                                        )
                                                    ],
                                                  ),
                                                )
                                              : SizedBox(),
                                          isFullMonth
                                              ? Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    vertical: 6,
                                                    horizontal: 17,
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: <Widget>[
                                                      for (int i = 14;
                                                          i < 21;
                                                          i++)
                                                        ValueDate(
                                                          index: i,
                                                        )
                                                    ],
                                                  ),
                                                )
                                              : SizedBox(),
                                          isFullMonth
                                              ? Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    vertical: 6,
                                                    horizontal: 17,
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: <Widget>[
                                                      for (int i = 21;
                                                          i < 28;
                                                          i++)
                                                        ValueDate(
                                                          index: i,
                                                        )
                                                    ],
                                                  ),
                                                )
                                              : SizedBox(),
                                          isFullMonth
                                              ? Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    vertical: 6,
                                                    horizontal: 17,
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: <Widget>[
                                                      for (int i = 28;
                                                          i < 35;
                                                          i++)
                                                        ValueDate(
                                                          index: i,
                                                        )
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
                                    ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: state.tasks.length,
                                      itemBuilder: (context, index) {
                                        return TaskCard(
                                          index: index,
                                          tasks: state.tasks,
                                        );
                                      },
                                    ),
                                    WorkListDate(date: "Tomorrow,Aug 5/2018"),
                                    for (int i = 3; i < 6; i++)
                                      TaskCard(
                                        index: i,
                                        tasks: state.tasks,
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
                ));
          }
          return Container(
            child: Center(
              child: Text("Error"),
            ),
          );
        });
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
