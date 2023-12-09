import 'package:flutter/material.dart';
import 'package:naemansan/utilities/style/color_styles.dart';
import 'package:naemansan/utilities/style/font_styles.dart';

SnackBar customSnackbar(String content) {
  return SnackBar(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(vertical: 12),
    content: Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Opacity(
        opacity: 0.7,
        child: Container(
          decoration: const BoxDecoration(
              color: ColorStyles.gray3,
              borderRadius: BorderRadius.all(Radius.circular(16))),
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Center(
            child: Text(
              content,
              style: FontStyles.semiBold12.copyWith(color: ColorStyles.white),
            ),
          ),
        ),
      ),
    ),
    duration: const Duration(seconds: 1),
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    elevation: 0,
  );
}
