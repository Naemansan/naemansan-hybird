import 'package:flutter/material.dart';
import 'package:naemansan/models/course_overview_model.dart';
import 'package:naemansan/widget/course/courseCard/course_card.dart';
import 'package:naemansan/widget/course/courseCard/private_course_card.dart';

class CourseCardList extends StatelessWidget {
  final List<CourseOverviewModel> courseList;
  const CourseCardList({super.key, required this.courseList});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: courseList
          .map((course) => PrivateCourseCard(
                courseInfo: course,
              ))
          .toList(),
    );
  }
}
