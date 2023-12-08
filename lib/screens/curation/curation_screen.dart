import 'package:flutter/material.dart';
import 'package:naemansan/widget/base/custom_tabbar.dart';

class CurationScreen extends StatelessWidget {
  const CurationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SafeArea(
      child: CustomTabbar(
          tabs: ["주변 산책로", "인기 산책로"],
          rightTabs: [],
          tabviews: [Text("주변산책로"), Text("인기산책로")]),
    ));
  }
}
