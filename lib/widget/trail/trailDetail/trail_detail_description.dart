import 'package:flutter/material.dart';
import 'package:naemansan/utilities/style/color_styles.dart';
import 'package:naemansan/utilities/style/font_styles.dart';

class TrailDetailDescription extends StatelessWidget {
  final String description;
  const TrailDetailDescription({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        description,
        style: FontStyles.regular16.copyWith(color: ColorStyles.black),
      ),
    );
  }
}
