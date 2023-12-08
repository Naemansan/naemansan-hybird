import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naemansan/utilities/style/color_styles.dart';
import 'package:naemansan/utilities/style/font_styles.dart';
import 'package:naemansan/viewModel/home_view_model.dart';

class CourseStartBtnWidget extends StatelessWidget {
  final HomeViewModel viewModel = Get.find();
  CourseStartBtnWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    print("courseData is empty");
    return InkWell(
      onTap: () {
        // CourseWalking 화면으로 이동
        Get.toNamed('/course/walking');
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
