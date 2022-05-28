import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:to_do_list/data/models/profile.dart';
import 'package:to_do_list/data/models/user.dart';

class ProfileService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<Profile>> retrieveProfileData() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _db.collection('profile').get();
    return snapshot.docs
        .map((docSnapshot) => Profile.fromDocumentSnapshot(docSnapshot))
        .toList();
  }

  Future<List<User>> retrieveUserData() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _db.collection('user').get();
    return snapshot.docs
        .map((docSnapshot) => User.fromDocumentSnapshot(docSnapshot))
        .toList();
  }
}
