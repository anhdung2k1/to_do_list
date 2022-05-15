import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/bloc/bloc/task_bloc.dart';
import 'package:to_do_list/routes/home/components/task_card.dart';

class TestPageBody extends StatelessWidget {
  const TestPageBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        BlocBuilder<TaskBloc, TaskState>(
            buildWhen: (previous, current) => false,
            builder: (context, state) {
              if (state is TaskLoading) {
                return Center(child: CircularProgressIndicator());
              }
              if (state is TaskLoaded &&
                  context.read<TaskBloc>().state is TaskLoaded) {
                context.read<TaskBloc>().add(LoadTasks(state.tasks));
              }
              if (state is TaskLoaded) {
                return Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: state.tasks.length,
                    itemBuilder: (BuildContext context, int index) {
                      return TaskCard(
                        index: index,
                        tasks: state.tasks,
                      );
                    },
                  ),
                );
              } else {
                return Text("Something went wrong");
              }
            }),
      ],
    );
  }
}
