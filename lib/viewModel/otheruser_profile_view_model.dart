import 'package:get/get.dart';

import 'package:naemansan/models/user_profile_model.dart';

class OtheruserProfileViewModel extends GetxController {
  late UserProfileModel _otheruserProfile;
  OtheruserProfileViewModel() {
    _otheruserProfile =
        UserProfileModel("다른 유저", "한줄소개", ["#1", "#2"], "4", "3");
  }

  UserProfileModel get otheruserProfile => _otheruserProfile;
}
