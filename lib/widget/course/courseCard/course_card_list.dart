import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:naemansan/viewModel/course_list_view_model.dart';
import 'package:naemansan/widget/course/courseCard/course_card.dart';
import 'package:naemansan/widget/course/courseCard/private_course_card.dart';

class CourseCardList extends StatefulWidget {
  final List<int>? tagIds;
  final double? lati;
  final double? longi;
  final int? page;
  final int? size;

  const CourseCardList(
      {super.key, this.tagIds, this.lati, this.longi, this.page, this.size});

  @override
  State<CourseCardList> createState() => _CourseCardListState();
}

class _CourseCardListState extends State<CourseCardList> {
  @override
  Widget build(BuildContext context) {
    final CourseListViewModel courseListViewModel =
        Get.put(CourseListViewModel());

    return GetBuilder<CourseListViewModel>(builder: (context) {
      courseListViewModel.loadCourseListData(
          widget.tagIds, widget.lati, widget.longi, widget.page, widget.size);

      return Column(
        children: courseListViewModel.courses
            .map((course) => course.isEnrolled
                ? (CourseCard(
                    courseInfo: course,
                  ))
                : (PrivateCourseCard(
                    courseInfo: course,
                  )))
            .toList(),
      );
    });
  }
}
