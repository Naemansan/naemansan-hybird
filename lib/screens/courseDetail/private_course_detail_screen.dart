import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naemansan/method/get_scale_width.dart';
import 'package:naemansan/utilities/style/color_styles.dart';

import 'package:naemansan/viewModel/course_detail_view_model.dart';
import 'package:naemansan/widget/base/custom_appbar.dart';
import 'package:naemansan/widget/common/button/bottom_button.dart';

import 'package:naemansan/widget/common/button/solid_button.dart';

import 'package:naemansan/widget/course/courseDetail/course_detail_description.dart';
import 'package:naemansan/widget/course/courseDetail/course_detail_info.dart';

import 'package:naemansan/widget/course/courseDetail/course_detail_moment_list.dart';

import 'package:naemansan/widget/course/courseDetail/course_detail_spot_list.dart';

class PrivateCourseDetailScreen extends StatelessWidget {
  const PrivateCourseDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String courseId = Get.parameters['courseId'] ?? '';
    final CourseDetailViewModel courseViewModel =
        Get.put(CourseDetailViewModel());

    courseViewModel.loadCourseDetailData(int.parse(courseId));

    return Scaffold(
        //앱바...
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(48),
            child: CustomAppbar(
              leftIcon: "left",
              rightIcon: "edit",
              rightLink:
                  "/privateCourseEdit/${courseViewModel.course.value.id}",
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
                    height: getScaleWidth(context) * 180,
                    child: Image.asset(
                      fit: BoxFit.cover,
                      'assets/images/defaultImage.png',
                    ),
                  ), //썸네일

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

                        //소개
                        CourseDetailDescription(
                            content: courseViewModel.course.value.content),

                        //모먼트
                        Visibility(
                            visible: courseViewModel.moments.isNotEmpty,
                            child: CourseDetailMomentList(
                                momentList: courseViewModel.moments))
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
                    ]),
                  )
                ]),
              ),
            );
          },
        ),
        bottomNavigationBar: BottomButton(
          buttonList: [
            SolidButton(
                content: "산책로 공개하기",
                isActive: true,
                onTap: () => Get.toNamed("/privateCoursePublish/1"))
          ],
        ));
  }
}
