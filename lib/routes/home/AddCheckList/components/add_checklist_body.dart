import 'package:flutter/material.dart';
import 'package:to_do_list/constant/constant.dart';
import 'package:to_do_list/routes/home/AddCheckList/components/check_item.dart';
import 'package:to_do_list/routes/home/AddTask/components/AddTaskButton.dart';
import 'package:to_do_list/widgets/AppText.dart';
import 'package:to_do_list/widgets/choose_color_icon.dart';

class AddCheckListBody extends StatefulWidget {
  AddCheckListBody({Key? key}) : super(key: key);

  @override
  State<AddCheckListBody> createState() => _AddCheckListBodyState();
}

class _AddCheckListBodyState extends State<AddCheckListBody> {
  int indexChooseColor = 0;

  int indexCheckItem = 4;

  void _setColor(int index) {
    setState(() {
      indexChooseColor = index;
    });
  }

  bool disable = true;
  final _formKey = GlobalKey<FormState>();

  final _descriptionController = TextEditingController();
  List<TextEditingController> _listItemController = [
    for (int i = 0; i < 10; i++) TextEditingController()
  ];
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
            )),
        Positioned(
            top: 10,
            left: 0,
            width: size.width,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                height: size.height * 0.8,
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(24),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: AppTextTitle(
                                fontsize: 18,
                                text: 'Title',
                                textColor: kTextColor,
                              ),
                            ),
                          ),
                          TextFormField(
                            controller: _descriptionController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText:
                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                                hintStyle: TextStyle(color: kTextColor)),
                            maxLines: 2,
                          ),
                          for (int i = 0; i < indexCheckItem; i++)
                            CheckItem(
                                index: i, controller: _listItemController[i]),
                          SizedBox(height: 12),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    if (indexCheckItem < 10) indexCheckItem++;
                                  });
                                },
                                child: AppTextTitle(
                                  fontsize: 16,
                                  text: '+ Add new item',
                                  textColor: kTextColor,
                                ),
                              ),
                              Spacer(),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    if (indexCheckItem > 1) indexCheckItem--;
                                  });
                                },
                                child: AppTextTitle(
                                  fontsize: 16,
                                  textColor: kTextColor,
                                  text: 'Remove item',
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 40),
                          Align(
                            alignment: Alignment.topLeft,
                            child: AppTextTitle(
                                text: "Choose Color",
                                fontsize: 18,
                                textColor: kTextColor),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 17),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                for (int i = 0; i < 5; i++)
                                  ChooseColorIcon(
                                    index: i,
                                    press: _setColor,
                                    tick: i == indexChooseColor,
                                  )
                              ],
                            ),
                          ),
                          AddTaskButton(title: "Done", press: () {})
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ))
      ],
    );
  }
}
