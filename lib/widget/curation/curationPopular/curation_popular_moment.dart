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
    List<Moment> momentList = [
      Moment(
          id: 1,
          courseId: 1,
          courseTitle: "동국대학교 산책로",
          nickname: "희찬",
          content: "1",
          createdAt: "2023-11-13",
          emotion: "COMFORT",
          weather: "CLOUDY_NIGHT"),
      Moment(
          id: 1,
          courseId: 1,
          courseTitle: "혜화 가는길",
          nickname: "서현",
          content: "1",
          createdAt: "2023-11-13",
          emotion: "THANKS",
          weather: "SUNNY_NIGHT"),
      Moment(
          id: 1,
          courseId: 1,
          courseTitle: "충무로에서 동대 입구",
          nickname: "산책러",
          content: "1",
          createdAt: "2023-11-13",
          emotion: "JOY",
          weather: "CLOUDY_DAY"),
      Moment(
          id: 1,
          courseId: 1,
          courseTitle: "산책로1",
          nickname: "희찬",
          content: "1",
          createdAt: "2023-11-13",
          emotion: "JOY",
          weather: "CLOUDY_DAY"),
      Moment(
          id: 1,
          courseId: 1,
          courseTitle: "자취방 가는 길",
          nickname: "1",
          content: "1",
          createdAt: "2023-11-12",
          emotion: "FLUTTER",
          weather: "CLOUDY_DAY")
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
