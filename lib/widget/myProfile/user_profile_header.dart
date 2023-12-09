import 'package:flutter/material.dart';
import 'package:naemansan/models/user_profile_model.dart';
import 'package:naemansan/utilities/style/color_styles.dart';
import 'package:naemansan/utilities/style/font_styles.dart';
import 'package:naemansan/widget/myProfile/follow_btn.dart';

class UserProfileHeader extends StatefulWidget {
  final bool isOther;
  final UserProfileModel userProfile;

  const UserProfileHeader({
    Key? key,
    required this.userProfile,
    required this.isOther,
  }) : super(key: key);

  @override
  State<UserProfileHeader> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfileHeader> {
  String currentState = 'follow';

  void onFollowBtnStateChanged(String newState) {
    setState(() {
      currentState = newState;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        //상단 설명
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //프로필 사진
            Container(
              margin: const EdgeInsets.only(right: 8),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: ClipOval(
                child: Image.asset(
                  'assets/images/defaultProfile.png',
                  height: 44,
                ),
              ),
            ),

            //유저 정보
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.userProfile.name,
                    style: FontStyles.semiBold20
                        .copyWith(color: ColorStyles.black),
                  ),
                  Wrap(
                    spacing: 4.0,
                    children: [
                      "팔로잉",
                      widget.userProfile.followingCount,
                      "·",
                      "팔로워",
                      widget.userProfile.followerCount
                    ].asMap().entries.map((element) {
                      return Text(
                        element.value,
                        style: element.key % 3 == 1
                            ? FontStyles.semiBold12
                                .copyWith(color: ColorStyles.gray3)
                            : FontStyles.regular12
                                .copyWith(color: ColorStyles.gray3),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),

            //팔로우 팔로잉버튼
            Visibility(
                visible: widget.isOther,
                child: FollowBtn(
                    currentState: currentState,
                    onStateChanged: onFollowBtnStateChanged)) //팔로우 팔로잉 버튼
          ],
        ), //상단 설명

        //한줄 소개
        Container(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 12),
          child: Text(
            widget.userProfile.description,
            style: FontStyles.regular16.copyWith(color: ColorStyles.black),
          ),
        ), //한줄 소개

        //태그 정보
        Wrap(
          spacing: 4.0,
          children: widget.userProfile.tags.map((tag) {
            return Text(
              "#$tag",
              style: FontStyles.semiBold12.copyWith(color: ColorStyles.gray3),
            );
          }).toList(),
        ), //태그 정보
      ]),
    );
  }
}
