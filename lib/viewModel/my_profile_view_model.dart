import 'package:get/get.dart';
import 'package:naemansan/models/tag_model.dart';
import 'package:naemansan/models/user_info_model.dart';
import 'package:naemansan/services/user_service.dart';
import 'package:naemansan/viewModel/follow_model.dart';

class MyProfileViewModel extends GetxController {
  final UserService userService = UserService();

  final Rx<UserInfo> user = UserInfo(
    uuid: '',
    nickname: '',
    introduction: '',
    tags: [Tag(id: 0, tag: '')],
    profile_image_url: '',
  ).obs;

  final RxList<Follow> following = <Follow>[].obs;
  final RxList<Follow> follower = <Follow>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadUserData();
    loadFollowData();
  }

  // 사용자 프로필 데이터를 로드하는 메소드
  void loadUserData() {
    UserInfo dummyUserInfo = userService.getDummyUserInfo();
    user.value = dummyUserInfo;
  }

  void loadFollowData() {
    List<Follow> dummyFollowing = userService.getDummyFollowing();
    List<Follow> dummyFollower = userService.getDummyFollower();

    following.value = dummyFollowing;
    follower.value = dummyFollower;
  }
}
