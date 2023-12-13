import 'package:flutter/material.dart';

import 'package:naemansan/utilities/style/color_styles.dart';

import 'package:naemansan/widget/common/button/bottom_button.dart';
import 'package:naemansan/widget/common/button/solid_button.dart';
import 'package:naemansan/widget/edit/custom_textfield.dart';
import 'package:naemansan/widget/edit/tag_selector.dart';

class MyProfileEdit extends StatefulWidget {
  const MyProfileEdit({super.key});

  @override
  State<MyProfileEdit> createState() => _MyProfileEditState();
}

class _MyProfileEditState extends State<MyProfileEdit> {
  bool isFormValid = false;
  List<int> currentTagSelect = [];

  final TextEditingController nicknameController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    void checkFormValid() {
      final isNicknameFiled = nicknameController.text.trim().isNotEmpty;
      final isBioFiled = bioController.text.trim().isNotEmpty;
      final isTag = currentTagSelect.length < 4 && currentTagSelect.isNotEmpty;

      setState(() {
        isFormValid = isNicknameFiled && isBioFiled && isTag;
      });

      return;
    }

    nicknameController.addListener(checkFormValid);
    bioController.addListener(checkFormValid);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: ColorStyles.white,
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 40),
                child: Stack(
                  children: [
                    ClipOval(
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          "assets/images/defaultProfile.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Opacity(
                      opacity: 0.7,
                      child: Container(
                        decoration: const BoxDecoration(
                            color: ColorStyles.gray3,
                            borderRadius:
                                BorderRadius.all(Radius.circular(40))),
                        width: 80,
                        height: 80,
                        child: IconButton(
                          icon: const Icon(Icons.add_a_photo,
                              color: ColorStyles.white),
                          onPressed: () => print("이미지 추가하기"),
                        ),
                      ),
                    ),
                  ],
                ),
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

              TagSelector(
                label: "관심 키워드",
                placeholder: "최대 3개의 관심 태그를 지정할 수 있어요!",
                snackMessage: "관심 태그는 최대 3개까지 선택 가능합니다.",
                currentSelect: currentTagSelect,
                onChanged: checkFormValid,
              )
            ],
          ),
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
