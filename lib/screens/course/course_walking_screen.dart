import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naemansan/utilities/style/color_styles.dart';
import 'package:naemansan/utilities/style/font_styles.dart';
import 'package:naemansan/viewModel/course_walking_view_model.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';

class CourseWalkingScreen extends StatelessWidget {
  const CourseWalkingScreen({super.key});

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
                          // 스크롤 가능하도록 설정
                          isScrollControlled: true,
                          builder: (BuildContext context) {
                            // BottomSheet의 높이를 설정한다.
                            return DraggableScrollableSheet(
                              // BottomSheet의 높이를 설정한다.
                              // expand: false로 설정하면 높이를 설정할 수 있다.
                              expand: false,

                              builder: (_, ScrollController scrollController) {
                                return Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 36),
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(24)),
                                  ),
                                  child: ListView(
                                    controller: scrollController,
                                    children: <Widget>[
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '스팟 남기기',
                                            style:
                                                FontStyles.semiBold20.copyWith(
                                              color: ColorStyles.black,
                                            ),
                                          ),
                                          Text("스팟에 대한 정보를 입력해주세요.",
                                              style:
                                                  FontStyles.regular16.copyWith(
                                                color: ColorStyles.gray3,
                                              )),
                                          const SizedBox(height: 16),
                                          Text(
                                            "스팟 이름",
                                            style:
                                                FontStyles.semiBold16.copyWith(
                                              color: ColorStyles.black,
                                            ),
                                          ),
                                          const TextField(
                                            decoration: InputDecoration(
                                              labelText: '스팟 이름',
                                              hintText: '스팟의 이름을 입력하세요.',
                                            ),
                                          ),
                                          const SizedBox(height: 28),
                                          Text(
                                            "스팟 설정",
                                            style:
                                                FontStyles.semiBold16.copyWith(
                                              color: ColorStyles.black,
                                            ),
                                          ),
                                          const TextField(
                                            decoration: InputDecoration(
                                              labelText: '스팟 설명',
                                              hintText: '스팟에 대한 설명을 입력하세요.',
                                            ),
                                          ),
                                          const SizedBox(height: 28),
                                          Text(
                                            "스팟 카테고리",
                                            style:
                                                FontStyles.semiBold16.copyWith(
                                              color: ColorStyles.black,
                                            ),
                                          ),
                                          // 가로 슬라이더
                                        ],
                                      ),

                                      const SizedBox(height: 20),
                                      // Add your icon buttons here
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .center, // Center row contents horizontally
                                        children: [
                                          Expanded(
                                              flex: 2,
                                              child: TextButton(
                                                onPressed: () {},
                                                style: TextButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                  ),
                                                  side: const BorderSide(
                                                      color: ColorStyles.gray1,
                                                      width: 2),
                                                  backgroundColor:
                                                      ColorStyles.white,
                                                  foregroundColor:
                                                      ColorStyles.gray1,
                                                ),
                                                child: Center(
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        vertical: 10),
                                                    child: Text(
                                                      '취소',
                                                      style: FontStyles
                                                          .semiBold20
                                                          .copyWith(),
                                                    ),
                                                  ),
                                                ),
                                              )),
                                          const SizedBox(
                                              width:
                                                  16), // Spacing between buttons
                                          Expanded(
                                              flex: 4,
                                              child: TextButton(
                                                onPressed: () {},
                                                //background color
                                                style: TextButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                  ),
                                                  backgroundColor:
                                                      ColorStyles.gray0,
                                                  foregroundColor:
                                                      ColorStyles.gray3,
                                                ),
                                                child: Center(
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        vertical: 10),
                                                    child: Text(
                                                      '스팟 등록하기',
                                                      style: FontStyles
                                                          .semiBold20
                                                          .copyWith(),
                                                    ),
                                                  ),
                                                ),
                                              )),
                                        ],
                                      )
                                    ],
                                  ),
                                );
                              },
                            );
                          },
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
