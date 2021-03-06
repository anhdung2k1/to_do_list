import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/bloc/task_bloc/task_bloc.dart';
import 'package:to_do_list/constant/constant.dart';
import 'package:to_do_list/widgets/AppText.dart';

import '../../../data/models/tasks.dart';

class TaskCard extends StatefulWidget {
  const TaskCard({
    Key? key,
    required this.index,
    required this.tasks,
  }) : super(key: key);
  final int index;
  final List<Task> tasks;
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
                          widget.tasks[widget.index].confirm =
                              !widget.tasks[widget.index].confirm;
                        });
                      },
                      child: Image.asset(
                        widget.tasks[widget.index].confirm
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
                        widget.tasks[widget.index].text,
                        style: TextStyle(
                          fontSize: 16,
                          decoration: widget.tasks[widget.index].confirm
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        widget.tasks[widget.index].time,
                        style: TextStyle(
                          fontSize: 16,
                          decoration: widget.tasks[widget.index].confirm
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
                    color: widget.tasks[widget.index].confirm
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
              child: FlatButton(
                onPressed: () async {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content:
                              Column(mainAxisSize: MainAxisSize.min, children: [
                            AppTextBody(
                                content: "Do you want to delete",
                                fontsize: 18,
                                textColor: kTextColor),
                            Row(
                              children: [
                                Container(
                                  width: size.width / 4,
                                  height: 100,
                                  child: FlatButton(
                                    onPressed: () {
                                      context.read<TaskBloc>().add(DeleteTasks(
                                          widget.tasks[widget.index]));
                                    },
                                    child: Text("Yes"),
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  width: size.width / 4,
                                  height: 100,
                                  child: FlatButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("No"),
                                  ),
                                )
                              ],
                            )
                          ]),
                        );
                      });
                },
                child: Image.asset(
                  "assets/icons/work_list_delete.png",
                  width: 16,
                  height: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
