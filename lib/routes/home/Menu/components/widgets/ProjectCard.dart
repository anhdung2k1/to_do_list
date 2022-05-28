import 'package:flutter/material.dart';

import '../../../../../constant/constant.dart';
import '../../../../../data/models/project.dart';
import '../../../../../widgets/AppText.dart';

class ProjectCard extends StatefulWidget {
  const ProjectCard(
      {
      // required this.tasks,
      required this.index,
      required this.projects,
      Key? key})
      : super(key: key);
  final int index;
  final List<Project> projects;
  // final List<Task> tasks;

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 24, left: 16),
      child: GestureDetector(
        onDoubleTap: () {
          print("${widget.projects[widget.index].name}");
        },
        child: Container(
          height: 180,
          width: 165,
          decoration: BoxDecoration(
            color: kWhiteTextColor,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: Colors.white70,
                spreadRadius: 5,
                blurRadius: 5,
                offset: Offset(0, 3),
              )
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Align(
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    Image.asset("assets/icons/Oval_Outlined.png"),
                    Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                        child: Container(
                          width: 14,
                          height: 14,
                          decoration: BoxDecoration(
                            color: Color(
                                int.parse(widget.projects[widget.index].color)),
                            shape: BoxShape.circle,
                          ),
                        )),
                  ],
                ),
              ),
              AppTextTitle(
                  text: widget.projects[widget.index].id,
                  fontsize: 18,
                  textColor: kTextColor),
              AppTextTitle(
                  text: widget.projects[widget.index].name,
                  fontsize: 18,
                  textColor: kTextColor),
              AppTextTitle(
                  text: "${widget.projects[widget.index].number} Tasks",
                  fontsize: 16,
                  textColor: Color(0xFF9A9A9A))
            ],
          ),
        ),
      ),
    );
  }
}
