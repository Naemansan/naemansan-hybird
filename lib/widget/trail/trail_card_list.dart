import 'package:flutter/material.dart';
import 'package:naemansan/widget/trail/trail_card.dart';

class TrailCardList extends StatelessWidget {
  const TrailCardList({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> trailList = ["산책로", "산책로", "산책로 하나 더"];
    return Column(
      children: trailList.map((trail) => TrailCard(name: trail)).toList(),
    );
  }
}
