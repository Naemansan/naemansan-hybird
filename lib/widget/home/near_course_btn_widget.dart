import 'package:flutter/material.dart';
import 'package:naemansan/models/near_course_model.dart';
import 'package:naemansan/utilities/style/color_styles.dart';
import 'package:naemansan/utilities/style/font_styles.dart';

class CourseCardWidget extends StatelessWidget {
  final Course course;

  const CourseCardWidget({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
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
                  Text(
                    "#${course.keywords[0].keyword}",
                    style: FontStyles.regular12.copyWith(
                      color: ColorStyles.gray3,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    "#${course.keywords[1].keyword}",
                    style: FontStyles.regular12.copyWith(
                      color: ColorStyles.gray3,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    "#${course.keywords[2].keyword}",
                    style: FontStyles.regular12.copyWith(
                      color: ColorStyles.gray3,
                    ),
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
