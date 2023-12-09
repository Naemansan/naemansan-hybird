import 'package:flutter/material.dart';

import 'package:naemansan/widget/common/button/bottom_button.dart';
import 'package:naemansan/widget/common/button/solid_button.dart';
import 'package:naemansan/widget/edit/custom_textfield.dart';
import 'package:naemansan/widget/edit/keyword_selector.dart';

class MyProfileEdit extends StatefulWidget {
  const MyProfileEdit({super.key});

  @override
  State<MyProfileEdit> createState() => _MyProfileEditState();
}

class _MyProfileEditState extends State<MyProfileEdit> {
  bool isFormValid = false;
  List<int> currentKeywordSelect = [];

  final TextEditingController nicknameController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    void checkFormValid() {
      final isNicknameFiled = nicknameController.text.trim().isNotEmpty;
      final isBioFiled = bioController.text.trim().isNotEmpty;
      final isKeyword =
          currentKeywordSelect.length < 4 && currentKeywordSelect.isNotEmpty;

      setState(() {
        isFormValid = isNicknameFiled && isBioFiled && isKeyword;
      });

      return;
    }

    nicknameController.addListener(checkFormValid);
    bioController.addListener(checkFormValid);

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 120,
              color: Colors.amber,
            ),

            //닉네임
            CustomTextfield(
                label: "닉네임",
                placeholder: "닉네임을 입력해주세요!",
                maxLine: 1,
                maxLength: 12,
                controller: nicknameController),

            //한줄소개
            CustomTextfield(
                label: "한줄소개",
                placeholder: "본인을 한줄로 소개해주세요!",
                maxLine: 3,
                maxLength: 100,
                controller: bioController),

            KeywordSelector(
              label: "관심 키워드",
              placeholder: "최대 3개의 관심 태그를 지정할 수 있어요!",
              snackMessage: "관심 태그는 최대 3개까지 선택 가능합니다.",
              currentSelect: currentKeywordSelect,
              onChanged: checkFormValid,
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomButton(buttonList: [
        SolidButton(
            content: "산책로 공개하기",
            isActive: isFormValid,
            onTap: () => print("^:유저정보 저장"))
      ]),
    );
  }
}
