import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:naemansan/method/get_scale_width.dart';
import 'package:naemansan/models/spot_model.dart';
import 'package:naemansan/utilities/style/color_styles.dart';
import 'package:naemansan/utilities/style/font_styles.dart';

class SpotCard extends StatefulWidget {
  final SpotModel spotInfo;
  const SpotCard({super.key, required this.spotInfo});

  @override
  State<SpotCard> createState() => _SpotCardState();
}

class _SpotCardState extends State<SpotCard> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        width: double.infinity,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //타이틀
          Container(
            margin: const EdgeInsets.only(bottom: 12),
            child: Row(
              children: [
                //아이콘
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: ColorStyles.main1,
                        width: 2,
                      )),
                  padding: const EdgeInsets.all(4),
                  margin: const EdgeInsets.only(right: 8),
                  child: SvgPicture.asset(
                    'assets/icons/spot${widget.spotInfo.category}.svg',
                    height: 24,
                    colorFilter: const ColorFilter.mode(
                        ColorStyles.main1, BlendMode.srcATop),
                  ),
                ), //아이콘

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.spotInfo.title,
                      style: FontStyles.regular12
                          .copyWith(color: ColorStyles.black),
                    ),
                    Text(
                      widget.spotInfo.category,
                      style: FontStyles.regular12
                          .copyWith(color: ColorStyles.gray3),
                    ),
                  ],
                )
              ],
            ),
          ),
          //타이틀

          //썸네일
          Visibility(
            visible: widget.spotInfo.thumbnail != null,
            child: Container(
              width: double.infinity,
              height: getScaleWidth(context) * 200,
              margin: const EdgeInsets.only(right: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
              ),
              child: Image.asset(
                'assets/images/defaultImage.png',
                height: 32,
              ),
            ),
          ),
          //썸네일

          //내용
          Text(
            widget.spotInfo.description,
            style: FontStyles.regular16.copyWith(color: ColorStyles.black),
          ),
          //내용
        ]),
      )
    ]);
  }
}
