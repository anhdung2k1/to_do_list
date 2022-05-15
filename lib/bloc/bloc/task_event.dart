part of 'task_bloc.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

class LoadTasks extends TaskEvent {
  final List<Task> tasks;

  LoadTasks(this.tasks);

  @override
  List<Object> get props => [tasks];
}

class AddTasks extends TaskEvent {
  final Task task;

  AddTasks({required this.task});

  @override
  List<Object> get props => [task];
}

class UpdateTasks extends TaskEvent {
  final List<Task> task;

  UpdateTasks({required this.task});

  @override
  List<Object> get props => [task];
}

class DeleteTasks extends TaskEvent {
  final Task task;

  DeleteTasks({required this.task});

  @override
  List<Object> get props => [task];
}
