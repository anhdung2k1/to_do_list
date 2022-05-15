import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:to_do_list/data/models/tasks.dart';
import '../../data/repositories/task/task_repository.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskRepository taskRepository;
  TaskBloc({required this.taskRepository}) : super(TaskLoading()) {
    on<LoadTasks>((event, emit) {
      emit(TaskLoading());
      try {
        taskRepository.getAllTask(list_task: event.tasks);
        emit(TaskLoaded());
      } catch (e) {
        emit(UnLoadedTask());
        emit(TaskError(e.toString()));
      }
    });
    on<AddTasks>((event, emit) async {
      emit(TaskLoading());
      try {} catch (e) {
        emit(UnLoadedTask());
        emit(TaskError(e.toString()));
      }
    });
    on<DeleteTasks>((event, emit) async {
      emit(TaskLoading());
      try {} catch (e) {
        emit(UnLoadedTask());
        emit(TaskError(e.toString()));
      }
    });
  }
}
