import 'package:flutter/material.dart';

import 'package:naemansan/method/get_scale_width.dart';
import 'package:naemansan/models/course_walking_single_spot_model.dart';
import 'package:naemansan/models/spot_model.dart';

import 'package:naemansan/utilities/style/color_styles.dart';
import 'package:naemansan/utilities/style/font_styles.dart';
import 'package:naemansan/viewModel/private_course_edit_view_model.dart';
import 'package:naemansan/widget/common/button/bottom_button.dart';
import 'package:naemansan/widget/common/button/solid_button.dart';

import 'package:naemansan/widget/edit/custom_textfield.dart';

import 'package:naemansan/widget/edit/tag_selector.dart';
import 'package:naemansan/widget/edit/private_course_edit_spot.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';

class PrivateCourseEditInfo extends StatefulWidget {
  final PrivateCourseEditViewModel privateCourseEditViewModel;
  final String type;
  List<LatLng>? latLngList = [];
  List<WalkingSingleSpotModel>? spotList = [];

  PrivateCourseEditInfo({
    super.key,
    required this.type,
    required this.privateCourseEditViewModel,
    // 선택적을 받기
    this.latLngList,
    this.spotList,
  });

  @override
  State<PrivateCourseEditInfo> createState() => _PrivateCourseEditInfoState();
}

class _PrivateCourseEditInfoState extends State<PrivateCourseEditInfo> {
  bool isFormValid = false;
  List<int> currentTagSelect = [];
  List<int> currentSpotSelect = [];
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  List<Spot> spotList = [];
  @override
  void initState() {
    super.initState();

    //기존 값 로드 하기
    titleController.text = widget.privateCourseEditViewModel.course.value.title;
    descriptionController.text =
        widget.privateCourseEditViewModel.course.value.content;

    currentTagSelect = [];

    //기존 리스트에 존재하는 모든 스팟을 체크 표시함
    currentSpotSelect = List.generate(
        widget.privateCourseEditViewModel.spots.length, (index) => index);

    // WalkingSingleSpotModel 목록을 Spot 목록으로 변환
    if (widget.spotList != null) {
      spotList = widget.spotList!.asMap().entries.map((entry) {
        int idx = entry.key + 1; // ID 값은 인덱스 + 1
        WalkingSingleSpotModel walkingSpot = entry.value;

        return Spot(
          id: idx,
          title: walkingSpot.title,
          content: walkingSpot.content,
          location: walkingSpot.location,
          category: walkingSpot.category,
          thumbnailurl: null, // 혹은 적절한 URL 할당
        );
      }).toList();
    }

    //새로운 스팟이 있을경우 spot 리스트를 합친다.
    if (widget.privateCourseEditViewModel.isNewSpot) {
      spotList = [
        ...widget.privateCourseEditViewModel.spots,
        ...widget.privateCourseEditViewModel.newSpots
      ];
    } else {
      spotList = widget.privateCourseEditViewModel.spots;
    }
  }

  @override
  Widget build(BuildContext context) {
    void checkFormValid() {
      final isTitleFiled = titleController.text.trim().isNotEmpty;
      final isDescriptionFilled = descriptionController.text.trim().isNotEmpty;
      final isTag = currentTagSelect.length < 4 && currentTagSelect.isNotEmpty;
      final isSpot = currentSpotSelect.length < 6;

      setState(() {
        isFormValid = isTitleFiled && isDescriptionFilled && isTag && isSpot;
      });

      return;
    }

    titleController.addListener(checkFormValid);
    descriptionController.addListener(checkFormValid);

    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            color: ColorStyles.white,
            width: double.infinity,
            child: Column(
              children: [
                //썸네일
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height *
                      0.3, // 높이를 원하는 비율로 조절
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
                          pathOverlays: widget.privateCourseEditViewModel
                              .createPathOverlays(widget.latLngList ??
                                  [
                                    const LatLng(37.3595704, 127.105399),
                                    const LatLng(37.3595704, 127.105399),
                                  ]),
                          initialCameraPosition: CameraPosition(
                            target: widget.latLngList!.isNotEmpty
                                ? widget.latLngList!.first
                                : const LatLng(37.3595704, 127.105399),
                            zoom: 17,
                          ),
                          initLocationTrackingMode: LocationTrackingMode.None,
                        ),
                      ),
                    ],
                  ),
                ),
                //썸네일

                //입력 폼
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.fromLTRB(4, 4, 4, 16),
                            child: Text("정보",
                                style: FontStyles.semiBold20
                                    .copyWith(color: ColorStyles.black)),
                          ),

                          //산책로 이름
                          CustomTextfield(
                              label: "산책로 이름",
                              placeholder: "산책로의 이름을 작성해주세요.",
                              height: 48,
                              maxLine: 1,
                              maxLength: 12,
                              controller: titleController),

                          const SizedBox(
                            height: 20,
                          ),

                          //산책로 설명
                          CustomTextfield(
                              label: "산책로 설명",
                              placeholder: "산책로의 설명을 작성해주세요.",
                              height: 48,
                              maxLine: 6,
                              maxLength: 300,
                              controller: descriptionController),

                          const SizedBox(
                            height: 20,
                          ),

                          TagSelector(
                            label: "태그",
                            placeholder: "최대 3개의 태그를 지정할 수 있어요!",
                            snackMessage: "태그는 최대 3개까지 선택 가능합니다.",
                            currentSelect: currentTagSelect,
                            onChanged: checkFormValid,
                          )
                        ],
                      ),
                    ),

                    //구분선
                    Container(
                      height: 8,
                      width: double.infinity,
                      color: ColorStyles.gray0,
                    ), //구분선

                    //스팟 정보
                    PrivateCourseEditSpot(
                      spots: spotList,
                      currentSelect: currentSpotSelect,
                      onChanged: checkFormValid,
                    ),
                  ],
                ),
                //입력 폼
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomButton(
          buttonList: [
            widget.type == "publish"
                ?
                //산책로 정보 공개하기
                SolidButton(
                    content: "산책로 공개하기",
                    isActive: isFormValid,
                    onTap: () =>
                        widget.privateCourseEditViewModel.publishCourseDetail(
                          titleController.text,
                          descriptionController.text,
                          currentTagSelect,
                          currentSpotSelect,
                        ))
                : widget.type == "create"
                    ?
                    //산책로 처음 추가하기
                    SolidButton(
                        content: "정보 저장하기",
                        isActive: isFormValid,
                        onTap: () => widget.privateCourseEditViewModel
                            .publishCourse(
                                titleController.text,
                                descriptionController.text,
                                currentTagSelect,
                                currentSpotSelect,
                                spotList,
                                widget.latLngList!))
                    :
                    //산책로 정보 저장하기
                    widget.privateCourseEditViewModel.isNewSpot
                        ?
                        //새로운 스팟이 있는 경우
                        SolidButton(
                            content: "정보 저장하기",
                            isActive: isFormValid,
                            onTap: () => widget.privateCourseEditViewModel
                                .updateCourseDetailWithNewSpot(
                                    titleController.text,
                                    descriptionController.text,
                                    currentTagSelect,
                                    currentSpotSelect,
                                    spotList))
                        :
                        //새로운 스팟이 없는 경우
                        SolidButton(
                            content: "산책로 공개하기",
                            isActive: isFormValid,
                            onTap: () => widget.privateCourseEditViewModel
                                    .updateCourseDetail(
                                  titleController.text,
                                  descriptionController.text,
                                  currentTagSelect,
                                  currentSpotSelect,
                                ))
          ],
        ));
  }
}
