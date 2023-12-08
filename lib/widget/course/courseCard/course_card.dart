import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:naemansan/models/course_overview_model.dart';

import 'package:naemansan/utilities/style/color_styles.dart';
import 'package:naemansan/utilities/style/font_styles.dart';

class CourseOverview extends StatefulWidget {
  final CourseOverviewModel courseInfo;
  const CourseOverview({super.key, required this.courseInfo});

  @override
  State<CourseOverview> createState() => _CourseOverviewState();
}

class _CourseOverviewState extends State<CourseOverview> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed("/courseDetail/1");
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
                          widget.courseInfo.title,
                          style: FontStyles.semiBold20
                              .copyWith(color: ColorStyles.black),
                        ), //산책로 이름

                        //위치, 거리
                        Container(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Wrap(
                            spacing: 4.0,
                            children: [
                              widget.courseInfo.siGuDong,
                              "·",
                              widget.courseInfo.distance
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
                                      widget.courseInfo.keywords.map((element) {
                                    return Text(
                                      '#${element.keyword}',
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
                                            widget.courseInfo.momentCount
                                                .toString(),
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
                                            widget.courseInfo.likeCount
                                                .toString(),
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
