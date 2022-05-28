import 'package:to_do_list/data/repositories/task/base_task.repository.dart';
import 'package:to_do_list/services/TaskServices/taskService.dart';

import '../../models/tasks.dart';

class TaskRepository extends BaseTaskRepository {
  TaskService service = TaskService();
  @override
  Future<List<Task>> getAllTask() {
    return service.retrieveTasksData();
  }

  @override
  Future<void> addTask(Task task) {
    return service.addTaskData(task);
  }

  @override
  Future<void> deleteTask(Task task) {
    return service.deleteTaskData(task);
  }

  @override
  Future<void> updateTask(Task task) {
    return service.updateTaskData(task);
  }
}
