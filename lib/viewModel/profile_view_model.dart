import 'package:get/get.dart';
import 'package:naemansan/models/followuser_profile_model.dart';

import 'package:naemansan/models/tag_model.dart';
import 'package:naemansan/models/user_model.dart';

class ProfileViewModel extends GetxController {
  late User _userProfile;
  late List<FollowuserProfileModel> _followingList;
  late List<FollowuserProfileModel> _followerList;

  ProfileViewModel() {
    _userProfile = User(
        isLoggedIn: true,
        deviceToken: "111",
        nickname: "심서현",
        bio: "한줄소개",
        tags: [Tag(id: 1, tag: "태그")],
        profileImageUrl: "이미지",
        following: ["1", "2", "3"],
        follower: ["1", "2", "3"]);

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
      FollowuserProfileModel(name: '팔로워1', description: '한줄소개'),
      FollowuserProfileModel(name: '팔로워2', description: '한줄소개'),
      FollowuserProfileModel(name: '팔로워3', description: '한줄소개'),
      FollowuserProfileModel(name: '팔로워4', description: '한줄소개'),
      FollowuserProfileModel(name: '팔로워1', description: '한줄소개'),
      FollowuserProfileModel(name: '팔로워2', description: '한줄소개'),
      FollowuserProfileModel(name: '팔로워3', description: '한줄소개'),
      FollowuserProfileModel(name: '팔로워4', description: '한줄소개'),
    ];
  }

  User get userProfile => _userProfile;
  List<FollowuserProfileModel> get followingList => _followingList;
  List<FollowuserProfileModel> get followerList => _followerList;
}
