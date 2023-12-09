import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:naemansan/utilities/style/color_styles.dart';
import 'package:naemansan/viewModel/otheruser_profile_view_model.dart';
import 'package:naemansan/widget/base/custom_appbar.dart';
import 'package:naemansan/widget/myProfile/user_profile_header.dart';
import 'package:naemansan/widget/course/courseCard/course_card_list.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final UserProfileViewModel viewModel = Get.put(UserProfileViewModel());

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
            init: viewModel,
            builder: (viewModel) {
              return Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                child: Column(children: [
                  UserProfileHeader(
                    userProfile: viewModel.otheruserProfile,
                    isOther: true,
                  ),
                  Expanded(
                      child: SingleChildScrollView(
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: CourseOverviewList(
                        courseList: viewModel.courseList,
                      ),
                    ),
                  ))
                ]),
              );
            }));
  }
}
