import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:naemansan/models/moment_model.dart';
import 'package:naemansan/utilities/emotion_list.dart';

import 'package:naemansan/utilities/style/color_styles.dart';
import 'package:naemansan/utilities/style/font_styles.dart';

class MomentDetail extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final Moment momentInfo;
  const MomentDetail({super.key, required this.momentInfo});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {Get.toNamed("/courseDetail/${momentInfo.courseId}")},
      child: Column(
        children: [
          //모먼트 상단 정보
          Container(
            decoration: BoxDecoration(
              color: EmotionConfig.getEmotionColor(momentInfo.emotion),
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
                        "날찌:수정필요",
                        style: FontStyles.semiBold16
                            .copyWith(color: ColorStyles.white),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        "${momentInfo.courseId}번째 산책로",
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
