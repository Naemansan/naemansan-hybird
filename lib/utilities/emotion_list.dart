import 'package:flutter/material.dart';
import 'package:naemansan/utilities/style/color_styles.dart';
import 'package:naemansan/utilities/style/font_styles.dart';

class EmotionConfig {
  static const emtionLength = 6;
  static List<Emotion> emotionList = [
    Emotion(eng: "FLUTTER", kor: "설렘", color: ColorStyles.emotionFlutter),
    Emotion(eng: "JOY", kor: "기쁨", color: ColorStyles.emotionJoy),
    Emotion(eng: "COMFORT", kor: "편안", color: ColorStyles.emotionCom),
    Emotion(eng: "THANKS", kor: "감사", color: ColorStyles.emotionSur),
    Emotion(eng: "SADNESS", kor: "슬픔", color: ColorStyles.emotionSad),
    Emotion(eng: "ANXIETY", kor: "불안", color: ColorStyles.emotionBoolan),
  ];

  static Color getEmotionColor(String emotion) {
    switch (emotion) {
      case "FLUTTER":
        return ColorStyles.emotionFlutter;
      case "JOY":
        return ColorStyles.emotionJoy;
      case "COMFORT":
        return ColorStyles.emotionCom;
      case "THANKS":
        return ColorStyles.emotionSur;
      case "SADNESS":
        return ColorStyles.emotionSad;
      case "ANXIETY":
        return ColorStyles.emotionBoolan;

      default:
        return ColorStyles.black;
    }
  }

  static Widget emotionInfo = Row(children: [
    Wrap(
      direction: Axis.horizontal,
      spacing: 8.0, // 가로 간격 조절
      children: EmotionConfig.emotionList
          .map((element) => Row(
                children: [
                  Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                        color: element.color,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12))),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    element.kor,
                    style:
                        FontStyles.regular10.copyWith(color: ColorStyles.gray3),
                  )
                ],
              ))
          .toList(),
    ),
  ]);
}

class Emotion {
  final String eng;
  final String kor;
  final Color color;

  Emotion({required this.eng, required this.kor, required this.color});
}
