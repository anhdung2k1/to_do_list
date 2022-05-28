part of 'task_bloc.dart';

abstract class TaskEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadTasks extends TaskEvent {}

class AddTasks extends TaskEvent {
  final Task task;

  AddTasks(this.task);
  @override
  List<Object> get props => [task];
}

class UpdateTasks extends TaskEvent {
  final List<Task> tasks;

  UpdateTasks(this.tasks);
  @override
  List<Object> get props => [tasks];
}

class DeleteTasks extends TaskEvent {
  final Task task;

  DeleteTasks(this.task);
  @override
  List<Object> get props => [task];
}
