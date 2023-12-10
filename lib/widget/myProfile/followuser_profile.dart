import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:naemansan/utilities/style/color_styles.dart';
import 'package:naemansan/utilities/style/font_styles.dart';

import 'package:naemansan/widget/myProfile/follow_btn.dart';

class FollowuserProfile extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final String id;
  final String type;
  const FollowuserProfile({super.key, required this.id, required this.type});

  @override
  State<FollowuserProfile> createState() => _FollowuserProfileState();
}

class _FollowuserProfileState extends State<FollowuserProfile> {
  String currentState = 'follow';
  void onFollowBtnStateChanged(String newState) {
    setState(() {
      currentState = newState;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 20),
      child: InkWell(
        onTap: () {
          Get.toNamed("/userProfile/1");
        },
        child: Row(
          children: [
            //프로필 사진
            Container(
              margin: const EdgeInsets.only(right: 4),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: ClipOval(
                child: Image.asset(
                  'assets/images/defaultProfile.png',
                  height: 36,
                ),
              ),
            ),

            //유저 정보
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${widget.id}의 이름",
                    style:
                        FontStyles.regular12.copyWith(color: ColorStyles.black),
                  ),
                  Text(
                    "${widget.id}의 바이오",
                    style:
                        FontStyles.regular12.copyWith(color: ColorStyles.gray3),
                  ),
                ],
              ),
            ), //유저 정보

            //팔로우 팔로잉 버튼
            Visibility(
                visible: widget.type == "following",
                child: FollowBtn(
                    userId: widget.id,
                    currentState: currentState,
                    onStateChanged: onFollowBtnStateChanged)) //팔로우 팔로잉 버튼
          ],
        ),
      ),
    );
  }
}
