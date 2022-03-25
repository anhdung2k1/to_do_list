import 'package:flutter/material.dart';
import 'package:to_do_list/constant/constant.dart';
import 'package:to_do_list/routes/home/AddTask/components/AddMember.dart';

import '../AddMemberTitle.dart';
import '../AddTaskButton.dart';
import '../DescriptionTitle.dart';
import '../HeaderTitle.dart';
import '../InputDescription.dart';
import '../InputTitle.dart';
import '../SelectDueDate.dart';

class AddTaskBody extends StatefulWidget {
  const AddTaskBody({Key? key}) : super(key: key);

  @override
  _AddTaskBodyState createState() => _AddTaskBodyState();
}

class _AddTaskBodyState extends State<AddTaskBody> {
  final textController = TextEditingController();
  final titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          width: size.width,
          height: 44,
          child: Container(
            color: kPrimaryColor,
          ),
        ),
        Positioned(
            bottom: 0,
            width: size.width,
            height: 90,
            child: Container(color: kBackgroundBottomNavColor)),
        Positioned(
            top: 0,
            left: 0,
            width: size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                height: size.height * 0.75,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 0.9,
                          blurRadius: 0.3,
                          offset: Offset(0, 3),
                          color: Color.fromRGBO(221, 221, 221, 0.5))
                    ]),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(24),
                        child: HeaderTitle(),
                      ),
                      SizedBox(height: 24),
                      InputTitle(controller: titleController),
                      SizedBox(height: 16),
                      DescriptionTitle(),
                      SizedBox(height: 12),
                      InputDescription(controller: textController),
                      SizedBox(height: 24),
                      SelectDueDate(),
                      SizedBox(height: 24),
                      AddMemberTitle(),
                      SizedBox(height: 8),
                      AddMember(),
                      SizedBox(height: 36),
                      AddTaskButton(
                        title: "Add Task",
                        press: () {},
                      ),
                      SizedBox(height: 54)
                    ],
                  ),
                ),
              ),
            ))
      ],
    );
  }
}
