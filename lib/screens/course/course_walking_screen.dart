import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:naemansan/utilities/spot_icon_list.dart';
import 'package:naemansan/utilities/style/color_styles.dart';
import 'package:naemansan/utilities/style/font_styles.dart';
import 'package:naemansan/viewModel/course_walking_view_model.dart';
import 'package:naemansan/viewModel/walking/course_spot_create_view_model.dart';
import 'package:naemansan/widget/base/two_btn_bottom_sheet_widget.dart';
import 'package:naemansan/widget/spot/spot_create_widget.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';

class CourseWalkingScreen extends StatefulWidget {
  const CourseWalkingScreen({super.key});

  @override
  State<CourseWalkingScreen> createState() => _CourseWalkingScreenState();
}

class _CourseWalkingScreenState extends State<CourseWalkingScreen> {
  void _showSpotCreateModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) => SpotCreateWidget(),
    );
  }

  Widget _buildSpotButton() {
    return InkWell(
      onTap: () => _showSpotCreateModal(context),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
        decoration: BoxDecoration(
          color: ColorStyles.main1,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          "Spot 남기기",
          style: FontStyles.semiBold20.copyWith(color: ColorStyles.white),
        ),
      ),
    );
  }

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
