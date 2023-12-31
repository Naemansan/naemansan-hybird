import 'package:naemansan/screens/curation/curation_screen.dart';
import 'package:naemansan/screens/myProfile/my_profile_screen.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:naemansan/screens/walkingLog/walking_log_screen.dart';
import 'package:naemansan/utilities/style/color_styles.dart';

import '../widget/base/custom_bottom_navigation_bar.dart';
import 'home/home_screen.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CustomBottomNavigationBarController());
    return Container(
      color: ColorStyles.white,
      child: Scaffold(
        backgroundColor: ColorStyles.white,
        body: Obx(() => IndexedStack(
              index: CustomBottomNavigationBarController.to.selectedIndex.value,
              children: [
                HomeScreen(),
                const CurationScreen(),
                const WalkingLogScreen(),
                const MyProfileScreen(),
              ],
            )),
        bottomNavigationBar: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomBottomNavigationBar(),
          ],
        ),
      ),
    );
  }
}
