import 'package:flutter/material.dart';
import 'package:naemansan/utilities/style/color_styles.dart';
import 'package:naemansan/utilities/style/font_styles.dart';

class FollowBtn extends StatefulWidget {
  final String currentState;
  final Function(String) onStateChanged;
  const FollowBtn(
      {super.key, required this.currentState, required this.onStateChanged});

  @override
  State<FollowBtn> createState() => _FollowBtnState();
}

class _FollowBtnState extends State<FollowBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 4),
      child: InkWell(
          onTap: () {
            setState(() {
              if (widget.currentState == "follow") {
                widget.onStateChanged("unfollow");
                print('--- 언팔로우 api');
              } else if (widget.currentState == "unfollow") {
                print('--- 팔로우 api');
                widget.onStateChanged("follow");
              }
            });
          },
          child: widget.currentState == "follow"
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
    );
  }
}
