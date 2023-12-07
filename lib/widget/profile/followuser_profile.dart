import 'package:flutter/material.dart';
import 'package:naemansan/utilities/style/color_styles.dart';
import 'package:naemansan/utilities/style/font_styles.dart';

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
                  widget.info.name,
                  style:
                      FontStyles.regular12.copyWith(color: ColorStyles.black),
                ),
                Text(
                  widget.info.description,
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
                        print(widget.info.name + ' 언팔로우 api');
                        // ---
                      } else if (currentState == "unfollow") {
                        currentState = "follow";

                        // ---
                        print(widget.info.name + ' 팔로우 api');
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
