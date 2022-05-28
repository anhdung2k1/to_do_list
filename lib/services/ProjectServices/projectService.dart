import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:to_do_list/data/models/project.dart';

class ProjectService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<Project>> retrieveProjectsData() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _db.collection('project').get();
    return snapshot.docs
        .map((docSnapshot) => Project.fromDocumentSnapshot(docSnapshot))
        .toList();
  }

  addProjectData(Project project) async {
    await _db.collection('project').add(project.toJson());
  }

  deleteProjectData(Project project) async {
    await _db.collection('project').doc(project.name).delete();
  }

  updateProjectData(Project project) async {
    await _db.collection('project').doc(project.name).update(project.toJson());
  }
}
