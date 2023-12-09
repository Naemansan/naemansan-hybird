import 'package:flutter/material.dart';
import 'package:naemansan/widget/base/custom_tabbar.dart';
import 'package:naemansan/widget/curation/curationNear/curation_near.dart';
import 'package:naemansan/widget/curation/curationPopular/curation_popular.dart';

class CurationScreen extends StatelessWidget {
  const CurationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SafeArea(
      child: CustomTabbar(
          tabs: ["주변 산책로", "인기 산책로"],
          rightTabs: [],
          tabviews: [CurationNear(), CurationPopular()]),
    ));
  }
}
