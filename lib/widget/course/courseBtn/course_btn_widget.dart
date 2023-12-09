import 'package:flutter/material.dart';
import 'package:naemansan/models/near_course_model.dart';
import 'package:naemansan/utilities/style/color_styles.dart';
import 'package:naemansan/utilities/style/font_styles.dart';

class CourseBtnWidget extends StatelessWidget {
  final Course course;
  final Function(int) onCourseTap;

  const CourseBtnWidget(
      {super.key, required this.course, required this.onCourseTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onCourseTap(course.id),
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          color: ColorStyles.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(4),
            // 테두리 green
          ),
          border: Border.all(
            color: ColorStyles.main1,
            width: 2,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            24,
            20,
            24,
            20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                course.title,
                style: FontStyles.semiBold20.copyWith(
                  color: ColorStyles.black,
                ),
              ),
              Row(
                children: [
                  Text(
                    course.siGuDong,
                    style: FontStyles.regular16.copyWith(
                      color: ColorStyles.black,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    "·",
                    style: FontStyles.regular16.copyWith(
                      color: ColorStyles.black,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    course.distance,
                    style: FontStyles.regular16.copyWith(
                      color: ColorStyles.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Wrap(
                    spacing: 4.0,
                    children: course.tags.map((element) {
                      return Text(
                        "#${element.tag}",
                        style: FontStyles.regular12.copyWith(
                          color: ColorStyles.gray3,
                        ),
                      );
                    }).toList(),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
