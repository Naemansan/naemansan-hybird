import 'package:flutter/material.dart';
import 'package:naemansan/models/trail_card_model.dart';
import 'package:naemansan/widget/trail/trailCard/trail_card.dart';

class TrailCardList extends StatelessWidget {
  final List<TrailCardModel> trailList;
  const TrailCardList({super.key, required this.trailList});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: trailList
          .map((trail) => TrailCard(
                trailInfo: trail,
              ))
          .toList(),
    );
  }
}
