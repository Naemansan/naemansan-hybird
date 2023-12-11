import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:naemansan/utilities/tag_list.dart';

import 'package:naemansan/utilities/style/color_styles.dart';
import 'package:naemansan/utilities/style/font_styles.dart';
import 'package:naemansan/viewModel/home_view_model.dart';

import 'package:naemansan/widget/common/button/tag_btn.dart';
import 'package:naemansan/widget/course/courseCard/course_card_list.dart';

class CurationNear extends StatefulWidget {
  const CurationNear({super.key});

  @override
  State<CurationNear> createState() => _CurationNearState();
}

class _CurationNearState extends State<CurationNear> {
  List<int> currentSelect = [];
  final HomeViewModel homeViewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(builder: (homeViewModel) {
      if (homeViewModel.isLoading) {
        return const Center(child: CircularProgressIndicator());
      }

      return Column(
        children: [
          //타이틀
          Container(
            padding: const EdgeInsets.fromLTRB(4, 4, 4, 16),
            child: Row(
              children: [
                Text(
                  homeViewModel.sigudongData.toString(),
                  style:
                      FontStyles.semiBold20.copyWith(color: ColorStyles.main1),
                ),
                Text(
                  "의 산책로",
                  style:
                      FontStyles.semiBold20.copyWith(color: ColorStyles.black),
                ),
              ],
            ),
          ), //타이틀

          //태그 선택
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            width: double.infinity,
            child: SingleChildScrollView(
              clipBehavior: Clip.none,
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: TagConfig.tagList
                      .asMap()
                      .entries
                      .map((element) => TagBtn(
                          isSelected: (currentSelect.contains((element.key))),
                          content: element.value,
                          onBtnTap: () {
                            //선택시 서치에 포함됨
                            setState(() {
                              if (currentSelect.contains(element.key)) {
                                setState(() {
                                  currentSelect.remove(element.key);
                                });
                              } else {
                                setState(() {
                                  currentSelect.add(element.key);
                                });
                              }
                            });
                          }))
                      .toList()),
            ),
          ), //태그 선택
          CourseCardList(
            tagIds: currentSelect,
            lati: homeViewModel.currentLocation?.latitude,
            longi: homeViewModel.currentLocation?.longitude,
          )
        ],
      );
    });
  }
}
