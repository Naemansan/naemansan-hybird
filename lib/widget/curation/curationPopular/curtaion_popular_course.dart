import 'package:flutter/material.dart';

import 'package:naemansan/utilities/style/color_styles.dart';
import 'package:naemansan/utilities/style/font_styles.dart';

import 'package:naemansan/widget/course/courseCard/course_card_list.dart';
import 'package:naemansan/models/course_overview_model.dart';

import 'package:naemansan/models/keyword_model.dart';
import 'package:naemansan/widget/common/keyword_btn.dart';

class CurationPopularCourse extends StatefulWidget {
  const CurationPopularCourse({super.key});

  @override
  State<CurationPopularCourse> createState() => _CurationPopularCourseState();
}

class _CurationPopularCourseState extends State<CurationPopularCourse> {
  var currentSelect = [];

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
        likeCount: 2),
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
        likeCount: 2)
  ];

  @override
  Widget build(BuildContext context) {
    final keywords = [
      "일상속 여유",
      '평온한 힐링',
      '자연과 함께',
      '활기찬 분위기',
      '감성충만',
      '도심풍경',
      '새로운 모험',
      '고즈넉한 무드',
      "강길을 따라",
      "일상의 재발견",
    ];

    return Column(
      children: [
        //타이틀
        Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(4, 4, 4, 16),
          child: Text(
            "전국의 다양한 산책로",
            style: FontStyles.semiBold20.copyWith(color: ColorStyles.black),
          ),
        ), //타이틀

        //태그 선택
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          width: double.infinity,
          child: SingleChildScrollView(
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            child: Row(
                children: keywords
                    .asMap()
                    .entries
                    .map((element) => KeywordBtn(
                        isSelected: (currentSelect.contains((element.key))),
                        content: element.value,
                        onBtnTap: () {
                          //선택시 서치에 포함됨
                          setState(() {
                            if (currentSelect.contains(element.key)) {
                              currentSelect.remove(element.key);
                            } else {
                              currentSelect.add(element.key);
                            }
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
