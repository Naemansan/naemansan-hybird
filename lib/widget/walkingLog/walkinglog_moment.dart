import 'package:flutter/material.dart';
import 'package:naemansan/models/moment_model.dart';
import 'package:naemansan/utilities/emotion_list.dart';

import 'package:naemansan/widget/walkingLog/walkinglog_moment_month.dart';

class WalkingLogMoment extends StatelessWidget {
  const WalkingLogMoment({super.key});

  @override
  Widget build(BuildContext context) {
    final datesList = ["2023년 11월", "2023년 10월"];
    final List<Moment> momentsList = [];
    return Column(
      children: [
        Container(
            padding: const EdgeInsets.fromLTRB(4, 0, 4, 12),
            child: EmotionConfig.emotionInfo),
        // WalkingLogMomentMonth(datesList: datesList, momentsList: momentsList),
      ],
    );
  }
}
