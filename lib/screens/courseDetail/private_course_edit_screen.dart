import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naemansan/method/get_scale_width.dart';
import 'package:naemansan/utilities/style/color_styles.dart';

import 'package:naemansan/viewModel/home_view_model.dart';
import 'package:naemansan/widget/base/custom_appbar.dart';
import 'package:naemansan/widget/common/button/bottom_button.dart';
import 'package:naemansan/widget/common/button/solid_button.dart';

import 'package:naemansan/widget/edit/private_course_edit_info.dart';

class PrivateCourseEditScreen extends StatelessWidget {
  const PrivateCourseEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //앱바...
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(48),
            child: CustomAppbar(
              leftIcon: "left",
              rightIcon: null,
              content: '산책로 정보 수정하기',
            )),
        //앱바...

        body: GetBuilder<HomeViewModel>(builder: (viewModel) {
          return SingleChildScrollView(
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

                    //산책로 정보
                    PrivateCourseEditInfo(),
                  ],
                )),
          );
        }),
        bottomNavigationBar: BottomButton(
          buttonList: [
            SolidButton(
                content: "정보 저장하기",
                isActive: true,
                onTab: () => print("^:산책로 수정완료"))
          ],
        ));
  }
}
