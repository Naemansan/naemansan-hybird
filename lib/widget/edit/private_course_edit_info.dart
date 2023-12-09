import 'package:flutter/material.dart';
import 'package:naemansan/method/get_scale_width.dart';

import 'package:naemansan/utilities/style/color_styles.dart';
import 'package:naemansan/utilities/style/font_styles.dart';
import 'package:naemansan/widget/common/button/bottom_button.dart';
import 'package:naemansan/widget/common/button/solid_button.dart';

import 'package:naemansan/widget/edit/custom_textfield.dart';
import 'package:naemansan/widget/edit/keyword_selector.dart';
import 'package:naemansan/widget/edit/private_course_edit_spot.dart';

class PrivateCourseEditInfo extends StatefulWidget {
  final String type;

  const PrivateCourseEditInfo({
    super.key,
    required this.type,
  });

  @override
  State<PrivateCourseEditInfo> createState() => _PrivateCourseEditInfoState();
}

class _PrivateCourseEditInfoState extends State<PrivateCourseEditInfo> {
  bool isFormValid = false;
  List<int> currentKeywordSelect = [];
  List<int> currentSpotSelect = [];
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void checkFormValid() {
      final isTitleFiled = titleController.text.trim().isNotEmpty;
      final isDescriptionFilled = descriptionController.text.trim().isNotEmpty;
      final isKeyword =
          currentKeywordSelect.length < 4 && currentKeywordSelect.isNotEmpty;
      final isSpot = currentSpotSelect.length < 6;
      print(isFormValid);
      setState(() {
        isFormValid =
            isTitleFiled && isDescriptionFilled && isKeyword && isSpot;
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
                  height: getScaleWidth(context) * 180,
                  child: Image.asset(
                    fit: BoxFit.cover,
                    'assets/images/defaultImage.png',
                  ),
                ), //썸네일
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

                          KeywordSelector(
                            label: "태그",
                            placeholder: "최대 3개의 태그를 지정할 수 있어요!",
                            snackMessage: "태그는 최대 3개까지 선택 가능합니다.",
                            currentSelect: currentKeywordSelect,
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
                      currentSelect: currentSpotSelect,
                      onChanged: checkFormValid,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomButton(
          buttonList: [
            widget.type == "publish"
                ? SolidButton(
                    content: "산책로 공개하기",
                    isActive: isFormValid,
                    onTap: () => print("^:산책로 공개"))
                : SolidButton(
                    content: "정보 저장하기",
                    isActive: isFormValid,
                    onTap: () => print("^:산책로 저장"))
          ],
        ));
  }
}
