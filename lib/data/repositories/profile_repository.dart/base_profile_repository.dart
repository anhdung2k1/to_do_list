import 'package:to_do_list/data/models/profile.dart';

import '../../models/user.dart';

abstract class BaseProfileRepository {
  Future<List<Profile>> getAllProfile();
  Future<List<User>> getAllUser();
}
