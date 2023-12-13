import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:naemansan/models/course_walking_single_spot_model.dart';
import 'package:naemansan/screens/courseDetail/private_course_edit_screen.dart';
import 'package:naemansan/utilities/style/color_styles.dart';
import 'package:naemansan/utilities/style/font_styles.dart';
import 'package:naemansan/viewModel/course_create_view_model.dart';
import 'package:naemansan/viewModel/private_course_edit_view_model.dart';

import 'package:naemansan/widget/base/custom_appbar.dart';
import 'package:naemansan/widget/edit/private_course_edit_info.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';

class CourseCreateScreen extends StatelessWidget {
  const CourseCreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ViewModel을 찾거나 새로 생성하기
    final CourseCreateViewModel courseCreateViewModel =
        Get.put<CourseCreateViewModel>(CourseCreateViewModel());

    // 첫 로드 시 arguments로부터 데이터를 가져오기
    if (!courseCreateViewModel.isDataLoaded) {
      final arguments = Get.arguments as List<dynamic>?;
      final List<WalkingSingleSpotModel>? spotList =
          arguments?.elementAt(0) as List<WalkingSingleSpotModel>?;
      final List<LatLng>? latLngList = arguments?.elementAt(1) as List<LatLng>?;

      courseCreateViewModel.loadData(latLngList ?? [], spotList ?? []);
      courseCreateViewModel.checkSimilarity();
    }

    final PrivateCourseEditViewModel privateCourseEditViewModel = Get.put(
        PrivateCourseEditViewModel(
            isNewSpot: courseCreateViewModel.spotList.isEmpty));
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(48),
          child: CustomAppbar(
            leftIcon: null,
            rightIcon: null,
            content: '산책로 만들기',
          )),
      body: Container(
        color: Colors.white,
        child: GetBuilder<CourseCreateViewModel>(
            init: courseCreateViewModel,
            builder: (viewModel) {
              if (viewModel.isCheckingSimilarity.value) {
                return const LoadingDramouseWidget();
              }

              // Check if the data list is empty or not
              bool hasSimilarWalks =
                  (viewModel.similarityResult.value?.data.length ?? 0) > 0;
              if (hasSimilarWalks) {
                // 유사 산책로 존재할때
                return Center(
                  child: Column(
                    children: [
                      Text(
                        "유사한 산책로가 존재해요!\n정보를 추가해볼까요?",
                        style: FontStyles.medium20.copyWith(
                          color: ColorStyles.black,
                        ),
                      ),
                      ListView.builder(
                        itemCount:
                            viewModel.similarityResult.value?.data.length ?? 0,
                        itemBuilder: (context, index) {
                          var walk =
                              viewModel.similarityResult.value!.data[index];
                          return ListTile(
                            minVerticalPadding: 20,
                            title: Text(walk.title),
                            subtitle: Text(walk.startLocationName),
                            // ... other UI elements
                          );
                        },
                      ),
                    ],
                  ),
                );
              } else {
                // 산책로 만들기 페이지
                return GetBuilder<PrivateCourseEditViewModel>(
                    init: privateCourseEditViewModel,
                    builder: (privateCourseEditViewModel) {
                      return PrivateCourseEditInfo(
                        privateCourseEditViewModel: privateCourseEditViewModel,
                        type: "create",
                        latLngList: courseCreateViewModel.latLngList,
                        spotList: courseCreateViewModel.spotList,
                      );
                    });
              }
            }),
      ),
    );
  }
}

// 로딩 다람쥐 위젯
class LoadingDramouseWidget extends StatelessWidget {
  const LoadingDramouseWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        const SizedBox(height: 200),
        Image.asset(
          'assets/icons/daramouse.png',
          width: 160,
          height: 160,
        ),
        const SizedBox(height: 40),
        Text(
          "나의 미공개 산책로들과",
          style: FontStyles.semiBold20.copyWith(color: ColorStyles.black),
        ),
        Text(
          "유사도 검사를 진행중이에요!",
          style: FontStyles.semiBold20.copyWith(color: ColorStyles.black),
        )
      ]),
    );
  }
}
