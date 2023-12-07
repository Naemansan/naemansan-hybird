import 'package:flutter/material.dart';
import 'package:naemansan/utilities/style/color_styles.dart';
import 'package:naemansan/utilities/style/font_styles.dart';
import 'package:naemansan/widget/profile/custom_tabbar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const List followingList = [
      {'name': '서현', 'description': "한줄소개"},
      {'name': '서현', 'description': "한줄소개"},
      {'name': '서현', 'description': "한줄소개"},
      {'name': '서현', 'description': "한줄소개"},
      {'name': '서현', 'description': "한줄소개"},
      {'name': '서현', 'description': "한줄소개"},
      {'name': '서현', 'description': "한줄소개"},
      {'name': '서현', 'description': "한줄소개"},
      {'name': '서현', 'description': "한줄소개"},
      {'name': '서현', 'description': "한줄소개"},
      {'name': '서현', 'description': "한줄소개"},
      {'name': '서현', 'description': "한줄소개"},
      {'name': '서현', 'description': "한줄소개"},
      {'name': '서현', 'description': "한줄소개"},
      {'name': '서현', 'description': "한줄소개"},
      {'name': '서현', 'description': "한줄소개"},
      {'name': '서현', 'description': "한줄소개"},
    ];

    const List followerList = [
      {'name': '서현', 'description': "한줄소개"},
      {'name': '서현', 'description': "한줄소개"},
      {'name': '서현', 'description': "한줄소개"},
      {'name': '서현', 'description': "한줄소개"},
      {'name': '서현', 'description': "한줄소개"},
      {'name': '서현', 'description': "한줄소개"},
      {'name': '서현', 'description': "한줄소개"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("마이페이지"),
        backgroundColor: ColorStyles.white,
      ),
      body: Container(
        color: ColorStyles.white,
        padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
        child: const Column(children: [
          UserProfile(),
          Expanded(
            child: CustomTabbar(
              tabs: ["팔로잉", "팔로워"],
              tabviews: [
                OtherUserProfileList(
                  userList: followingList,
                  type: "following",
                ),
                OtherUserProfileList(userList: followerList, type: "follower")
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class OtherUserProfileList extends StatelessWidget {
  final List userList;
  final String type;
  const OtherUserProfileList(
      {Key? key, required this.userList, required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: userList
          .map((user) => OtherUserProfile(
                info: user,
                type: type,
              ))
          .toList(),
    );
  }
}

class OtherUserProfile extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final info;
  final String type;
  const OtherUserProfile({super.key, required this.info, required this.type});

  @override
  State<OtherUserProfile> createState() => _OtherUserProfileState();
}

class _OtherUserProfileState extends State<OtherUserProfile> {
  String currentState = 'follow';
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 20),
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
                  widget.info['name'],
                  style:
                      FontStyles.regular12.copyWith(color: ColorStyles.black),
                ),
                Text(
                  widget.info['description'],
                  style:
                      FontStyles.regular12.copyWith(color: ColorStyles.gray3),
                ),
              ],
            ),
          ), //유저 정보

          //팔로우 팔로잉 버튼
          Visibility(
            visible: widget.type == "following",
            child: Container(
              margin: const EdgeInsets.only(left: 4),
              child: GestureDetector(
                  onTap: () {
                    setState(() {
                      if (currentState == "follow") {
                        currentState = "unfollow";

                        // ---
                        print(widget.info['name'] + ' 언팔로우 api');
                        // ---
                      } else if (currentState == "unfollow") {
                        currentState = "follow";

                        // ---
                        print(widget.info['name'] + ' 팔로우 api');
                        // ---
                      }
                    });
                  },
                  child: currentState == "follow"
                      ? (Container(
                          width: 80,
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32),
                              border: Border.all(
                                color: ColorStyles.gray1,
                                width: 2,
                              )),
                          child: Center(
                              child: Text(
                            "팔로잉",
                            style: FontStyles.semiBold12
                                .copyWith(color: ColorStyles.gray1),
                          )),
                        ))
                      : (Container(
                          width: 80,
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                              color: ColorStyles.main1,
                              borderRadius: BorderRadius.circular(32),
                              border: Border.all(
                                color: ColorStyles.main1,
                                width: 2,
                              )),
                          child: Center(
                              child: Text(
                            "팔로우",
                            style: FontStyles.semiBold12
                                .copyWith(color: ColorStyles.white),
                          )),
                        ))),
            ),
          ) //팔로우 팔로잉 버튼
        ],
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
