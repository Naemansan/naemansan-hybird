import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naemansan/utilities/style/color_styles.dart';
import 'package:naemansan/utilities/style/font_styles.dart';
import 'package:naemansan/viewModel/course_detail_view_model.dart';
import 'package:naemansan/widget/course/courseDetail/course_detail_description.dart';
import 'package:naemansan/widget/course/courseDetail/course_detail_info.dart';

import 'package:naemansan/widget/course/courseDetail/course_detail_moment_list.dart';

import 'package:naemansan/widget/course/courseDetail/course_detail_similar_course_list.dart';
import 'package:naemansan/widget/course/courseDetail/course_detail_spot_list.dart';
import 'package:naemansan/widget/course/courseDetail/course_detail_writer.dart';

class CourseDetailScreen extends StatelessWidget {
  const CourseDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CourseDetailViewModel viewModel = Get.put(CourseDetailViewModel());

    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder<CourseDetailViewModel>(
        init: viewModel,
        builder: (viewModel) {
          return SingleChildScrollView(
            child: Container(
              color: ColorStyles.white,
              width: double.infinity,
              child: Column(children: [
                //썸네일
                Container(
                  color: ColorStyles.gray2,
                  height: 180,
                ), //썸네일

                //산책로 정보
                Container(
                  padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
                  child: Column(
                    children: [
                      CourseDetailInfo(
                          name: viewModel.courseDetailInfo.name,
                          location: viewModel.courseDetailInfo.location,
                          distance: viewModel.courseDetailInfo.distance,
                          tags: viewModel.courseDetailInfo.tags),

                      //작성자
                      CourseDetailWriter(
                        writer: viewModel.courseDetailInfo.writer,
                        date: viewModel.courseDetailInfo.date,
                      ),

                      //소개
                      CourseDetailDescription(
                          description: viewModel.courseDetailInfo.description),

                      //모먼트
                      CourseDetailMomentList(
                          momentList: viewModel.courseDetailInfo.momnetList)
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
                    CourseDetailSpotList(
                      spotList: viewModel.courseDetailInfo.spotList,
                    ),
                    CourseDetailSimilarCourseList(
                      similarCourseList:
                          viewModel.courseDetailInfo.similarCourseList,
                    ),
                  ]),
                )
              ]),
            ),
          );
        },
      ),
    );
  }
}
