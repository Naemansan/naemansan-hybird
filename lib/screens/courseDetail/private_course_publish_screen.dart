import 'package:flutter/material.dart';

import 'package:naemansan/widget/base/custom_appbar.dart';
import 'package:naemansan/widget/edit/private_course_edit_info.dart';

class PrivateCoursePublishScreen extends StatelessWidget {
  const PrivateCoursePublishScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      //앱바...
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(48),
          child: CustomAppbar(
            leftIcon: "left",
            rightIcon: null,
            content: '산책로 공개하기',
          )),
      //앱바...
      body: PrivateCourseEditInfo(type: "publish"),
    );
  }
}
