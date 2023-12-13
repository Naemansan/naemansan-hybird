import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naemansan/models/course_overview_model.dart';

import 'package:naemansan/viewModel/user_profile_view_model.dart';

import 'package:naemansan/widget/base/custom_appbar.dart';
import 'package:naemansan/widget/course/courseCard/course_card_list.dart';
import 'package:naemansan/widget/myProfile/user_profile_header.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String uuid = Get.parameters['uuid'] ?? '';

    final UserProfileViewModel userProfileViewModel =
        Get.put(UserProfileViewModel());

    return Scaffold(
        //앱바...
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(48),
            child: CustomAppbar(
              leftIcon: "left",
              rightIcon: null,
              content: '',
            )),
        //앱바...

        body: GetBuilder<UserProfileViewModel>(
            init: userProfileViewModel,
            builder: (userProfileViewModel) {
              return Container(
                color: Colors.white,
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                child: Column(
                  children: [
                    //상단 유저 프로필
                    UserProfileHeader(
                      userProfile: userProfileViewModel.user.value,
                    ),
                    //상단 유저 프로필

                    //산책로 목록
                    Expanded(
                      child: SingleChildScrollView(
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: const CourseCardList(),
                        ),
                      ),
                    ),
                    //산책로 목록
                  ],
                ),
              );
            }));
  }
}
