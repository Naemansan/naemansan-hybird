import 'package:flutter/material.dart';
import 'package:naemansan/models/course_detail_model.dart';
import 'package:naemansan/models/spot_model.dart';
import 'package:naemansan/utilities/style/color_styles.dart';
import 'package:naemansan/utilities/style/font_styles.dart';
import 'package:naemansan/widget/common/alret/custom_snackbar.dart';
import 'package:naemansan/widget/spot/spot_card.dart';

class PrivateCourseEditSpot extends StatefulWidget {
  final List<int> currentSelect;
  final VoidCallback onChanged;
  const PrivateCourseEditSpot(
      {super.key, required this.onChanged, required this.currentSelect});

  @override
  State<PrivateCourseEditSpot> createState() => _PrivateCourseEditSpotState();
}

class _PrivateCourseEditSpotState extends State<PrivateCourseEditSpot> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 40),
      child: Column(
        children: [
          //제목 (스팟 - 스팟개수)
          Container(
            padding: const EdgeInsets.fromLTRB(4, 4, 4, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("스팟",
                        style: FontStyles.semiBold20
                            .copyWith(color: ColorStyles.black)),
                    const SizedBox(
                      width: 8,
                    ),
                    Text("5",
                        style: FontStyles.regular12
                            .copyWith(color: ColorStyles.gray3)),
                  ],
                ),
                const SizedBox(height: 4),
                Text("최대 5개의 Spot을 저장할 수 있어요!",
                    style:
                        FontStyles.regular12.copyWith(color: ColorStyles.gray3))
              ],
            ),
          ),
          //제목 (스팟 - 스팟개수)

          //스팟 리스트...
          Wrap(
            runSpacing: 20,
            children: [
              Spot(
                  id: 1,
                  title: "1",
                  content: "content",
                  location: Location(latitude: 10.0, longitude: 10.0),
                  category: "CAFE")
            ]
                .asMap()
                .entries
                .map((element) => SpotCard(
                      spotInfo: element.value,
                      isSelected: widget.currentSelect.contains(element.key),
                      onTap: () {
                        setState(() {
                          if (widget.currentSelect.contains(element.key)) {
                            widget.currentSelect.remove(element.key);
                            widget.onChanged();
                          } else {
                            if (widget.currentSelect.length >= 3) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  customSnackbar("스팟은 5개까지 선택 가능합니다!"));
                            } else {
                              widget.currentSelect.add(element.key);
                              widget.onChanged();
                            }
                          }
                        });
                      },
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}
