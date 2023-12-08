import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:naemansan/utilities/style/color_styles.dart';
import 'package:naemansan/utilities/style/font_styles.dart';

class CustomAppbar extends StatelessWidget {
  final String? leftIcon;
  final String? rightIcon;
  final String? rightLink;
  final String content;

  const CustomAppbar({
    super.key,
    required this.leftIcon,
    required this.rightIcon,
    required this.content,
    this.rightLink,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
          child: Row(children: [
            //좌측아이콘
            Visibility(
              visible: leftIcon != null,
              child: InkWell(
                onTap: () => Get.back(),
                child: Container(
                  margin: const EdgeInsets.only(right: 4),
                  child: SvgPicture.asset(
                    'assets/icons/$leftIcon.svg',
                    height: 24,
                    colorFilter: const ColorFilter.mode(
                        ColorStyles.gray3, BlendMode.srcATop),
                  ),
                ),
              ),
            ),
            //좌측아이콘

            //정보
            Expanded(
              child: Text(
                content,
                style: FontStyles.semiBold20.copyWith(color: ColorStyles.black),
              ),
            ),
            //정보

            //우측아이콘
            Visibility(
              visible: rightIcon != null,
              child: InkWell(
                onTap: () => {Get.toNamed(rightLink!)},
                child: Container(
                  margin: const EdgeInsets.only(left: 4),
                  child: SvgPicture.asset(
                    'assets/icons/$rightIcon.svg',
                    height: 24,
                    colorFilter: const ColorFilter.mode(
                        ColorStyles.gray3, BlendMode.srcATop),
                  ),
                ),
              ),
            )
            //우측아이콘
          ]),
        ),
      ),
    );
  }
}
