import 'package:flutter/material.dart';
import 'package:naemansan/utilities/style/color_styles.dart';
import 'package:naemansan/utilities/style/font_styles.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("마이페이지"),
        backgroundColor: ColorStyles.white,
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(0, 12, 0, 32),
        child: const Column(children: [UserProfile(), FollowList()]),
      ),
    );
  }
}

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final followList = ["팔로잉", "3", "·", "팔로워", "3"];
    final tagList = ["#태그1", "태그2", "태그3"];
    return Container(
      color: ColorStyles.emotionJoy,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        //상단 설명
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //프로필 사진
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 8, 0),
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
                  "유저이름",
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
            "한줄소개",
            style: FontStyles.regular16.copyWith(color: ColorStyles.black),
          ),
        ), //한줄 소개

        //태그 정보
        Wrap(
          spacing: 4.0,
          children: tagList.map((tag) {
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

class FollowList extends StatelessWidget {
  const FollowList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorStyles.emotionSad,
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
    );
  }
}
