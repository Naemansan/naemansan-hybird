// 스팟 남기기 버튼 옆에 스팟 개수 표시 위쳇
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naemansan/utilities/style/color_styles.dart';
import 'package:naemansan/utilities/style/font_styles.dart';
import 'package:naemansan/viewModel/course_walking_view_model.dart';
import 'package:naemansan/widget/base/one_btn_bottom_sheet_widget.dart';

Widget buildSpotCnt(CourseWalkingViewModel viewModel, BuildContext context) {
  return InkWell(
    onTap: () => {
      // 만든 스팟 리스트 보여주기
      OneBtnBottomSheetWidget.show(
        context: context,
        title: "제작한 스팟 리스트 ${viewModel.spotList.length}/5",
        description: viewModel.spotList.map((spot) => spot.title).join(","),
      )
    },
    child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        decoration: BoxDecoration(
          color: ColorStyles.white,
          borderRadius: BorderRadius.circular(48),
          border: Border.all(color: ColorStyles.main1, width: 2),
        ),
        child: Obx(
          () => Text(
            "${viewModel.spotList.length}/5",
            style: FontStyles.semiBold12.copyWith(color: ColorStyles.main1),
          ),
        )),
  );
}
