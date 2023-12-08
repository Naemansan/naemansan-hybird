import 'package:flutter/material.dart';
import 'package:naemansan/models/spot_model.dart';

import 'package:naemansan/utilities/style/color_styles.dart';
import 'package:naemansan/utilities/style/font_styles.dart';
import 'package:naemansan/widget/spot/spot_card.dart';

class TrailDetailSpotList extends StatefulWidget {
  final List<SpotModel> spotList;
  const TrailDetailSpotList({super.key, required this.spotList});

  @override
  State<TrailDetailSpotList> createState() => _TrailDetailSpotListState();
}

class _TrailDetailSpotListState extends State<TrailDetailSpotList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 타이틀
          Container(
            padding: const EdgeInsets.fromLTRB(4, 4, 4, 16),
            child: Row(
              children: [
                Text(
                  "스팟",
                  style:
                      FontStyles.semiBold20.copyWith(color: ColorStyles.black),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  widget.spotList.length.toString(),
                  style:
                      FontStyles.regular12.copyWith(color: ColorStyles.gray3),
                ),
              ],
            ),
          ),
          // 타이틀

          Wrap(
            runSpacing: 32,
            children: widget.spotList.map((element) {
              return SpotCard(spotInfo: element);
            }).toList(),
          ),
        ],
      ),
    );
  }
}
