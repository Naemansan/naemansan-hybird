import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:naemansan/screens/home/home_screen.dart';
import 'package:naemansan/utilities/style/color_styles.dart';
import 'package:naemansan/utilities/style/font_styles.dart';
import 'package:naemansan/viewModel/course_walking_view_model.dart';
import 'package:naemansan/widget/base/one_btn_bottom_sheet_widget.dart';
import 'package:naemansan/widget/base/two_btn_bottom_sheet_widget.dart';
import 'package:naemansan/widget/spot/spot_cnt_widget.dart';
import 'package:naemansan/widget/spot/spot_create_widget.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';

class CourseWalkingScreen extends StatefulWidget {
  const CourseWalkingScreen({super.key});

  @override
  State<CourseWalkingScreen> createState() => _CourseWalkingScreenState();
}

class _CourseWalkingScreenState extends State<CourseWalkingScreen> {
  late final CourseWalkingViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = Get.put(CourseWalkingViewModel());

    //
  }

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
        if (Get.find<CourseWalkingViewModel>().spotList.length < 5)
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

// 산책 종료 버튼
  Widget _buildEndWalkButton(CourseWalkingViewModel viewModel) {
    return InkWell(
      onTap: () => {
        TwoBtnBottomSheetWidget.show(
            context: context,
            title: "산책을 종료하시겠습니까?",
            description: "산책을 종료하시면 기록이 중단됩니다.",
            buttonTitle: "산책 종료하기",
            onPressedCancelButton: () => {
                  // 취소
                  Get.back(),
                },
            onPressedGreenButton: () => {
                  // 산책을 기록하시겠습니까 묻기
                  TwoBtnBottomSheetWidget.show(
                    context: context,
                    title: "산책을 기록하시겠습니까?",
                    description: "산책을 기록하시면 산책 기록이 저장됩니다.",
                    buttonTitle: "산책 기록하기",
                    onPressedCancelButton: () => {
                      // 취소
                      Get.offAll(() => const HomeScreen()),
                    },
                    onPressedGreenButton: () => {
                      // 산책 기록하기
                      viewModel.endWalk(),
                      Get.back(),
                      Get.back(),
                    },
                  ),
                }),
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

  // FutureBuilder for marker images
  Widget buildNaverMap(CourseWalkingViewModel viewModel) {
    return FutureBuilder<List<OverlayImage>>(future: Future.wait(
      viewModel.spotList.map((spot) {
        // spot category lowercase
        final categoryLowerName = spot.category.toLowerCase();

        return OverlayImage.fromAssetImage(
          assetName: "assets/icons/$categoryLowerName.png",
        );
      }),
    ), builder:
        (BuildContext context, AsyncSnapshot<List<OverlayImage>> snapshot) {
      if (snapshot.connectionState == ConnectionState.done &&
          snapshot.hasData) {
        final markerImages = snapshot.data;

        return Obx(() => NaverMap(
              locationButtonEnable: true,
              mapType: MapType.Basic,
              initialCameraPosition: CameraPosition(
                target: viewModel.latLngList.isNotEmpty
                    ? viewModel.latLngList.last
                    : const LatLng(37.3595704, 127.105399),
                zoom: 17,
              ),
              pathOverlays: viewModel.currentPathOverlay.value != null
                  ? {viewModel.currentPathOverlay.value!}
                  : {},
              onMapCreated: (controller) {
                if (viewModel.latLngList.isNotEmpty) {
                  controller.moveCamera(CameraUpdate.toCameraPosition(
                    CameraPosition(
                      target: viewModel.latLngList.last,
                      zoom: 17,
                    ),
                  ));
                }
              },
              markers: viewModel.spotList.asMap().entries.map((entry) {
                final spot = entry.value;
                final markerImage = markerImages?[entry.key];

                return Marker(
                  markerId: spot.title,
                  position:
                      LatLng(spot.location.latitude, spot.location.longitude),
                  icon: markerImage,
                  width: 40,
                  height: 48,
                  captionText: spot.title,
                );
              }).toList(),
              initLocationTrackingMode: LocationTrackingMode.Follow,
            ));
      } else {
        return const CircularProgressIndicator();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CourseWalkingViewModel>(
      init: Get.find<CourseWalkingViewModel>(),
      builder: (viewModel) {
        // 로딩 중일 때 로딩 인디케이터를 표시한다.

        return Scaffold(
          body: Stack(
            children: [
              buildNaverMap(viewModel),
              Positioned(
                bottom: 75,
                left: 0,
                right: 0,
                child: Center(child: _buildSpotButton()),
              ),
              Positioned(
                bottom: 75,
                right: 20,
                child: Center(child: buildSpotCnt(viewModel, context)),
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
