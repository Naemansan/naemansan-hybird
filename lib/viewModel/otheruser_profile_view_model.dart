import 'package:get/get.dart';
import 'package:naemansan/models/course_card_model.dart';

import 'package:naemansan/models/user_profile_model.dart';

class UserProfileViewModel extends GetxController {
  late UserProfileModel _otheruserProfile;
  late List<CourseCardModel> _courseList;

  UserProfileViewModel() {
    _otheruserProfile =
        UserProfileModel("다른 유저", "한줄소개", ["#1", "#2"], "4", "3");
    _courseList = [
      CourseCardModel(
          "산책로 1", "경기도 화성시 동탄반석로", "2,347m", ["#1", "#2"], "3", "2"),
      CourseCardModel(
          "산책로 2", "경기도 화성시 동탄반석로", "2,347m", ["#1", "#2"], "3", "2"),
      CourseCardModel(
          "산책로 3", "경기도 화성시 동탄반석로", "2,347m", ["#1", "#2"], "3", "2"),
    ];
  }

  UserProfileModel get otheruserProfile => _otheruserProfile;
  List<CourseCardModel> get courseList => _courseList;
}
