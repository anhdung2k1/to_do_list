import 'package:flutter/material.dart';
import 'package:to_do_list/constant/constant.dart';
import 'package:to_do_list/routes/home/home_screen.dart';
import 'package:to_do_list/widgets/AppText.dart';
import 'components/body/AddTaskbody.dart';

class AddNewTask extends StatelessWidget {
  const AddNewTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: AddTaskBody(),
    );
  }

  PreferredSize buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(100),
      child: AppBar(
        automaticallyImplyLeading: false,
        title: AppTextTitle(
            text: 'New Task', textColor: kWhiteTextColor, fontsize: 20),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
                (route) => false);
          },
          child: Container(
            child: Image.asset(
              "assets/icons/Fill 1.png",
              width: 50,
              height: 21,
            ),
          ),
        ),
      ),
    );
  }
}
