import 'package:flutter/material.dart';
import 'package:naemansan/screens/otheruserProfile/otheruser_profile_screen.dart';
import 'package:naemansan/utilities/style/color_styles.dart';
import 'package:naemansan/utilities/style/font_styles.dart';
import 'package:naemansan/widget/profile/follow_btn.dart';

class FollowuserProfile extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final info;
  final String type;
  const FollowuserProfile({super.key, required this.info, required this.type});

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
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const OtheruserProfileScreen()));
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
              child: Container(
                color: ColorStyles.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.info.name,
                      style: FontStyles.regular12
                          .copyWith(color: ColorStyles.black),
                    ),
                    Text(
                      widget.info.description,
                      style: FontStyles.regular12
                          .copyWith(color: ColorStyles.gray3),
                    ),
                  ],
                ),
              ),
            ), //유저 정보

            //팔로우 팔로잉 버튼
            Visibility(
                visible: widget.type == "following",
                child: FollowBtn(
                    currentState: currentState,
                    onStateChanged: onFollowBtnStateChanged)) //팔로우 팔로잉 버튼
          ],
        ),
      ),
    );
  }
}
