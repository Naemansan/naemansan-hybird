import 'package:flutter/material.dart';
import 'package:naemansan/utilities/tag_list.dart';

import 'package:naemansan/utilities/style/color_styles.dart';
import 'package:naemansan/utilities/style/font_styles.dart';

import 'package:naemansan/widget/course/courseCard/course_card_list.dart';

import 'package:naemansan/widget/common/button/tag_btn.dart';

class CurationPopularCourse extends StatefulWidget {
  const CurationPopularCourse({super.key});

  @override
  State<CurationPopularCourse> createState() => _CurationPopularCourseState();
}

class _CurationPopularCourseState extends State<CurationPopularCourse> {
  List<int> currentSelect = [];

  @override
  Widget build(BuildContext context) {
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
        CourseCardList(
          tagIds: [1],
        )
      ],
    );
  }
}
