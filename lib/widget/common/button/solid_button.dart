import 'package:flutter/material.dart';
import 'package:naemansan/utilities/style/color_styles.dart';
import 'package:naemansan/utilities/style/font_styles.dart';

class SolidButton extends StatelessWidget {
  final String content;
  final bool isActive;
  final VoidCallback onTap;

  const SolidButton(
      {super.key,
      required this.content,
      required this.isActive,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              color: isActive ? ColorStyles.main1 : ColorStyles.gray0,
              borderRadius: const BorderRadius.all(Radius.circular(4))),
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Center(
              child: Text(
            content,
            style: FontStyles.semiBold20.copyWith(
              color: isActive ? ColorStyles.white : ColorStyles.gray3,
            ),
          )),
        ),
      ),
    );
  }
}
