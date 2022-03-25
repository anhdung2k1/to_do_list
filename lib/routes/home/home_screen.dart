import 'package:to_do_list/constant/constant.dart';
import 'package:to_do_list/routes/home/AddCheckList/add_checklist.dart';
import 'package:to_do_list/routes/home/AddTask/AddNewTask.dart';
import 'package:to_do_list/routes/home/Menu/menu.dart';
import 'package:to_do_list/routes/home/Profile/profile.dart';
import 'package:to_do_list/routes/home/Quick/quick.dart';
import 'package:to_do_list/widgets/AppText.dart';

import 'AddQuickNote/add_quick_note.dart';
import 'components/body.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/home_screen';
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  List<Widget> listWidget = [Body(), Menu(), Quick(), Profile()];
  List<String> listHeader = ['Work List', 'Project', 'Quick Notes', 'Profile'];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: AppTextTitle(
            text: listHeader[currentIndex],
            fontsize: 20,
            textColor: kWhiteTextColor),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {},
            child: Container(
              child: Image.asset(
                "assets/icons/menu.png",
                width: 50,
                height: 21,
              ),
            ),
          ),
        ],
      ),
      body: listWidget[currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: size.width,
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0xFFE4E4E4))),
                        child: TextButton(
                          child: Text(
                            "Add Task",
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'AvenirNextRoundedPro',
                                color: Color(0xFF313131)),
                          ),
                          onPressed: () async {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddNewTask()),
                                (route) => false);
                          },
                        ),
                      ),
                      Container(
                        width: size.width,
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0xFFE4E4E4))),
                        child: TextButton(
                            child: Text(
                              "Add Quick Note",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'AvenirNextRoundedPro',
                                  color: Color(0xFF313131)),
                            ),
                            onPressed: () async {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AddQuickNote()),
                                  (route) => false);
                            }),
                      ),
                      Container(
                        width: size.width,
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0xFFE4E4E4))),
                        child: TextButton(
                            child: Text(
                              "Add CheckList",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'AvenirNextRoundedPro',
                                  color: Color(0xFF313131)),
                            ),
                            onPressed: () async {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AddCheckList()),
                                  (route) => false);
                            }),
                      ),
                    ],
                  ),
                );
              });
        },
        child: Icon(Icons.add),
        elevation: 4.0,
        backgroundColor: Color(0xFFF96060),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/icons/work_list_my_task_ac.png"),
                color: kIconColor,
              ),
              label: "My Task",
              backgroundColor: kBackgroundBottomNavColor),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/icons/work_list_menu.png"),
                color: kIconColor,
              ),
              label: "Menu",
              backgroundColor: kBackgroundBottomNavColor),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/icons/work_list_quick.png"),
                  color: kIconColor),
              label: "Quick",
              backgroundColor: kBackgroundBottomNavColor),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/icons/work_list_profile.png"),
                  color: kIconColor),
              label: "Profile",
              backgroundColor: kBackgroundBottomNavColor)
        ],
        onTap: setBottomBarIndex,
        selectedItemColor: Color(0xFFFFFFFF),
        currentIndex: currentIndex,
      ),
    );
  }
}
