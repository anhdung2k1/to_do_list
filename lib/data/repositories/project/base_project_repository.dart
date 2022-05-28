import '../../models/project.dart';

abstract class BaseProjectRepository {
  Future<List<Project>> getAllProject();
  Future<void> addProject(Project project);
  Future<void> deleteProject(Project project);
  Future<void> updateProject(Project project);
}
