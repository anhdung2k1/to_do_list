import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:to_do_list/data/repositories/task/base_task.repository.dart';

import '../../models/tasks.dart';

class TaskRepository extends BaseTaskRepository {
  final FirebaseFirestore firebaseFirestore;
  TaskRepository({FirebaseFirestore? firebaseFirestore})
      : firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;
  @override
  getAllTask({required List<Task> list_task}) async {
    final _collectionRef = await firebaseFirestore.collection('task').get();
    final _listTask = _collectionRef.docs.map((doc) {
      list_task.add(Task.fromSnapshot(doc));
    }).toList();
    return list_task;
  }

  @override
  Future<void> addTask(Task task) {
    return firebaseFirestore.collection('task').add(task.toJson());
  }

  @override
  Future<void> deleteTask(Task task) {
    return firebaseFirestore.collection('task').doc(task.text).delete();
  }

  @override
  Future<void> updateTask(Task task) {
    return firebaseFirestore
        .collection('task')
        .doc(task.text)
        .update(task.toJson());
  }
}
