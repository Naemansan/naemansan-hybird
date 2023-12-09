import 'package:flutter/material.dart';

import 'package:naemansan/method/get_scale_width.dart';
import 'package:naemansan/utilities/style/color_styles.dart';

import 'package:naemansan/widget/base/custom_appbar.dart';

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

      body:
          //산책로 정보
          PrivateCourseEditInfo(),
    );
  }
}
