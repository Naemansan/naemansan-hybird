import 'package:flutter/material.dart';
import 'package:naemansan/models/moment_model.dart';
import 'package:naemansan/utilities/style/color_styles.dart';
import 'package:naemansan/utilities/style/font_styles.dart';
import 'package:naemansan/widget/moment/momentDetail/moment_detail.dart';

class WalkingLogMomentMonth extends StatelessWidget {
  final List<List<MomentModel>> momentsList;
  final List<String> datesList;

  const WalkingLogMomentMonth(
      {required this.momentsList, required this.datesList});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 40,
      children: momentsList
          .asMap()
          .entries
          .map((element) => Column(
                children: [
                  //타이틀
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.fromLTRB(4, 4, 4, 16),
                    child: Text(
                      datesList[element.key],
                      style: FontStyles.semiBold20
                          .copyWith(color: ColorStyles.black),
                    ),
                  ), //타이틀
                  Wrap(
                    runSpacing: 20,
                    children: element.value.map((element) {
                      return MomentDetail(
                        momentInfo: element,
                      );
                    }).toList(),
                  )
                ],
              ))
          .toList(),
    );
  }
}
