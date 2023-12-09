import 'package:flutter/material.dart';
import 'package:naemansan/models/moment_model.dart';
import 'package:naemansan/utilities/emotion_list.dart';

import 'package:naemansan/widget/walkingLog/walkinglog_moment_month.dart';

class WalkingLogMoment extends StatelessWidget {
  const WalkingLogMoment({super.key});

  @override
  Widget build(BuildContext context) {
    final datesList = ["2023년 11월", "2023년 10월"];
    final momentsList = [
      [
        MomentModel(
            id: 1,
            date: "11/2",
            year: "2023",
            weather: "Cloud",
            emotion: "Sad",
            courseId: 2,
            courseTitle: "산책로2",
            userId: 1,
            userName: "서현  ",
            content: "내용"),
        MomentModel(
            id: 1,
            date: "11/2",
            year: "2023",
            weather: "Cloud",
            emotion: "Sad",
            courseId: 2,
            courseTitle: "산책로2",
            userId: 1,
            userName: "서현  ",
            content: "내용"),
        MomentModel(
            id: 1,
            date: "11/2",
            year: "2023",
            weather: "Cloud",
            emotion: "Sad",
            courseId: 2,
            courseTitle: "산책로2",
            userId: 1,
            userName: "서현  ",
            content: "내용")
      ],
      [
        MomentModel(
            id: 1,
            date: "11/2",
            year: "2023",
            weather: "Cloud",
            emotion: "Sad",
            courseId: 2,
            courseTitle: "산책로2",
            userId: 1,
            userName: "서현  ",
            content: "내용"),
        MomentModel(
            id: 1,
            date: "11/2",
            year: "2023",
            weather: "Cloud",
            emotion: "Sad",
            courseId: 2,
            courseTitle: "산책로2",
            userId: 1,
            userName: "서현  ",
            content: "내용"),
        MomentModel(
            id: 1,
            date: "11/2",
            year: "2023",
            weather: "Cloud",
            emotion: "Sad",
            courseId: 2,
            courseTitle: "산책로2",
            userId: 1,
            userName: "서현  ",
            content: "내용")
      ]
    ];
    return Column(
      children: [
        Container(
            padding: const EdgeInsets.fromLTRB(4, 0, 4, 12),
            child: EmotionConfig.emotionInfo),
        WalkingLogMomentMonth(datesList: datesList, momentsList: momentsList),
      ],
    );
  }
}
