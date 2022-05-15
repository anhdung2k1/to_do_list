import '../../models/tasks.dart';

abstract class BaseTaskRepository {
  Stream<List<Task>> getAllTask({required List<Task> list_task});
  Future<void> addTask(Task task);
  Future<void> deleteTask(Task task);
  Future<void> updateTask(Task task);
}
