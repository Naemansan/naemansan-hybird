import 'package:flutter/material.dart';
import 'package:naemansan/widget/base/custom_tabbar.dart';
import 'package:naemansan/widget/walkingLog/walkinglog_course.dart';
import 'package:naemansan/widget/walkingLog/walkinglog_like.dart';
import 'package:naemansan/widget/walkingLog/walkinglog_moment.dart';

class WalkingLogScreen extends StatelessWidget {
  const WalkingLogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SafeArea(
      child: CustomTabbar(
          tabs: ["산책로", "모먼트"],
          rightTabs: ["좋아요"],
          tabviews: [WalkingLogCourse(), WalkingLogMoment(), WalkingLogLike()]),
    ));
  }
}
