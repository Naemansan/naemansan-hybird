import 'package:flutter/material.dart';

import 'package:naemansan/widget/common/button/tag_btn.dart';
import 'package:naemansan/widget/course/courseCard/course_card_list.dart';

class WalkingLogCourse extends StatefulWidget {
  const WalkingLogCourse({super.key});

  @override
  State<WalkingLogCourse> createState() => _WalkingLogCourseState();
}

class _WalkingLogCourseState extends State<WalkingLogCourse> {
  var currentSelect = 0;

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
                    .map((element) => TagBtn(
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

        CourseCardList()
      ],
    );
  }
}
