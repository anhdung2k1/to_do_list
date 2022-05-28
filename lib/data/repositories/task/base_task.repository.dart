import '../../models/tasks.dart';

abstract class BaseTaskRepository {
  Future<List<Task>> getAllTask();
  Future<void> addTask(Task task);
  Future<void> deleteTask(Task task);
  Future<void> updateTask(Task task);
}
