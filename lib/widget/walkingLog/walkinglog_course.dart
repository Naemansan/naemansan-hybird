import 'package:flutter/material.dart';
import 'package:naemansan/models/course_overview_model.dart';
import 'package:naemansan/models/keyword_model.dart';

import 'package:naemansan/utilities/style/color_styles.dart';
import 'package:naemansan/utilities/style/font_styles.dart';

import 'package:naemansan/widget/common/button/keyword_btn.dart';
import 'package:naemansan/widget/course/courseCard/course_card_list.dart';

class WalkingLogCourse extends StatefulWidget {
  const WalkingLogCourse({super.key});

  @override
  State<WalkingLogCourse> createState() => _WalkingLogCourseState();
}

class _WalkingLogCourseState extends State<WalkingLogCourse> {
  var currentSelect = 0;

  //^:dummy
  var courseList = [
    CourseOverviewModel(
        id: 1,
        title: "산책로1",
        siGuDong: "경기도 화성시 석우동",
        distance: "1,234m",
        keywords: [
          KeywordModel(id: 1, keyword: "@"),
          KeywordModel(id: 1, keyword: "@"),
          KeywordModel(id: 1, keyword: "@")
        ],
        momentCount: 1,
        likeCount: 2,
        isPublished: true),
    CourseOverviewModel(
        id: 1,
        title: "산책로1",
        siGuDong: "경기도 화성시 석우동",
        distance: "1,234m",
        keywords: [
          KeywordModel(id: 1, keyword: "@"),
          KeywordModel(id: 1, keyword: "@"),
          KeywordModel(id: 1, keyword: "@")
        ],
        momentCount: 1,
        likeCount: 2,
        isPublished: false)
  ];

  @override
  Widget build(BuildContext context) {
    final subTag = ["전체", "공개", "미공개"];

    return Column(
      children: [
        //태그 선택
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          width: double.infinity,
          child: SingleChildScrollView(
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            child: Row(
                children: subTag
                    .asMap()
                    .entries
                    .map((element) => KeywordBtn(
                        isSelected: (currentSelect == element.key),
                        content: element.value,
                        onBtnTap: () {
                          setState(() {
                            currentSelect = element.key;
                          });
                        }))
                    .toList()),
          ),
        ), //태그 선택

        CourseCardList(courseList: courseList)
      ],
    );
  }
}
