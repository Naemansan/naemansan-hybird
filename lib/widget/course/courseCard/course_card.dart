import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:naemansan/method/get_scale_width.dart';
import 'package:naemansan/models/course_overview_model.dart';

import 'package:naemansan/utilities/style/color_styles.dart';
import 'package:naemansan/utilities/style/font_styles.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';

class CourseCard extends StatelessWidget {
  final CourseOverview courseInfo;
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
                //
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height *
                      0.2, // 높이를 원하는 비율로 조절
                  child: Stack(
                    children: [
                      // 썸네일 이미지
                      SizedBox(
                        width: double.infinity,
                        height: double.infinity, // Container와 동일한 크기로 설정
                        child: Image.asset(
                          'assets/images/defaultImage.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      // Naver 지도 위젯
                      Positioned.fill(
                        child: NaverMap(
                          scrollGestureEnable: false,
                          zoomGestureEnable: false,
                          mapType: MapType.Basic,
                          pathOverlays: {
                            PathOverlay(
                              PathOverlayId('path'),
                              courseInfo.locations,
                              width: 12,
                              color: ColorStyles.main2,
                              outlineColor: Colors.transparent,
                            ),
                          },
                          initialCameraPosition: CameraPosition(
                            target: courseInfo.locations.first,
                            zoom: 17,
                          ),
                          initLocationTrackingMode: LocationTrackingMode.None,
                        ),
                      ),
                    ],
                  ),
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
                          courseInfo.title,
                          style: FontStyles.semiBold20
                              .copyWith(color: ColorStyles.black),
                        ), //산책로 이름

                        //위치, 거리
                        Container(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Wrap(
                            spacing: 4.0,
                            children: [
                              courseInfo.siGuDong,
                              "·",
                              "${courseInfo.distance}m"
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
                                  children: courseInfo.tags.map((element) {
                                    return Text(
                                      '#$element',
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
                                            courseInfo.momentCount.toString(),
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
                                            courseInfo.likeCount.toString(),
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
