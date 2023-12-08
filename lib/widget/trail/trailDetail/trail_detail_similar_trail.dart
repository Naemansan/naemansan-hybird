import 'package:flutter/material.dart';
import 'package:naemansan/utilities/style/color_styles.dart';

class TrailDetailSimilarTrail extends StatelessWidget {
  const TrailDetailSimilarTrail({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 40),
        width: double.infinity,
        color: ColorStyles.emotionSad,
        child: Text("유사한 산책로"));
  }
}
