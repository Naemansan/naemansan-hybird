import 'package:flutter/material.dart';

double getScaleWidth(BuildContext context) {
  const designGuideWidth = 390;
  final diff = MediaQuery.of(context).size.width / designGuideWidth;

  return diff;
}
