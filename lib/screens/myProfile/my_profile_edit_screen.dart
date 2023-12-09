import 'package:flutter/material.dart';
import 'package:naemansan/widget/base/custom_appbar.dart';

class MyProfileEditScreen extends StatelessWidget {
  const MyProfileEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        //앱바...
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(48),
            child: CustomAppbar(
              leftIcon: "left",
              rightIcon: null,
              content: '나의 정보 수정하기',
            )),
        //앱바...
        body: Center(child: Text("마이페이지 에딧^^")));
  }
}
