import 'package:get/get.dart';
import 'package:naemansan/models/course_overview_model.dart';
import 'package:naemansan/models/keyword_model.dart';

import 'package:naemansan/models/user_profile_model.dart';

class UserProfileViewModel extends GetxController {
  late UserProfileModel _otheruserProfile;
  late List<CourseOverviewModel> _courseList;

  UserProfileViewModel() {
    _otheruserProfile = UserProfileModel("다른 유저", "한줄소개", ["1", "2"], "4", "3");
    _courseList = [
      CourseOverviewModel(
          id: 1,
          title: "산책로1",
          siGuDong: "경기도 화성시 석우동",
          distance: "1,234m",
          keywords: [
            KeywordModel(id: 1, keyword: "@"),
            KeywordModel(id: 1, keyword: "@"),
            KeywordModel(id: 1, keyword: "@")
          ],
          momentCount: 1,
          likeCount: 2)
    ];
  }

  UserProfileModel get otheruserProfile => _otheruserProfile;
  List<CourseOverviewModel> get courseList => _courseList;
}
