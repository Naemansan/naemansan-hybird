import 'package:flutter/material.dart';
import 'package:naemansan/utilities/style/color_styles.dart';
import 'package:naemansan/utilities/style/font_styles.dart';
import 'package:naemansan/widget/moment/momentCard/moment_card.dart';

class TrailDetailMomentList extends StatefulWidget {
  const TrailDetailMomentList({super.key});

  @override
  State<TrailDetailMomentList> createState() => _TrailDetailMomentListState();
}

class _TrailDetailMomentListState extends State<TrailDetailMomentList> {
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
                    "모먼트",
                    style: FontStyles.semiBold20
                        .copyWith(color: ColorStyles.black),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    "6",
                    style:
                        FontStyles.regular12.copyWith(color: ColorStyles.gray3),
                  ),
                ],
              ),
            ),
            // 타이틀

            //모먼트 리스트
            Container(
              width: double.infinity,
              child: SingleChildScrollView(
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                child: Wrap(
                  spacing: 12,
                  children: [1, 2, 3, 4].map((element) {
                    return MomentCard();
                  }).toList(),
                ),
              ),
            ),

            //모먼트 리스트
          ],
        ));
  }
}
