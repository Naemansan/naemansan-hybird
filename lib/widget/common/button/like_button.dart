import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:naemansan/utilities/style/color_styles.dart';
import 'package:naemansan/utilities/style/font_styles.dart';

class LikeButton extends StatelessWidget {
  final String likeNum;
  final bool isLiked;
  final VoidCallback onTap;

  const LikeButton(
      {super.key,
      required this.likeNum,
      required this.isLiked,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 44,
      height: double.infinity,
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isLiked
                ? SvgPicture.asset(
                    'assets/icons/heartFill.svg',
                    height: 24,
                    colorFilter: const ColorFilter.mode(
                        ColorStyles.main1, BlendMode.srcATop),
                  )
                : SvgPicture.asset(
                    'assets/icons/heartStroke.svg',
                    height: 24,
                    colorFilter: const ColorFilter.mode(
                        ColorStyles.gray3, BlendMode.srcATop),
                  ),
            Text(
              likeNum,
              style: FontStyles.semiBold12.copyWith(color: ColorStyles.gray3),
            ),
          ],
        ),
      ),
    );
  }
}
