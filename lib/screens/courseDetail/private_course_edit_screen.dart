import 'package:flutter/material.dart';
import 'package:naemansan/widget/base/custom_appbar.dart';

class PrivateCourseEditScreen extends StatelessWidget {
  const PrivateCourseEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        //앱바...
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(48),
            child: CustomAppbar(
              leftIcon: "left",
              rightIcon: null,
              content: '산책로 정보 수정하기',
            )),
        //앱바...
        body: Center(child: Text("미공개 산책로 에딧^^")));
  }
}
