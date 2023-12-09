import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:naemansan/utilities/spot_icon_list.dart';
import 'package:naemansan/utilities/style/color_styles.dart';
import 'package:naemansan/utilities/style/font_styles.dart';
import 'package:naemansan/viewModel/course_walking_view_model.dart';
import 'package:naemansan/viewModel/walking/course_spot_create_view_model.dart';
import 'package:naemansan/widget/spot/spot_create_widget.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';

class CourseWalkingScreen extends StatefulWidget {
  const CourseWalkingScreen({super.key});

  @override
  State<CourseWalkingScreen> createState() => _CourseWalkingScreenState();
}

class _CourseWalkingScreenState extends State<CourseWalkingScreen> {
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final CourseWalkingViewModel walkingViewModel =
        Get.put(CourseWalkingViewModel());

    return Scaffold(
      body: GetBuilder<CourseWalkingViewModel>(
          init: walkingViewModel,
          builder: (viewModel) {
            // var overlays = {viewModel.currentPathOverlay.value!};
            return Stack(
              children: [
                NaverMap(
                  locationButtonEnable: true,
                  mapType: MapType.Basic,
                  // overlays가 null일때는 pathOverLaysd안그리고 그 이후에 길이가 2 이상일때 그리기 시작한다.

                  initialCameraPosition: CameraPosition(
                    target: viewModel.latLngList.isNotEmpty
                        ? viewModel.latLngList.last
                        : const LatLng(37.3595704, 127.105399),
                    zoom: 17,
                  ),
                  onMapCreated: (NaverMapController controller) {
                    if (viewModel.latLngList.isNotEmpty) {
                      controller.moveCamera(
                        CameraUpdate.toCameraPosition(
                          CameraPosition(
                              target: viewModel.latLngList.last, zoom: 17),
                        ),
                      );
                    }
                  },
                  initLocationTrackingMode: LocationTrackingMode.Follow,
                ),
                Positioned(
                  bottom: 75,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (BuildContext context) => SpotCreateWidget(),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 12),
                        decoration: BoxDecoration(
                          color: ColorStyles.main1,
                          borderRadius:
                              BorderRadius.circular(8), // Rounded corners
                        ),
                        child: Text(
                          "Spot 남기기",
                          style: FontStyles.semiBold20.copyWith(
                            color: ColorStyles.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 65,
                  right: 20,
                  child: Center(
                    child: InkWell(
                      onTap: () => viewModel.endWalk(),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 19, vertical: 8),
                        decoration: BoxDecoration(
                          color: ColorStyles.main1,
                          borderRadius:
                              BorderRadius.circular(48), // Rounded corners
                        ),
                        child: Text(
                          "산책 종료",
                          style: FontStyles.semiBold12.copyWith(
                            color: ColorStyles.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
