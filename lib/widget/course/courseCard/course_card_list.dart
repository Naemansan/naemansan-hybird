import 'package:flutter/material.dart';
import 'package:naemansan/models/course_card_model.dart';
import 'package:naemansan/widget/course/courseCard/course_card.dart';

class CourseCardList extends StatelessWidget {
  final List<CourseCardModel> courseList;
  const CourseCardList({super.key, required this.courseList});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: courseList
          .map((course) => CourseCard(
                courseInfo: course,
              ))
          .toList(),
    );
  }
}
