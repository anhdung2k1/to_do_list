import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:to_do_list/data/models/tasks.dart';

class TaskService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<Task>> retrieveTasksData() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _db.collection('task').get();
    return snapshot.docs
        .map((docSnapshot) => Task.fromDocumentSnapshot(docSnapshot))
        .toList();
  }

  addTaskData(Task task) async {
    await _db.collection('task').add(task.toJson());
  }

  deleteTaskData(Task task) async {
    await _db.collection('task').doc(task.text).delete();
  }

  updateTaskData(Task task) async {
    await _db.collection('task').doc(task.text).update(task.toJson());
  }
}
