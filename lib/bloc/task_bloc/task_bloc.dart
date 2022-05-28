import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/data/models/tasks.dart';
import '../../data/repositories/task/task_repository.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskRepository _taskRepository;
  TaskBloc({required TaskRepository taskRepository})
      : _taskRepository = taskRepository,
        super(TaskLoading()) {
    on<LoadTasks>((event, emit) async {
      emit(TaskLoading());
      try {
        List<Task> listofTaskData = await _taskRepository.getAllTask();
        emit(TaskLoaded(listofTaskData));
      } catch (e) {
        emit(UnLoadedTask());
        emit(TaskError(e.toString()));
      }
    });
    on<AddTasks>((event, emit) async {
      emit(TaskLoading());
      try {
        final state = this.state as TaskLoaded;
        emit(TaskLoaded(List<Task>.from(state.tasks)..add(event.task)));
      } catch (e) {
        emit(UnLoadedTask());
        emit(TaskError(e.toString()));
      }
    });
    on<DeleteTasks>((event, emit) async {
      emit(TaskLoading());
      try {
        final state = this.state as TaskLoaded;
        emit(TaskLoaded(List.from(state.tasks)..remove(event.task)));
      } catch (e) {
        emit(UnLoadedTask());
        emit(TaskError(e.toString()));
      }
    });
  }
}
