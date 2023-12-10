// 파일명: user_view_model.dart

import 'package:get/get.dart';
import 'package:naemansan/models/tag_model.dart';

import 'package:naemansan/models/user_model.dart';
import 'package:naemansan/services/user_service.dart';

class UserViewModel extends GetxController {
  final UserService userService = UserService();

  final Rx<User> user = User(
    isLoggedIn: false,
    deviceToken: '',
    uuid: '',
    nickname: '',
    introduction: '',
    tags: [Tag(id: 0, tag: '')],
    profile_image_url: '',
    following: [],
    follower: [],
  ).obs;

  @override
  void onInit() {
    super.onInit();
    loadUserData();
  }

  // 사용자 데이터를 로드하는 메소드
  void loadUserData() {
    User dummyUser = userService.getDummyUser();
    user.value = dummyUser;
  }

  // 닉네임, 한 줄 소개, 키워드를 업데이트하는 메소드
  void updateUserInfo(String nickname, String introduction, List<Tag> tags) {
    user.update((val) {
      val?.nickname = nickname;
      val?.introduction = introduction;
      val?.tags = tags;
    });
  }

  // 팔로우/언팔로우 기능을 수행하는 메소드
  void toggleFollow(String uuid) {
    if (user.value.following.contains(uuid)) {
      user.update((val) {
        val?.following.remove(uuid);
      });
    } else {
      user.update((val) {
        val?.following.add(uuid);
      });
    }
  }

  // 로그인 상태를 확인하는 메소드
  bool isLoggedIn() {
    return user.value.isLoggedIn;
  }
}
