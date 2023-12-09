import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:naemansan/utilities/style/color_styles.dart';
import 'package:naemansan/utilities/style/font_styles.dart';

class MomentDetail extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final momentInfo;
  const MomentDetail({super.key, required this.momentInfo});

  @override
  Widget build(BuildContext context) {
    Color getEmotionColor(String emotion) {
      switch (emotion) {
        case "Joy":
          return ColorStyles.emotionJoy;
        case "Com":
          return ColorStyles.emotionCom;
        case "Sur":
          return ColorStyles.emotionSur;
        case "Sad":
          return ColorStyles.emotionSad;
        case "Boolan":
          return ColorStyles.emotionBoolan;
        case "Hurt":
          return ColorStyles.emotionHurt;

        default:
          return ColorStyles.black;
      }
    }

    return InkWell(
      onTap: () => {Get.toNamed("/courseDetail/${momentInfo.courseId}")},
      child: Column(
        children: [
          //모먼트 상단 정보
          Container(
            decoration: BoxDecoration(
              color: getEmotionColor(momentInfo.emotion),
              borderRadius: BorderRadius.circular(4.0),
            ),
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.only(bottom: 4),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        momentInfo.date,
                        style: FontStyles.semiBold16
                            .copyWith(color: ColorStyles.white),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        momentInfo.courseTitle,
                        style: FontStyles.semiBold16
                            .copyWith(color: ColorStyles.white),
                      ),
                    ],
                  ),
                  SvgPicture.asset(
                    'assets/icons/weather${momentInfo.weather}.svg',
                    height: 24,
                    colorFilter: const ColorFilter.mode(
                        ColorStyles.white, BlendMode.srcATop),
                  ),
                ]),
          ), //모먼트 상단 정보

          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 20),
            decoration: BoxDecoration(
              color: ColorStyles.gray0,
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Text(momentInfo.content,
                style: FontStyles.regular16.copyWith(color: ColorStyles.black)),
          )
        ],
      ),
    );
  }
}
