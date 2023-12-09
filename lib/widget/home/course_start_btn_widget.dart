import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:naemansan/utilities/style/color_styles.dart';
import 'package:naemansan/utilities/style/font_styles.dart';
import 'package:naemansan/viewModel/home_view_model.dart';
import 'package:naemansan/viewModel/user/user_view_model.dart';
import 'package:naemansan/widget/base/login_bottom_sheet_widget.dart';

class CourseStartBtnWidget extends StatelessWidget {
  final HomeViewModel viewModel = Get.find();
  final UserViewModel userViewModel = Get.put(UserViewModel());
  CourseStartBtnWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (userViewModel.isLoggedIn()) {
          // 로그인이 되어있지 않으면 로그인 바텀 시트 올라오기
          LoginBottomSheetWidget.show(context: context);
        } else {
          Get.toNamed('/course/walking');
        }
      },
      child: Container(
        height: 112,
        width: 320,
        decoration: const BoxDecoration(
          color: ColorStyles.main1,
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
          // border color
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            24,
            20,
            24,
            20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '산책 시작하기',
                style: FontStyles.semiBold20.copyWith(
                  color: ColorStyles.white,
                ),
              ),
              Text(
                viewModel.sigudongData?.toString() ?? '',
                style: FontStyles.regular16.copyWith(
                  color: ColorStyles.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginBtnWidget extends StatelessWidget {
  // onpressed 함수, 이미지 주소는 파라미터로 받아서 사용
  final Function onPressed;
  final String image;

  const LoginBtnWidget({
    super.key,
    required this.onPressed,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const ShapeDecoration(
        color: ColorStyles.gray0,
        shape: CircleBorder(),
      ),
      child: IconButton(
        icon: SvgPicture.asset(
          image,
        ), // 로고 이미지
        onPressed: () {
          onPressed();
        },
      ),
    );
  }
}
