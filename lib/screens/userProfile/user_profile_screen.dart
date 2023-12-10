import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naemansan/models/course/course_overview_model.dart';
import 'package:naemansan/models/tag_model.dart';

import 'package:naemansan/viewModel/user/user_view_model.dart';
import 'package:naemansan/widget/base/custom_appbar.dart';
import 'package:naemansan/widget/course/courseCard/course_card_list.dart';
import 'package:naemansan/widget/myProfile/user_profile_header.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final UserViewModel userViewModel = Get.put(UserViewModel());

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

        body: GetBuilder<UserViewModel>(
            init: userViewModel,
            builder: (userViewModel) {
              return Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                child: Column(children: [
                  UserProfileHeader(
                    userProfile: userViewModel.user.value,
                  ),
                  Expanded(
                      child: SingleChildScrollView(
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: CourseCardList(
                        courseList: [
                          CourseOverviewModel(
                            id: 1,
                            title: "1",
                            siGuDong: "1",
                            distance: 1234,
                            tags: [Tag(id: 1, tag: "1")],
                            moment_cnt: 2,
                            like_cnt: 3,
                            isEnrolled: true,
                          )
                        ],
                      ),
                    ),
                  ))
                ]),
              );
            }));
  }
}
