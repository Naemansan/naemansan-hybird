import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naemansan/models/near_course_model.dart';
import 'package:naemansan/viewModel/course_view_model.dart';
import 'package:naemansan/viewModel/home_view_model.dart';
import 'package:naemansan/widget/home/near_course_btn_widget.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 홈 화면에 HomeViewModel 연결
    final HomeViewModel homeViewModel = Get.put(HomeViewModel());
    final CourseController courseController = Get.put(CourseController());

    homeViewModel.scrollController.addListener(() {
      int mostVisibleIndex = homeViewModel.getMostVisibleCardIndex(
          courseController.course.value!.courses.length);
      Course mostVisibleCourse =
          courseController.course.value!.courses[mostVisibleIndex];
      homeViewModel.updatePathOverlays(mostVisibleCourse.locations);
    });

    return Scaffold(
      body: GetBuilder<HomeViewModel>(
        init: homeViewModel,
        builder: (viewModel) {
          if (viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return Stack(
            children: [
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
              Positioned(
                bottom: 20,
                left: 16,
                right: 0,
                child: Obx(
                  () {
                    if (courseController.isLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    final courses = courseController.getCourse;
                    if (courses == null) {
                      return Container(
                        color: Colors.white,
                        child: const Text("코스가 없습니다."),
                      );
                    }

                    return SizedBox(
                      height: 120,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        controller: homeViewModel.scrollController,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            width: 320,
                            child: CourseCardWidget(
                                onCourseTap: (id) {
                                  // 코스 선택 시 코스 화면으로 이동
                                  Get.toNamed("/course/$id");
                                },
                                course: courses.courses[index]),
                          );
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 16),
                        itemCount: courses.courses.length,
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
