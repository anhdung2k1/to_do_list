part of 'task_bloc.dart';

abstract class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object> get props => [];
}

class TaskLoading extends TaskState {}

class TaskLoaded extends TaskState {
  final List<Task> tasks;

  TaskLoaded({this.tasks = const <Task>[]});

  @override
  List<Object> get props => [tasks];
}

class UnLoadedTask extends TaskState {
  @override
  List<Object> get props => [];
}

class TaskError extends TaskState {
  final String error;

  TaskError(this.error);

  @override
  List<Object> get props => [error];
}
