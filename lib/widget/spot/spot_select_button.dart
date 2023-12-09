import 'package:flutter/material.dart';
import 'package:naemansan/utilities/style/color_styles.dart';
import 'package:naemansan/utilities/style/font_styles.dart';

class SpotSelectButton extends StatefulWidget {
  final bool? isSelected;
  final VoidCallback? onTap;

  const SpotSelectButton({
    super.key,
    required this.isSelected,
    required this.onTap,
  });

  @override
  State<SpotSelectButton> createState() => _SpotSelectButtonState();
}

class _SpotSelectButtonState extends State<SpotSelectButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 4),
      child: InkWell(
          onTap: widget.onTap,
          child: widget.isSelected!
              ? (Container(
                  width: 80,
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      border: Border.all(
                        color: ColorStyles.gray1,
                        width: 2,
                      )),
                  child: Center(
                      child: Text(
                    "제외",
                    style: FontStyles.semiBold12
                        .copyWith(color: ColorStyles.gray1),
                  )),
                ))
              : (Container(
                  width: 80,
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                      color: ColorStyles.main1,
                      borderRadius: BorderRadius.circular(32),
                      border: Border.all(
                        color: ColorStyles.main1,
                        width: 2,
                      )),
                  child: Center(
                      child: Text(
                    "포함",
                    style: FontStyles.semiBold12
                        .copyWith(color: ColorStyles.white),
                  )),
                ))),
    );
  }
}
