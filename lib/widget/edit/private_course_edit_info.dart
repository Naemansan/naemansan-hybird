import 'package:flutter/material.dart';
import 'package:naemansan/utilities/style/color_styles.dart';
import 'package:naemansan/utilities/style/font_styles.dart';
import 'package:naemansan/widget/edit/custom_textfield.dart';
import 'package:naemansan/widget/edit/keyword_selector.dart';

class PrivateCourseEditInfo extends StatefulWidget {
  const PrivateCourseEditInfo({super.key});

  @override
  State<PrivateCourseEditInfo> createState() => _PrivateCourseEditInfoState();
}

class _PrivateCourseEditInfoState extends State<PrivateCourseEditInfo> {
  @override
  Widget build(BuildContext context) {
    List<int> currentSelect = [];

    final TextEditingController tilteController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(4, 4, 4, 16),
            child: Text("정보",
                style:
                    FontStyles.semiBold20.copyWith(color: ColorStyles.black)),
          ),

          //산책로 이름
          CustomTextfield(
              label: "산책로 이름",
              placeholder: "산책로의 이름을 작성해주세요.",
              height: 48,
              maxLine: 1,
              maxLength: 12,
              controller: tilteController),

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
            currentSelect: currentSelect,
          )
        ],
      ),
    );
  }
}
