import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:naemansan/method/get_scale_width.dart';
import 'package:naemansan/models/course/course_overview_model.dart';

import 'package:naemansan/utilities/style/color_styles.dart';
import 'package:naemansan/utilities/style/font_styles.dart';

class CourseCard extends StatelessWidget {
  final CourseOverviewModel courseInfo;
  const CourseCard({super.key, required this.courseInfo});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed("/courseDetail/${courseInfo.id}");
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
                //썸네일
                Container(
                  width: double.infinity,
                  height: getScaleWidth(context) * 180,
                  margin: const EdgeInsets.only(right: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Image.asset(
                    'assets/images/defaultImage.png',
                    height: 32,
                  ),
                ), //썸네일

                //정보부분
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //산책로 이름
                        Text(
                          courseInfo.title,
                          style: FontStyles.semiBold20
                              .copyWith(color: ColorStyles.black),
                        ), //산책로 이름

                        //위치, 거리
                        Container(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Wrap(
                            spacing: 4.0,
                            children: [courseInfo.siGuDong, "·", "날찌:수정필요"]
                                .map((element) {
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
                                  children: courseInfo.tags.map((element) {
                                    return Text(
                                      '#${element.tag}',
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
                                            courseInfo.moment_cnt.toString(),
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
                                              height: 16,
                                              colorFilter:
                                                  const ColorFilter.mode(
                                                      ColorStyles.gray3,
                                                      BlendMode.srcATop)),
                                          const SizedBox(width: 4),
                                          Text(
                                            courseInfo.like_cnt.toString(),
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
