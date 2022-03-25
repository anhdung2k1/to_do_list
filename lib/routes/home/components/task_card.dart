import 'package:flutter/material.dart';
import 'package:to_do_list/models/tasks.dart';
import 'package:to_do_list/constant/constant.dart';

class TaskCard extends StatefulWidget {
  const TaskCard({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;
  @override
  _TaskCardState createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            child: Container(
              width: size.width - 32,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(5, 5),
                    color: Color(0xFFE0E0E0).withOpacity(0.5),
                  ),
                  BoxShadow(
                    offset: Offset(9, 0),
                    blurRadius: 5,
                    color: Color(0xFFE0E0E0).withOpacity(0.5),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 27, horizontal: 25),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          ListTasks[widget.index].confirm =
                              !ListTasks[widget.index].confirm;
                        });
                      },
                      child: Image.asset(
                        ListTasks[widget.index].confirm
                            ? "assets/icons/work_list_tick.png"
                            : "assets/icons/work_list_none.png",
                        width: 16,
                        height: 16,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        ListTasks[widget.index].text,
                        style: TextStyle(
                          fontSize: 16,
                          decoration: ListTasks[widget.index].confirm
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        ListTasks[widget.index].time,
                        style: TextStyle(
                          fontSize: 16,
                          decoration: ListTasks[widget.index].confirm
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF9B9B9B),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Container(
                    width: 4,
                    height: 21,
                    color: ListTasks[widget.index].confirm
                        ? kPrimaryColor
                        : Color(0xFF6074F9),
                  )
                ],
              ),
            ),
          ),
          Container(
            height: 70,
            width: 58,
            child: Image.asset(
              "assets/icons/work_list_edit.png",
              width: 16,
              height: 16,
            ),
          ),
          Container(
            height: 70,
            width: 1,
            color: Color(0xFF000000).withOpacity(.1),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Container(
              height: 70,
              width: 58,
              child: Image.asset(
                "assets/icons/work_list_delete.png",
                width: 16,
                height: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
