import 'package:get/get.dart';
import 'package:naemansan/models/followuser_profile_model.dart';
import 'package:naemansan/models/user_profile_model.dart';

class ProfileViewModel extends GetxController {
  late UserProfileModel _userProfile;
  late List<FollowuserProfileModel> _followingList;
  late List<FollowuserProfileModel> _followerList;

  ProfileViewModel() {
    _userProfile =
        UserProfileModel("이름", "한줄소개", ["#태그1", "#태그2", "#태그3"], "4", "3");

    _followingList = [
      FollowuserProfileModel(name: '팔로잉1', description: '한줄소개'),
      FollowuserProfileModel(name: '팔로잉2', description: '한줄소개'),
      FollowuserProfileModel(name: '팔로잉3', description: '한줄소개'),
    ];
    _followerList = [
      FollowuserProfileModel(name: '팔로워1', description: '한줄소개'),
      FollowuserProfileModel(name: '팔로워2', description: '한줄소개'),
      FollowuserProfileModel(name: '팔로워3', description: '한줄소개'),
      FollowuserProfileModel(name: '팔로워4', description: '한줄소개'),
    ];
  }

  UserProfileModel get userProfile => _userProfile;
  List<FollowuserProfileModel> get followingList => _followingList;
  List<FollowuserProfileModel> get followerList => _followerList;
}
  // Future<void> followOtherUser(UserProfileModel user) async {
  //   try {
  //     print(user.name + "팔로우");
  //   } catch (e) {
  //     // Handle exceptions
  //   }
  // }