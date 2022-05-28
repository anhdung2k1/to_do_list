part of 'project_bloc.dart';

abstract class ProjectEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadProjects extends ProjectEvent {}

class AddProject extends ProjectEvent {
  final Project project;

  AddProject(this.project);
  @override
  List<Object> get props => [project];
}

class UpdateProject extends ProjectEvent {
  final List<Project> project;

  UpdateProject(this.project);
  @override
  List<Object> get props => [project];
}

class DeleteProject extends ProjectEvent {
  final Project project;

  DeleteProject(this.project);
  @override
  List<Object> get props => [project];
}
