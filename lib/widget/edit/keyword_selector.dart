import 'package:flutter/material.dart';
import 'package:naemansan/utilities/style/color_styles.dart';
import 'package:naemansan/widget/common/alret/custom_snackbar.dart';
import 'package:naemansan/widget/common/button/keyword_btn.dart';

class KeywordSelector extends StatefulWidget {
  final List<int> currentSelect;
  const KeywordSelector({super.key, required this.currentSelect});

  @override
  State<KeywordSelector> createState() => _KeywordSelectorState();
}

class _KeywordSelectorState extends State<KeywordSelector> {
  var currentSelect = [];

  @override
  Widget build(BuildContext context) {
    final keywords = [
      "일상속 여유",
      '평온한 힐링',
      '자연과 함께',
      '활기찬 분위기',
      '감성충만',
      '도심풍경',
      '새로운 모험',
      '고즈넉한 무드',
      "강길을 따라",
      "일상의 재발견",
    ];

    return //태그 선택
        SizedBox(
      width: double.infinity,
      child: Wrap(
          runSpacing: 8,
          children: keywords
              .asMap()
              .entries
              .map((element) => KeywordBtn(
                  isSelected: (currentSelect.contains((element.key))),
                  content: element.value,
                  onBtnTap: () {
                    setState(() {
                      if (currentSelect.contains(element.key)) {
                        currentSelect.remove(element.key);
                      } else {
                        if (currentSelect.length >= 3) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(customSnackba("3개까지 가능"));
                        } else {
                          currentSelect.add(element.key);
                        }
                      }
                    });
                  }))
              .toList()),
    ); //태그 선택
  }
}
