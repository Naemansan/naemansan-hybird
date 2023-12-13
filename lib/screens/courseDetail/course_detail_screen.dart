import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naemansan/method/get_scale_width.dart';
import 'package:naemansan/utilities/style/color_styles.dart';

import 'package:naemansan/viewModel/course_detail_view_model.dart';

import 'package:naemansan/widget/base/custom_appbar.dart';
import 'package:naemansan/widget/common/button/bottom_button.dart';
import 'package:naemansan/widget/common/button/like_button.dart';
import 'package:naemansan/widget/common/button/solid_button.dart';
import 'package:naemansan/widget/course/courseDetail/course_detail_description.dart';
import 'package:naemansan/widget/course/courseDetail/course_detail_info.dart';

import 'package:naemansan/widget/course/courseDetail/course_detail_moment_list.dart';

import 'package:naemansan/widget/course/courseDetail/course_detail_similar_course_list.dart';
import 'package:naemansan/widget/course/courseDetail/course_detail_spot_list.dart';
import 'package:naemansan/widget/course/courseDetail/course_detail_writer.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';

class CourseDetailScreen extends StatelessWidget {
  const CourseDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String courseId = Get.parameters['courseId'] ?? '';
    final CourseDetailViewModel courseViewModel =
        Get.put(CourseDetailViewModel());

    courseViewModel.loadCourseDetailData(int.parse(courseId));
    return Scaffold(
        //앱바...
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(48),
            child: CustomAppbar(
              leftIcon: "left",
              rightIcon: null,
              content: '',
            )),
        //앱바...

        body: GetBuilder<CourseDetailViewModel>(
          init: courseViewModel,
          builder: (courseViewModel) {
            return SingleChildScrollView(
              child: Container(
                color: ColorStyles.white,
                width: double.infinity,
                child: Column(children: [
                  //썸네일
                  SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height *
                        0.2, // 높이를 원하는 비율로 조절
                    child: Stack(
                      children: [
                        // 썸네일 이미지
                        SizedBox(
                          width: double.infinity,
                          height: double.infinity, // Container와 동일한 크기로 설정
                          child: Image.asset(
                            'assets/images/defaultImage.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        // Naver 지도 위젯
                        Positioned.fill(
                          child: NaverMap(
                            scrollGestureEnable: false,
                            zoomGestureEnable: false,
                            mapType: MapType.Basic,
                            pathOverlays: {
                              PathOverlay(
                                PathOverlayId('path'),
                                courseViewModel.course.value.locations,
                                width: 12,
                                color: ColorStyles.main2,
                                outlineColor: Colors.transparent,
                              ),
                            },
                            initialCameraPosition: CameraPosition(
                              target:
                                  courseViewModel.course.value.locations.first,
                              zoom: 17,
                            ),
                            initLocationTrackingMode: LocationTrackingMode.None,
                          ),
                        ),
                      ],
                    ),
                  ),

                  //산책로 정보
                  Container(
                    padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
                    child: Column(
                      children: [
                        CourseDetailInfo(
                            name: courseViewModel.course.value.title,
                            siGuDong: courseViewModel.course.value.siGuDong,
                            distance: courseViewModel.course.value.distance,
                            tags: courseViewModel.course.value.tags),

                        //작성자
                        CourseDetailWriter(
                          userNickName:
                              courseViewModel.course.value.userNickName,
                          userId: courseViewModel.course.value.userId,
                          createdAt: courseViewModel.course.value.createdAt,
                        ),

                        //소개
                        CourseDetailDescription(
                            content: courseViewModel.course.value.content),

                        //모먼트
                        Visibility(
                          visible: courseViewModel.moments.isNotEmpty,
                          child: CourseDetailMomentList(
                              momentList: courseViewModel.moments),
                        )
                      ],
                    ),
                  ), //산책로 정보

                  //구분선
                  Container(
                    height: 8,
                    width: double.infinity,
                    color: ColorStyles.gray0,
                  ), //구분선

                  Container(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
                    width: double.infinity,
                    child: Column(children: [
                      //스팟 리스트
                      CourseDetailSpotList(
                        spotList: courseViewModel.spots,
                      ),
                      //유사 산책로 리스트
                      Visibility(
                        visible: courseViewModel.similarCourses.isNotEmpty,
                        child: CourseDetailSimilarCourseList(
                          similarCourseList: courseViewModel.similarCourses,
                        ),
                      )
                    ]),
                  )
                ]),
              ),
            );
          },
        ),
        bottomNavigationBar: BottomButton(
          buttonList: [
            LikeButton(
                likeNum: "11", isLiked: true, onTap: () => print("좋아요~")),
            const SizedBox(width: 8),
            SolidButton(
                content: "산책로 걷기",
                isActive: true,
                onTap: () => print("^:산책로 걷기"))
          ],
        ));
  }
}
