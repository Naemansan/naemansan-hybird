import 'package:flutter/material.dart';
import 'package:naemansan/models/course/course_overview_model.dart';
import 'package:naemansan/models/tag_model.dart';
import 'package:naemansan/utilities/tag_list.dart';

import 'package:naemansan/utilities/style/color_styles.dart';
import 'package:naemansan/utilities/style/font_styles.dart';

import 'package:naemansan/widget/common/button/tag_btn.dart';
import 'package:naemansan/widget/course/courseCard/course_card_list.dart';

class CurationNear extends StatefulWidget {
  const CurationNear({super.key});

  @override
  State<CurationNear> createState() => _CurationNearState();
}

class _CurationNearState extends State<CurationNear> {
  var currentSelect = [];

  //^:dummy
  var courseList = [
    CourseOverviewModel(
        id: 1,
        title: "산책로1",
        siGuDong: "경기도 화성시 석우동",
        distance: 1234,
        tags: [
          Tag(id: 1, tag: "@"),
          Tag(id: 1, tag: "@"),
          Tag(id: 1, tag: "@")
        ],
        moment_cnt: 1,
        like_cnt: 2,
        isEnrolled: true),
    CourseOverviewModel(
        id: 1,
        title: "산책로1",
        siGuDong: "경기도 화성시 석우동",
        distance: 1234,
        tags: [
          Tag(id: 1, tag: "@"),
          Tag(id: 1, tag: "@"),
          Tag(id: 1, tag: "@")
        ],
        moment_cnt: 1,
        like_cnt: 2,
        isEnrolled: true)
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //타이틀
        Container(
          padding: const EdgeInsets.fromLTRB(4, 4, 4, 16),
          child: Row(
            children: [
              Text(
                "^:장소",
                style: FontStyles.semiBold20.copyWith(color: ColorStyles.main1),
              ),
              Text(
                "의 산책로",
                style: FontStyles.semiBold20.copyWith(color: ColorStyles.black),
              ),
            ],
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
                children: TagConfig.tagList
                    .asMap()
                    .entries
                    .map((element) => TagBtn(
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
