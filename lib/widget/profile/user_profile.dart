import 'package:flutter/material.dart';
import 'package:naemansan/models/user_profile_model.dart';
import 'package:naemansan/utilities/style/color_styles.dart';
import 'package:naemansan/utilities/style/font_styles.dart';

class UserProfile extends StatelessWidget {
  final UserProfileModel userProfile;
  final List<String> followList;
  const UserProfile(
      {Key? key, required this.userProfile, required this.followList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userProfile.name,
                  style:
                      FontStyles.semiBold20.copyWith(color: ColorStyles.black),
                ),
                Wrap(
                  spacing: 4.0,
                  children: followList.asMap().entries.map((element) {
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
          ],
        ), //상단 설명

        //한줄 소개
        Container(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 12),
          child: Text(
            userProfile.description,
            style: FontStyles.regular16.copyWith(color: ColorStyles.black),
          ),
        ), //한줄 소개

        //태그 정보
        Wrap(
          spacing: 4.0,
          children: userProfile.tags.map((tag) {
            return Text(
              tag,
              style: FontStyles.semiBold12.copyWith(color: ColorStyles.gray3),
            );
          }).toList(),
        ), //태그 정보
      ]),
    );
  }
}
