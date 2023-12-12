import 'package:flutter/material.dart';
import 'package:naemansan/utilities/style/color_styles.dart';
import 'package:naemansan/utilities/style/font_styles.dart';

class CourseDetailDescription extends StatelessWidget {
  final String content;
  const CourseDetailDescription({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        content,
        style: FontStyles.regular16.copyWith(color: ColorStyles.black),
      ),
    );
  }
}
