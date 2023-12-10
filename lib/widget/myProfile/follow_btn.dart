import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:naemansan/utilities/style/color_styles.dart';
import 'package:naemansan/utilities/style/font_styles.dart';
import 'package:naemansan/viewModel/user/user_view_model.dart';
import 'package:naemansan/widget/base/login_bottom_sheet_widget.dart';

class FollowBtn extends StatefulWidget {
  final String userId;
  final String currentState;
  final Function(String) onStateChanged;
  const FollowBtn(
      {super.key,
      required this.currentState,
      required this.onStateChanged,
      required this.userId});

  @override
  State<FollowBtn> createState() => _FollowBtnState();
}

class _FollowBtnState extends State<FollowBtn> {
  final UserViewModel userViewModel = Get.put(UserViewModel());

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: userViewModel.user.value.userId != widget.userId,
      child: Container(
        margin: const EdgeInsets.only(left: 4),
        child: InkWell(
            onTap: () {
              if (userViewModel.isLoggedIn()) {
                setState(() {
                  if (widget.currentState == "follow") {
                    widget.onStateChanged("unfollow");
                  } else if (widget.currentState == "unfollow") {
                    widget.onStateChanged("follow");
                  }
                  userViewModel.toggleFollow("1");
                });
              } else {
                LoginBottomSheetWidget.show(context: context);
              }
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
      ),
    );
  }
}
