part of 'project_bloc.dart';

@immutable
abstract class ProjectState extends Equatable {
  const ProjectState();
  @override
  List<Object> get props => [];
}

class ProjectLoading extends ProjectState {}

class ProjectLoaded extends ProjectState {
  final List<Project> projects;
  ProjectLoaded(this.projects);
  @override
  List<Object> get props => [projects];
}

class UnLoadedProject extends ProjectState {
  @override
  List<Object> get props => [];
}

class ProjectError extends ProjectState {
  final String error;

  ProjectError(this.error);

  @override
  List<Object> get props => [error];
}
