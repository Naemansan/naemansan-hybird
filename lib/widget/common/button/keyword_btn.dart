import 'package:flutter/material.dart';

import 'package:naemansan/utilities/style/color_styles.dart';
import 'package:naemansan/utilities/style/font_styles.dart';

class KeywordBtn extends StatefulWidget {
  final bool isSelected;
  final String content;

  final Function() onBtnTap;

  const KeywordBtn(
      {super.key,
      required this.isSelected,
      required this.content,
      required this.onBtnTap});

  @override
  State<KeywordBtn> createState() => _KeywordBtnState();
}

class _KeywordBtnState extends State<KeywordBtn> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => widget.onBtnTap(),
        child: widget.isSelected
            ?
            //선택 됨
            Container(
                decoration: BoxDecoration(
                    color: ColorStyles.main1,
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    border: Border.all(width: 2, color: ColorStyles.main1)),
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                margin: const EdgeInsets.only(right: 8),
                child: Text(widget.content,
                    style: FontStyles.semiBold12
                        .copyWith(color: ColorStyles.white)),
              )
            :
            //선택 안됨
            Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    border: Border.all(width: 2, color: ColorStyles.main1)),
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                margin: const EdgeInsets.only(right: 8),
                child: Text(widget.content,
                    style: FontStyles.semiBold12
                        .copyWith(color: ColorStyles.main1)),
              ));
  }
}
