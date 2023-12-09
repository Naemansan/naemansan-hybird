import 'package:flutter/material.dart';
import 'package:naemansan/utilities/style/color_styles.dart';
import 'package:naemansan/utilities/style/font_styles.dart';

class StorkeButton extends StatelessWidget {
  final String content;

  final VoidCallback onTab;
  const StorkeButton({super.key, required this.content, required this.onTab});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTab,
      child: Container(
        width: 120,
        decoration: BoxDecoration(
            color: ColorStyles.white,
            border: Border.all(width: 2, color: ColorStyles.gray1),
            borderRadius: const BorderRadius.all(Radius.circular(4))),
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Center(
            child: Text(
          content,
          style: FontStyles.semiBold20.copyWith(
            color: ColorStyles.gray1,
          ),
        )),
      ),
    );
  }
}
