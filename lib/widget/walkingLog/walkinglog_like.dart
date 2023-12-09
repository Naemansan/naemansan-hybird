import 'package:flutter/material.dart';
import 'package:naemansan/models/course_overview_model.dart';
import 'package:naemansan/models/tag_model.dart';
import 'package:naemansan/widget/course/courseCard/course_card_list.dart';

class WalkingLogLike extends StatelessWidget {
  const WalkingLogLike({super.key});

  @override
  Widget build(BuildContext context) {
    //^:dummy
    var courseList = [
      CourseOverviewModel(
          id: 1,
          title: "산책로1",
          siGuDong: "경기도 화성시 석우동",
          distance: "1,234m",
          tags: [
            TagModel(id: 1, tag: "@"),
            TagModel(id: 1, tag: "@"),
            TagModel(id: 1, tag: "@")
          ],
          momentCount: 1,
          likeCount: 2,
          isPublished: true),
      CourseOverviewModel(
          id: 1,
          title: "산책로1",
          siGuDong: "경기도 화성시 석우동",
          distance: "1,234m",
          tags: [
            TagModel(id: 1, tag: "@"),
            TagModel(id: 1, tag: "@"),
            TagModel(id: 1, tag: "@")
          ],
          momentCount: 1,
          likeCount: 2,
          isPublished: true)
    ];
    return CourseCardList(courseList: courseList);
  }
}
