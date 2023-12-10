import 'package:get/get.dart';
import 'package:naemansan/models/course_overview_model.dart';

import 'package:naemansan/models/tag_model.dart';
import 'package:naemansan/models/user_model.dart';

class UserProfileViewModel extends GetxController {
  late User _otheruserProfile;
  late List<CourseOverviewModel> _courseList;

  UserProfileViewModel() {
    _otheruserProfile = User(
        isLoggedIn: true,
        deviceToken: "111",
        nickname: "심서현",
        bio: "한줄소개",
        tags: [Tag(id: 1, tag: "태그")],
        profileImageUrl: "이미지",
        following: ["1", "2", "3"],
        follower: ["1", "2", "3"]);

    _courseList = [
      CourseOverviewModel(
          id: 1,
          title: "산책로1",
          siGuDong: "경기도 화성시 석우동",
          distance: "1,234m",
          tags: [
            Tag(id: 1, tag: "123"),
            Tag(id: 1, tag: "123"),
            Tag(id: 1, tag: "123")
          ],
          momentCount: 1,
          likeCount: 2,
          isPublished: true)
    ];
  }

  User get otheruserProfile => _otheruserProfile;
  List<CourseOverviewModel> get courseList => _courseList;
}
