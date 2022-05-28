import 'package:to_do_list/data/models/project.dart';
import 'package:to_do_list/data/repositories/project/base_project_repository.dart';
import 'package:to_do_list/services/ProjectServices/projectService.dart';

class ProjectRepository extends BaseProjectRepository {
  ProjectService projectService = ProjectService();
  @override
  Future<List<Project>> getAllProject() async {
    return await projectService.retrieveProjectsData();
  }

  @override
  Future<void> addProject(Project project) {
    return projectService.addProjectData(project);
  }

  @override
  Future<void> deleteProject(Project project) {
    return projectService.deleteProjectData(project);
  }

  @override
  Future<void> updateProject(Project project) {
    return projectService.updateProjectData(project);
  }
}
