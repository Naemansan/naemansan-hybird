import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:naemansan/models/trail_card_model.dart';
import 'package:naemansan/screens/trailDetail/trail_detail_screen.dart';
import 'package:naemansan/utilities/style/color_styles.dart';
import 'package:naemansan/utilities/style/font_styles.dart';

class TrailCard extends StatefulWidget {
  final TrailCardModel trailInfo;
  const TrailCard({super.key, required this.trailInfo});

  @override
  State<TrailCard> createState() => _TrailCardState();
}

class _TrailCardState extends State<TrailCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const TrailDetailScreen()));
      },
      child: SizedBox(
          width: double.infinity,
          child: Container(
            margin: const EdgeInsets.only(bottom: 32),
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: ColorStyles.gray1, width: 1))),
            child: Column(
              children: [
                //썸네일 부분
                Container(
                  height: 180,
                  color: ColorStyles.emotionJoy,
                ),

                //정보부분
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //산책로 이름
                        Text(
                          widget.trailInfo.name,
                          style: FontStyles.semiBold20
                              .copyWith(color: ColorStyles.black),
                        ), //산책로 이름

                        //위치, 거리
                        Container(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Wrap(
                            spacing: 4.0,
                            children: [
                              widget.trailInfo.location,
                              "·",
                              widget.trailInfo.distance
                            ].map((element) {
                              return Text(element,
                                  style: FontStyles.regular16.copyWith(
                                    color: ColorStyles.black,
                                  ));
                            }).toList(),
                          ),
                        ), //위치, 거리

                        //태그, 좋아요, 모먼트 개수
                        SizedBox(
                          width: double.infinity,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //태그들...
                                Wrap(
                                  spacing: 4.0,
                                  children:
                                      widget.trailInfo.tags.map((element) {
                                    return Text(
                                      element,
                                      style: FontStyles.regular12
                                          .copyWith(color: ColorStyles.gray3),
                                    );
                                  }).toList(),
                                ),
                                //태그들...

                                //모먼트
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                              'assets/icons/moment.svg',
                                              height: 16),
                                          const SizedBox(width: 4),
                                          Text(
                                            widget.trailInfo.momentCount,
                                            style: FontStyles.regular12
                                                .copyWith(
                                                    color: ColorStyles.gray3),
                                          )
                                        ],
                                      ),
                                    ), //모먼트

                                    //하트
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                              'assets/icons/heartStroke.svg',
                                              height: 16),
                                          const SizedBox(width: 4),
                                          Text(
                                            widget.trailInfo.likeCount,
                                            style: FontStyles.regular12
                                                .copyWith(
                                                    color: ColorStyles.gray3),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ) //하트
                              ]),
                        ),
                      ]),
                ), //정보부분
              ],
            ),
          )),
    );
  }
}
