import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naemansan/models/moment_model.dart';

import 'package:naemansan/utilities/style/color_styles.dart';
import 'package:naemansan/utilities/style/font_styles.dart';
import 'package:naemansan/widget/moment/momentCard/moment_card.dart';

class CurationPopularMoment extends StatelessWidget {
  const CurationPopularMoment({super.key});

  @override
  Widget build(BuildContext context) {
    var momentList = [
      MomentModel(
          id: 1,
          date: "11/2",
          year: "2023",
          weather: "Cloud",
          emotion: "Sad",
          courseId: 2,
          courseTitle: "산책로2",
          userId: 1,
          userName: "서현  ",
          content: "내용"),
      MomentModel(
          id: 2,
          date: "11/3",
          year: "2023",
          weather: "FewCloudDay",
          emotion: "Joy",
          courseId: 2,
          courseTitle: "산책로2",
          userId: 1,
          userName: "서현  ",
          content: "내용"),
    ];

    return Column(
      children: [
        //타이틀
        Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(4, 4, 4, 16),
          child: Text(
            "사람들은 이런 길을 걸었어요!",
            style: FontStyles.semiBold20.copyWith(color: ColorStyles.black),
          ),
        ), //타이틀

        //모먼트 리스트
        Container(
          margin: const EdgeInsets.only(bottom: 32),
          width: double.infinity,
          child: SingleChildScrollView(
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            child: Column(
              children: [
                Wrap(
                  spacing: 12,
                  children: momentList.asMap().entries.map((element) {
                    return InkWell(
                      onTap: () {
                        // 모먼트 카드 선택 시 해당 코스 화면으로 이동한다.
                        Get.toNamed("/courseDetail/${element.value.courseId}");
                      },
                      child: MomentCard(
                        momentInfo: element.value,
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
        //모먼트 리스트
      ],
    );
  }
}
