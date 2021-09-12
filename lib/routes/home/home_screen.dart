import 'components/body.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget{
  static String routeName = '/home_screen';
  const HomeScreen({Key ? key}): super (key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen>
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Work List",),
        centerTitle: true,
        actions: [
          InkWell(onTap: (){},
            child: Container(
          child: Image.asset("assets/icons/menu.png",
          width: 50,
          height: 21,
          ),),
          ),
        ],
      ),
      body: Body(),
    );
  }
}