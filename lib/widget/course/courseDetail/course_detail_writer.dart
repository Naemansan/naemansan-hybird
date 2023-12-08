import 'package:flutter/material.dart';
import 'package:naemansan/utilities/style/color_styles.dart';
import 'package:naemansan/utilities/style/font_styles.dart';
import 'package:naemansan/widget/profile/follow_btn.dart';

class CourseDetailWriter extends StatefulWidget {
  final String writer;
  final String date;
  const CourseDetailWriter(
      {super.key, required this.writer, required this.date});

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
            Text(widget.writer,
                style: FontStyles.regular12.copyWith(color: ColorStyles.black)),
            Text(widget.date,
                style: FontStyles.regular12.copyWith(color: ColorStyles.gray3)),
          ],
        )),
        FollowBtn(
            currentState: currentState, onStateChanged: onFollowBtnStateChanged)
      ]),
    ); //제작자 정보
  }
}