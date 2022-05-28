import 'package:to_do_list/data/models/profile.dart';
import 'package:to_do_list/services/ProfileServices/profileService.dart';

import '../../models/user.dart';
import 'base_profile_repository.dart';

class ProfileRepository extends BaseProfileRepository {
  ProfileService profileService = ProfileService();
  @override
  Future<List<Profile>> getAllProfile() async {
    return await profileService.retrieveProfileData();
  }

  Future<List<User>> getAllUser() async {
    return await profileService.retrieveUserData();
  }
}
