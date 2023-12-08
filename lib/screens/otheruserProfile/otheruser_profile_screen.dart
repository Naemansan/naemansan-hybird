import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:naemansan/utilities/style/color_styles.dart';
import 'package:naemansan/viewModel/otheruser_profile_view_model.dart';
import 'package:naemansan/widget/profile/user_profile.dart';
import 'package:naemansan/widget/course/courseCard/course_card_list.dart';

class OtheruserProfileScreen extends StatelessWidget {
  const OtheruserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final OtheruserProfileViewModel viewModel =
        Get.put(OtheruserProfileViewModel());

    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorStyles.white,
        ),
        body: GetBuilder<OtheruserProfileViewModel>(
            init: viewModel,
            builder: (viewModel) {
              return Container(
                width: double.infinity,
                color: ColorStyles.white,
                padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                child: Column(children: [
                  UserProfile(
                    userProfile: viewModel.otheruserProfile,
                    isOther: true,
                  ),
                  Expanded(
                      child: SingleChildScrollView(
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: CourseCardList(
                        courseList: viewModel.courseList,
                      ),
                    ),
                  ))
                ]),
              );
            }));
  }
}
