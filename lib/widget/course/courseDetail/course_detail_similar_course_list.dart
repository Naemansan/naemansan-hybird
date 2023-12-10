import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:naemansan/models/course/course_overview_model.dart';
import 'package:naemansan/models/near_course_model.dart';

import 'package:naemansan/models/tag_model.dart';

import 'package:naemansan/utilities/style/color_styles.dart';
import 'package:naemansan/utilities/style/font_styles.dart';
import 'package:naemansan/widget/course/courseBtn/course_btn_widget.dart';

class CourseDetailSimilarCourseList extends StatelessWidget {
  final List<CourseOverviewModel> similarCourseList;
  const CourseDetailSimilarCourseList(
      {super.key, required this.similarCourseList});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 40),
        width: double.infinity,
        child: Column(
          children: [
            // 타이틀
            Container(
              padding: const EdgeInsets.fromLTRB(4, 4, 4, 16),
              child: Row(
                children: [
                  Text(
                    "유사한 산책로",
                    style: FontStyles.semiBold20
                        .copyWith(color: ColorStyles.black),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    similarCourseList.length.toString(),
                    style:
                        FontStyles.regular12.copyWith(color: ColorStyles.gray3),
                  ),
                ],
              ),
            ),
            // 타이틀
            SizedBox(
              width: double.infinity,
              child: SingleChildScrollView(
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                child: Wrap(
                    spacing: 12,
                    children: similarCourseList.map((element) {
                      return SizedBox(
                        width: 320,

                        //수정필요
                        child: CourseBtnWidget(
                            course: Course(
                                id: element.id,
                                title: element.title,
                                siGuDong: element.siGuDong,
                                distance: element.distance.toString(),
                                tags: [
                                  Tag(id: 1, tag: "2")
                                ],
                                locations: [
                                  Location(latitude: 1, longitude: 2)
                                ]),
                            onCourseTap: (courseIndex) {
                              // 코스 카드 선택 시 해당 코스 화면으로 이동한다.
                              Get.toNamed("/courseDetail/$courseIndex");
                            }),
                        //수정필요
                      );
                    }).toList()),
              ),
            )
          ],
        ));
  }
}
