import 'package:flutter/material.dart';
import 'package:naemansan/utilities/style/color_styles.dart';
import 'package:naemansan/utilities/style/font_styles.dart';

class TrailDetailInfo extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final String name;
  final String location;
  final String distance;
  final List<String> tags;

  const TrailDetailInfo(
      {super.key,
      required this.name,
      required this.location,
      required this.distance,
      required this.tags});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 16),
      width: double.infinity,
      child:
          //산책로 정보
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        //산책로이름
        Text(name,
            style: FontStyles.semiBold24
                .copyWith(color: ColorStyles.black)), //산책로이름

        //위치, 거리
        Container(
          padding: const EdgeInsets.only(bottom: 12),
          child: Wrap(
            spacing: 4.0,
            children: [location, "·", distance].map((element) {
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
          children: tags.map((element) {
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
