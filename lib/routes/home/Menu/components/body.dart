import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/bloc/project_bloc/project_bloc.dart';
import 'package:to_do_list/constant/constant.dart';
import 'package:to_do_list/routes/home/Menu/components/widgets/ProjectCard.dart';
import 'package:to_do_list/widgets/CustomSnackBarContent.dart';

import '../../../../data/models/project.dart';

class MenuBody extends StatelessWidget {
  MenuBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _projectNameController =
        TextEditingController();
    final TextEditingController _idController = TextEditingController();
    final TextEditingController _colorController = TextEditingController();
    return BlocConsumer<ProjectBloc, ProjectState>(
      listener: (context, state) {
        if (state is ProjectLoaded) {
          CustomSnackBarContent(
            errorText: "Task Added",
          );
        }
      },
      builder: (context, state) {
        if (state is ProjectLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ProjectError) {
          context.read<ProjectBloc>().add(LoadProjects());
        }
        if (state is ProjectLoaded) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              GridView.builder(
                  shrinkWrap: true,
                  itemCount: state.projects.length,
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1,
                      crossAxisSpacing: 13,
                      mainAxisSpacing: 24),
                  itemBuilder: (BuildContext context, int index) {
                    return ProjectCard(
                      index: index,
                      projects: state.projects,
                    );
                  }),
              SizedBox(height: 24),
              Row(
                children: [
                  SizedBox(width: 30),
                  Align(
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("Title"),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    formInput("ID", _idController),
                                    formInput(
                                        "Project Name", _projectNameController),
                                    formInput("Color", _colorController)
                                  ],
                                ),
                                actions: [
                                  GestureDetector(
                                    child: Text("Add Project"),
                                    onTap: () {
                                      var project = Project(
                                        id: _idController.value.text,
                                        name: _projectNameController.value.text,
                                        number: "0",
                                        color: _colorController.value.text,
                                      );
                                      context
                                          .read<ProjectBloc>()
                                          .add(AddProject(project));
                                      // Navigator.pop(context);
                                    },
                                  ),
                                ],
                              );
                            });
                      },
                      child: Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          color: kBlueTaskColor,
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
                        child: Icon(
                          Icons.add,
                          color: kWhiteTextColor,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          );
        } else {
          return Center(
            child: Text('Error'),
          );
        }
      },
    );
  }

  TextFormField formInput(String name, TextEditingController _controller) {
    return TextFormField(
      controller: _controller,
      onSaved: (value) => _controller.text = value!,
      decoration: InputDecoration(
        hintText: name,
      ),
    );
  }
}
