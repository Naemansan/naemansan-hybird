import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naemansan/models/geolocation_model.dart';
import 'package:naemansan/models/near_course_model.dart';
import 'package:naemansan/utilities/style/color_styles.dart';
import 'package:naemansan/utilities/style/font_styles.dart';
import 'package:naemansan/viewModel/course_view_model.dart';
import 'package:naemansan/viewModel/home_view_model.dart';
import 'package:naemansan/widget/home/course_start_btn_widget.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    // 홈 화면에 HomeViewModel 연결
    final HomeViewModel homeViewModel = Get.put(HomeViewModel());
    final CourseController courseController = Get.put(CourseController());
    int getMostVisibleCardIndex() {
      double cardWidth = 320.0;
      double currentScroll = scrollController.offset;

      int index = (currentScroll / cardWidth).round();
      return index.clamp(0, courseController.course.value!.courses.length - 1);
    }

    scrollController.addListener(() {
      int mostVisibleIndex = getMostVisibleCardIndex();
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
                        controller: scrollController,
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

class CourseCardWidget extends StatelessWidget {
  final Course course;
  final Function(int) onCourseTap;

  const CourseCardWidget(
      {super.key, required this.course, required this.onCourseTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onCourseTap(course.id),
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          color: ColorStyles.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(4),
            // 테두리 green
          ),
          border: Border.all(
            color: ColorStyles.main1,
            width: 2,
          ),
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
                course.title,
                style: FontStyles.semiBold20.copyWith(
                  color: ColorStyles.black,
                ),
              ),
              Row(
                children: [
                  Text(
                    course.siGuDong,
                    style: FontStyles.regular16.copyWith(
                      color: ColorStyles.black,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    "·",
                    style: FontStyles.regular16.copyWith(
                      color: ColorStyles.black,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    course.distance,
                    style: FontStyles.regular16.copyWith(
                      color: ColorStyles.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    "#${course.keywords[0].keyword}",
                    style: FontStyles.regular12.copyWith(
                      color: ColorStyles.gray3,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    "#${course.keywords[1].keyword}",
                    style: FontStyles.regular12.copyWith(
                      color: ColorStyles.gray3,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    "#${course.keywords[2].keyword}",
                    style: FontStyles.regular12.copyWith(
                      color: ColorStyles.gray3,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
