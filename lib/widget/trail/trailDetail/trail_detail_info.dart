import 'package:flutter/material.dart';
import 'package:naemansan/utilities/style/color_styles.dart';
import 'package:naemansan/utilities/style/font_styles.dart';

class TrailDetailInfo extends StatelessWidget {
  const TrailDetailInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 16),
      width: double.infinity,
      child:
          //산책로 정보
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        //산책로이름
        Text("산책로 이름",
            style: FontStyles.semiBold24
                .copyWith(color: ColorStyles.black)), //산책로이름

        //위치, 거리
        Container(
          padding: const EdgeInsets.only(bottom: 12),
          child: Wrap(
            spacing: 4.0,
            children: ["위치", "·", "거리"].map((element) {
              return Text(element,
                  style: FontStyles.regular16.copyWith(
                    color: ColorStyles.black,
                  ));
            }).toList(),
          ),
        ), //위치, 거리

        //태그
        Wrap(
          spacing: 4.0,
          children: ["#1", "#2"].map((element) {
            return Text(
              element,
              style: FontStyles.regular12.copyWith(color: ColorStyles.gray3),
            );
          }).toList(),
        ), //태그
      ]), //산책로 정보
    );
  }
}
