import 'package:naemansan/screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../widget/base/custom_bottom_navigation_bar.dart';
import 'home_screen.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CustomBottomNavigationBarController());
    return Container(
      color: const Color(0xFFFFFFFF),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xFFFFFFFF),
          body: Obx(() => IndexedStack(
                index:
                    CustomBottomNavigationBarController.to.selectedIndex.value,
                children: const [
                  HomeScreen(),
                  ProfileScreen(),
                ],
              )),
          floatingActionButton: FloatingActionButton(
            shape: const CircleBorder(),
            elevation: 0,
            onPressed: () {
              print("pressed");
            },
            backgroundColor: const Color(0xFF7541EF),
            child: SvgPicture.asset("assets/icons/diary.svg",
                width: 24,
                height: 24,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                )),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          extendBody: true,
          bottomNavigationBar: const CustomBottomNavigationBar(),
        ),
      ),
    );
  }
}
