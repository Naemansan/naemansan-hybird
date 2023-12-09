import 'package:flutter/material.dart';
import 'package:naemansan/utilities/style/color_styles.dart';
import 'package:naemansan/utilities/style/font_styles.dart';

class CustomTabbar extends StatefulWidget {
  final List<String> tabs;
  final List<String> rightTabs;
  final List<Widget> tabviews;

  const CustomTabbar(
      {Key? key,
      required this.tabs,
      required this.tabviews,
      required this.rightTabs})
      : super(key: key);

  @override
  State<CustomTabbar> createState() => _CustomTabbar();
}

class _CustomTabbar extends State<CustomTabbar> {
  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //탭바
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          width: double.infinity,
          height: 48,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                  children: widget.tabs
                      .asMap()
                      .entries
                      .map((tab) => InkWell(
                            onTap: () {
                              setState(() {
                                current = tab.key;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: (current == tab.key
                                  ? const BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: ColorStyles.black,
                                              width: 2)))
                                  : null),
                              child: Text(
                                tab.value,
                                style: current == tab.key
                                    ? FontStyles.semiBold20
                                        .copyWith(color: ColorStyles.black)
                                    : FontStyles.semiBold20
                                        .copyWith(color: ColorStyles.gray3),
                              ),
                            ),
                          ))
                      .toList()),
              Row(
                  children: widget.rightTabs
                      .asMap()
                      .entries
                      .map((tab) => InkWell(
                            onTap: () {
                              setState(() {
                                current = tab.key + widget.tabs.length;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration:
                                  (current == tab.key + widget.tabs.length
                                      ? const BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: ColorStyles.black,
                                                  width: 2)))
                                      : null),
                              child: Text(
                                tab.value,
                                style: current == tab.key + widget.tabs.length
                                    ? FontStyles.semiBold20
                                        .copyWith(color: ColorStyles.black)
                                    : FontStyles.semiBold20
                                        .copyWith(color: ColorStyles.gray3),
                              ),
                            ),
                          ))
                      .toList())
            ],
          ),
        ),
        //탭바

        ///탭뷰
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
              child: widget.tabviews[current],
            ),
          ),
        ),
        //탭뷰
      ],
    );
  }
}
