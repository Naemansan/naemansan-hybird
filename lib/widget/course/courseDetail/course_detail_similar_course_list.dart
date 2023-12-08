import 'package:flutter/widgets.dart';
import 'package:naemansan/utilities/style/color_styles.dart';
import 'package:naemansan/utilities/style/font_styles.dart';

class CourseDetailSimilarCourseList extends StatelessWidget {
  const CourseDetailSimilarCourseList({super.key});

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
                    [1, 2, 3].length.toString(),
                    style:
                        FontStyles.regular12.copyWith(color: ColorStyles.gray3),
                  ),
                ],
              ),
            ),
            // 타이틀
          ],
        ));
  }
}
