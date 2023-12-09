import 'package:flutter/material.dart';
import 'package:naemansan/utilities/tag_list.dart';
import 'package:naemansan/utilities/style/color_styles.dart';
import 'package:naemansan/utilities/style/font_styles.dart';

import 'package:naemansan/widget/common/alret/custom_snackbar.dart';
import 'package:naemansan/widget/common/button/tag_btn.dart';

class TagSelector extends StatefulWidget {
  final String label;
  final String placeholder;
  final String snackMessage;
  final List<int> currentSelect;

  final VoidCallback onChanged;

  const TagSelector({
    super.key,
    required this.label,
    required this.placeholder,
    required this.snackMessage,
    required this.currentSelect,
    required this.onChanged,
  });

  @override
  State<TagSelector> createState() => _TagSelectorState();
}

class _TagSelectorState extends State<TagSelector> {
  @override
  Widget build(BuildContext context) {
    return //태그 선택
        SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(4, 0, 4, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.label,
                  style: FontStyles.semiBold16.copyWith(
                    color: ColorStyles.black,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  widget.placeholder,
                  style: FontStyles.regular12.copyWith(
                    color: ColorStyles.gray3,
                  ),
                ),
              ],
            ),
          ),
          Wrap(
              runSpacing: 8,
              children: TagConfig.tagList
                  .asMap()
                  .entries
                  .map((element) => TagBtn(
                      isSelected: widget.currentSelect.contains((element.key)),
                      content: element.value,
                      onBtnTap: () {
                        setState(() {
                          if (widget.currentSelect.contains(element.key)) {
                            widget.currentSelect.remove(element.key);
                            widget.onChanged();
                          } else {
                            if (widget.currentSelect.length >= 3) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  customSnackbar(widget.snackMessage));
                            } else {
                              widget.currentSelect.add(element.key);
                              widget.onChanged();
                            }
                          }
                        });
                      }))
                  .toList()),
        ],
      ),
    ); //태그 선택
  }
}
