// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:naemansan/utilities/style/color_styles.dart';
import 'package:naemansan/utilities/style/font_styles.dart';
import 'package:naemansan/widget/myProfile/follow_btn.dart';

class CourseDetailWriter extends StatefulWidget {
  final String userId;
  final String userNickName;
  final String createdAt;
  const CourseDetailWriter(
      {super.key,
      required this.userId,
      required this.createdAt,
      required this.userNickName});

  @override
  State<CourseDetailWriter> createState() => _CourseDetailWriterState();
}

class _CourseDetailWriterState extends State<CourseDetailWriter> {
  String currentState = 'follow';

  void onFollowBtnStateChanged(String newState) {
    setState(() {
      currentState = newState;
    });
  }

  @override
  Widget build(BuildContext context) {
    return //제작자 정보
        Container(
      width: double.infinity,
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(children: [
        Container(
          margin: const EdgeInsets.only(right: 4),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: ClipOval(
            child: Image.asset(
              'assets/images/defaultProfile.png',
              height: 32,
            ),
          ),
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.userNickName,
                style: FontStyles.regular12.copyWith(color: ColorStyles.black)),
            Text(
                DateFormat('yyyy년 MM월 dd일 공개')
                    .format(DateTime.parse(widget.createdAt)),
                style: FontStyles.regular12.copyWith(color: ColorStyles.gray3)),
          ],
        )),
        FollowBtn(
            uuid: "uuid",
            currentState: currentState,
            onStateChanged: onFollowBtnStateChanged)
      ]),
    ); //제작자 정보
  }
}
