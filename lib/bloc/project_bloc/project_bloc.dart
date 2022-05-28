import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/data/models/project.dart';

import '../../data/repositories/project/project_repository.dart';

part 'project_event.dart';
part 'project_state.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  final ProjectRepository _projectRepository;
  ProjectBloc({required ProjectRepository projectRepository})
      : _projectRepository = projectRepository,
        super(ProjectLoading()) {
    on<LoadProjects>((event, emit) async {
      emit(ProjectLoading());
      try {
        List<Project> projects = await _projectRepository.getAllProject();
        emit(ProjectLoaded(projects));
      } catch (e) {
        emit(UnLoadedProject());
        emit(ProjectError(e.toString()));
      }
    });
    on<AddProject>((event, emit) async {
      emit(ProjectLoading());
      try {
        final state = this.state as ProjectLoaded;
        emit(ProjectLoaded(
            List<Project>.from(state.projects)..add(event.project)));
      } catch (e) {
        emit(UnLoadedProject());
        emit(ProjectError(e.toString()));
      }
    });
    on<DeleteProject>((event, emit) async {
      emit(ProjectLoading());
      try {
        final state = this.state as ProjectLoaded;
        emit(ProjectLoaded(List.from(state.projects)..remove(event.project)));
      } catch (e) {
        emit(UnLoadedProject());
        emit(ProjectError(e.toString()));
      }
    });
  }
}
