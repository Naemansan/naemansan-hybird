import 'package:flutter/material.dart';

import 'package:naemansan/utilities/style/color_styles.dart';

import 'package:get/get.dart';
import 'package:naemansan/viewModel/profile_view_model.dart';

import 'package:naemansan/widget/profile/custom_tabbar.dart';
import 'package:naemansan/widget/profile/followuser_porfile_list.dart';
import 'package:naemansan/widget/profile/user_profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileViewModel viewModel = Get.put(ProfileViewModel());

    return Scaffold(
      appBar: AppBar(
        title: const Text("마이페이지"),
        backgroundColor: ColorStyles.white,
      ),
      body: GetBuilder<ProfileViewModel>(
          init: viewModel,
          builder: (viewModel) {
            return Container(
              color: ColorStyles.white,
              padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
              child: Column(children: [
                //유저 프로필 (상단)
                UserProfile(
                  userProfile: viewModel.userProfile,
                  isOther: false,
                ),

                //팔로잉 팔로워 보는 탭
                Expanded(
                  child: CustomTabbar(
                    tabs: const ["팔로잉", "팔로워"],
                    tabviews: [
                      FollowuserProfileList(
                        userList: viewModel.followingList,
                        type: "following",
                      ),
                      FollowuserProfileList(
                        userList: viewModel.followerList,
                        type: "follower",
                      ),
                    ],
                  ),
                ),
              ]),
            );
          }),
    );
  }
}
