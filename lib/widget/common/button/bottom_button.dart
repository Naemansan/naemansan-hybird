import 'package:flutter/material.dart';
import 'package:naemansan/utilities/style/color_styles.dart';
import 'package:naemansan/utilities/style/font_styles.dart';
import 'package:naemansan/widget/common/button/solid_button.dart';

class BottomButton extends StatelessWidget {
  final List<Widget> buttonList;
  const BottomButton({super.key, required this.buttonList});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: ColorStyles.white,
        width: double.infinity,
        height: 88,
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 28),
        child: Row(
          children: buttonList.map((e) => e).toList(),
        ));
  }
}
