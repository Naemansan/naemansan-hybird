import 'package:flutter/material.dart';
import 'package:naemansan/models/course_overview_model.dart';
import 'package:naemansan/widget/course/courseCard/course_card.dart';

class CourseOverviewList extends StatelessWidget {
  final List<CourseOverviewModel> courseList;
  const CourseOverviewList({super.key, required this.courseList});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: courseList
          .map((course) => CourseOverview(
                courseInfo: course,
              ))
          .toList(),
    );
  }
}
