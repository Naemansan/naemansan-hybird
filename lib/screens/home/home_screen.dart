import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naemansan/models/near_course_model.dart';
import 'package:naemansan/viewModel/course_view_model.dart';
import 'package:naemansan/viewModel/home_view_model.dart';
import 'package:naemansan/widget/home/course_start_btn_widget.dart';
import 'package:naemansan/widget/course/courseBtn/near_course_btn_widget.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // HomeViewModel과 CourseController를 초기화한다.
    final HomeViewModel homeViewModel = Get.put(HomeViewModel());
    final CourseController courseController = Get.put(CourseController());

    // 스크롤 이벤트 리스너를 설정한다. 현재 가장 보이는 코스 카드에 따라 지도의 경로를 업데이트한다.
    homeViewModel.scrollController.addListener(() {
      if (courseController.course.value?.courses.isNotEmpty ?? false) {
        // 가장 많이 보이는 카드의 인덱스 가져오기
        int mostVisibleIndex = homeViewModel.getMostVisibleCardIndex(
            courseController.course.value!.courses.length + 1);

        if (mostVisibleIndex > 0) {
          // 0번째 요소를 건너뜀
          Course mostVisibleCourse =
              courseController.course.value!.courses[mostVisibleIndex - 1];
          // 경로 업데이트
          homeViewModel.updatePathOverlays(mostVisibleCourse.locations);
        }
      }
    });

    return Scaffold(
      body: GetBuilder<HomeViewModel>(
        init: homeViewModel,
        builder: (viewModel) {
          // 로딩 중일 때 로딩 인디케이터를 표시한다.
          if (viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          // 스택 레이아웃을 사용하여 NaverMap과 코스 목록을 표시한다.
          return Stack(
            children: [
              // NaverMap 위젯을 설정한다. HomeViewModel에서 제공하는 데이터를 사용하여 지도를 구성한다.
              Obx(() => NaverMap(
                    scrollGestureEnable: false,
                    zoomGestureEnable: false,
                    mapType: MapType.Basic,
                    pathOverlays: homeViewModel.pathOverlays.value,
                    initialCameraPosition: CameraPosition(
                      target: viewModel.currentLocation?.toLatLng() ??
                          const LatLng(37.3595704, 127.105399),
                      zoom: 17,
                    ),
                    initLocationTrackingMode: LocationTrackingMode.values[1],
                  )),
              // 코스 목록을 수평 스크롤 형태로 표시한다.
              Positioned(
                bottom: 20,
                left: 16,
                right: 0,
                child: Obx(
                  () {
                    // 코스 데이터를 로딩 중일 경우 로딩 인디케이터를 표시한다.
                    if (courseController.isLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    final courses = courseController.getCourse;
                    // 코스 데이터가 없을 경우 안내 메시지를 표시한다.
                    if (courses == null) {
                      return Container(
                        color: Colors.white,
                        child: const Text("코스가 없습니다."),
                      );
                    }
                    // 코스 카드를 리스트로 표시한다. 각 카드는 CourseCardWidget으로 구성된다.
                    return SizedBox(
                      height: 120,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        controller: homeViewModel.scrollController,
                        itemBuilder: (context, index) {
                          // 0번째 카드는 코스 시작 버튼
                          if (index == 0) {
                            return CourseStartBtnWidget();
                          }
                          // 다른 인덱스에는 코스 목록을 표시한다.
                          // 첫 번째 버튼을 고려하여 실제 코스 목록 인덱스를 조정한다.
                          int courseIndex = index - 1;
                          return SizedBox(
                            width: 320,
                            child: CourseCardWidget(
                                onCourseTap: (courseIndex) {
                                  // 코스 카드 선택 시 해당 코스 화면으로 이동한다.
                                  Get.toNamed("/course/$courseIndex");
                                },
                                course: courses.courses[courseIndex]),
                          );
                        },
                        // 코스 카드 사이에 간격
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 16),
                        itemCount: courses.courses.length + 1,
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
