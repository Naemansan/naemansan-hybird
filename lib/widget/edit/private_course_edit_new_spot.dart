import 'package:flutter/material.dart';
import 'package:naemansan/models/spot_model.dart';

import 'package:naemansan/widget/common/alret/custom_snackbar.dart';
import 'package:naemansan/widget/spot/spot_card.dart';

class PrivateCourseEditNewSpot extends StatefulWidget {
  final List<int> currentSelect;
  final List<Spot>? newSpots;
  final VoidCallback onChanged;
  const PrivateCourseEditNewSpot(
      {super.key,
      required this.onChanged,
      required this.currentSelect,
      required this.newSpots});

  @override
  State<PrivateCourseEditNewSpot> createState() =>
      _PrivateCourseEditNewSpotState();
}

class _PrivateCourseEditNewSpotState extends State<PrivateCourseEditNewSpot> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 40),
      child: Column(
        children: [
          //스팟 리스트...
          Wrap(
            runSpacing: 20,
            children: widget.newSpots!
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
