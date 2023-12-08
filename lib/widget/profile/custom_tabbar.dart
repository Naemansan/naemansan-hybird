import 'package:flutter/material.dart';
import 'package:naemansan/utilities/style/color_styles.dart';
import 'package:naemansan/utilities/style/font_styles.dart';

class CustomTabbar extends StatefulWidget {
  const CustomTabbar({Key? key, required this.tabs, required this.tabviews})
      : super(key: key);

  final List<String> tabs;
  final List<Widget> tabviews;

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
          height: 68,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.tabs.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      current = index;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: (current == index
                        ? const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: ColorStyles.black, width: 2)))
                        : null),
                    child: Text(
                      widget.tabs[index],
                      style: current == index
                          ? FontStyles.semiBold20
                              .copyWith(color: ColorStyles.black)
                          : FontStyles.semiBold20
                              .copyWith(color: ColorStyles.gray3),
                    ),
                  ),
                );
              }),
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
