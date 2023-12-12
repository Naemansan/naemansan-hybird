import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naemansan/utilities/style/color_styles.dart';
import 'package:naemansan/utilities/style/font_styles.dart';
import 'package:naemansan/viewModel/course_walking_view_model.dart';
import 'package:naemansan/widget/base/one_btn_bottom_sheet_widget.dart';
import 'package:naemansan/widget/base/two_btn_bottom_sheet_widget.dart';
import 'package:naemansan/widget/spot/spot_create_widget.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';

class CourseWalkingScreen extends StatefulWidget {
  const CourseWalkingScreen({super.key});

  @override
  State<CourseWalkingScreen> createState() => _CourseWalkingScreenState();
}

class _CourseWalkingScreenState extends State<CourseWalkingScreen> {
  // 스팟 남기기 모달창 띄우기 위한 함수
  void _showSpotCreateModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) => const SpotCreateWidget(),
    );
  }

// 스팟 남기기 버튼
  Widget _buildSpotButton() {
    return InkWell(
      onTap: () => {
        if (Get.find<CourseWalkingViewModel>().spotCnt > 5)
          _showSpotCreateModal(context)
        else
          OneBtnBottomSheetWidget.show(
            context: context,
            title: "스팟이 너무 많아요!",
            description: "스팟은 한 산책로에 5개 까지 만들 수 있어요.",
          )
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
        decoration: BoxDecoration(
          color: ColorStyles.main1,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          "스팟 남기기",
          style: FontStyles.semiBold20.copyWith(color: ColorStyles.white),
        ),
      ),
    );
  }

// 스팟 남기기 버튼 옆에 스팟 개수 표시 위쳇
  Widget _buildSpotCnt(CourseWalkingViewModel viewModel) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        decoration: BoxDecoration(
          color: ColorStyles.white,
          borderRadius: BorderRadius.circular(48),
          border: Border.all(color: ColorStyles.main1, width: 2),
        ),
        child: Obx(
          () => Text(
            "${viewModel.spotCnt}/5",
            style: FontStyles.semiBold12.copyWith(color: ColorStyles.main1),
          ),
        ));
  }

// 산책 종료 버튼
  Widget _buildEndWalkButton(CourseWalkingViewModel viewModel) {
    return InkWell(
      onTap: () => {
        TwoBtnBottomSheetWidget.show(
            context: context,
            title: "산책을 종료하시겠습니까?",
            description: "산책을 종료하시면 기록이 중단됩니다.",
            buttonTitle: "산책 종료하기",
            onPressedGreenButton: () => viewModel.endWalk())
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 8),
        decoration: BoxDecoration(
          color: ColorStyles.main1,
          borderRadius: BorderRadius.circular(48),
        ),
        child: Text(
          "산책 종료",
          style: FontStyles.semiBold12.copyWith(color: ColorStyles.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CourseWalkingViewModel>(
      init: Get.put(CourseWalkingViewModel()),
      builder: (viewModel) {
        return Scaffold(
          body: Stack(
            children: [
              NaverMap(
                locationButtonEnable: true,
                mapType: MapType.Basic,
                initialCameraPosition: CameraPosition(
                  target: viewModel.latLngList.isNotEmpty
                      ? viewModel.latLngList.last
                      : const LatLng(37.3595704, 127.105399),
                  zoom: 17,
                ),
                onMapCreated: (controller) {
                  if (viewModel.latLngList.isNotEmpty) {
                    controller.moveCamera(CameraUpdate.toCameraPosition(
                      CameraPosition(
                          target: viewModel.latLngList.last, zoom: 17),
                    ));
                  }
                },
                initLocationTrackingMode: LocationTrackingMode.Follow,
              ),
              Positioned(
                bottom: 75,
                left: 0,
                right: 0,
                child: Center(child: _buildSpotButton()),
              ),
              Positioned(
                bottom: 75,
                right: 20,
                child: Center(child: _buildSpotCnt(viewModel)),
              ),
              Positioned(
                top: 80,
                right: 20,
                child: Center(child: _buildEndWalkButton(viewModel)),
              ),
            ],
          ),
        );
      },
    );
  }
}
