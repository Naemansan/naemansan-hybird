import 'package:flutter/material.dart';
import 'package:naemansan/models/moment_model.dart';
import 'package:naemansan/utilities/emotion_list.dart';
import 'package:naemansan/utilities/style/color_styles.dart';
import 'package:naemansan/utilities/style/font_styles.dart';
import 'package:naemansan/widget/moment/momentCard/moment_card.dart';

class CourseDetailMomentList extends StatefulWidget {
  final List<Moment> momentList;
  const CourseDetailMomentList({super.key, required this.momentList});

  @override
  State<CourseDetailMomentList> createState() => _CourseDetailMomentListState();
}

class _CourseDetailMomentListState extends State<CourseDetailMomentList> {
  int currentMoment = 0;

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
              child: Column(
                children: [
                  Row(
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
                        widget.momentList.length.toString(),
                        style: FontStyles.regular12
                            .copyWith(color: ColorStyles.gray3),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  EmotionConfig.emotionInfo,
                ],
              ),
            ),
            // 타이틀

            //모먼트 리스트
            SizedBox(
              width: double.infinity,
              child: SingleChildScrollView(
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                child: Column(
                  children: [
                    Wrap(
                      spacing: 12,
                      children:
                          widget.momentList.asMap().entries.map((element) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              currentMoment = element.key;
                            });
                          },
                          child: Opacity(
                            opacity: currentMoment == element.key ? 1 : 0.3,
                            child: MomentCard(
                              momentInfo: element.value,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 12),
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 20),
              decoration: BoxDecoration(
                  color: ColorStyles.gray0,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: ColorStyles.gray0,
                    width: 2,
                  )),
              child: Text(
                widget.momentList[currentMoment].content,
                style: FontStyles.regular16.copyWith(color: ColorStyles.black),
              ),
            ),

            //모먼트 리스트
          ],
        ));
  }
}
