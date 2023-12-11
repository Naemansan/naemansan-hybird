import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naemansan/viewModel/private_course_edit_view_model.dart';

import 'package:naemansan/widget/base/custom_appbar.dart';

import 'package:naemansan/widget/edit/private_course_edit_info.dart';

class PrivateCourseEditScreen extends StatelessWidget {
  const PrivateCourseEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String courseId = Get.parameters['courseId'] ?? '';
    final PrivateCourseEditViewModel privateCourseEditViewModel = Get.put(
        PrivateCourseEditViewModel(
            courseId: int.parse(courseId), isNewSpot: true));

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

      body:
          //산책로 정보
          GetBuilder<PrivateCourseEditViewModel>(
              init: privateCourseEditViewModel,
              builder: (privateCourseEditViewModel) {
                return PrivateCourseEditInfo(
                  privateCourseEditViewModel: privateCourseEditViewModel,
                  type: "edit",
                );
              }),
    );
  }
}
