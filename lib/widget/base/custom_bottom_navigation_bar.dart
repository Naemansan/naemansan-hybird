import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../utilities/style/color_styles.dart';

class CustomBottomNavigationBar
    extends GetView<CustomBottomNavigationBarController> {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CustomBottomNavigationBarController());
    return Obx(() => Theme(
          data: ThemeData(
            highlightColor: Colors.transparent,
            splashFactory: NoSplash.splashFactory,
          ),
          child: BottomAppBar(
            // backgroundColor: Colors.white,

            shape: const CircularNotchedRectangle(),
            notchMargin: 7.0,
            clipBehavior: Clip.antiAlias,
            child: BottomNavigationBar(
              elevation: 0,
              currentIndex: controller.index,
              onTap: controller.changeIndex,
              unselectedItemColor: ColorStyles.gray1,
              selectedItemColor: ColorStyles.main1,
              // 탭 애니메이션 변경 (fixed: 없음)
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,

              // Bar에 보여질 요소. icon과 label로 구성.
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/icons/home.svg',
                    height: 24,
                    colorFilter: controller.index == 0
                        ? const ColorFilter.mode(
                            ColorStyles.main1, BlendMode.srcATop)
                        : const ColorFilter.mode(
                            ColorStyles.gray1, BlendMode.srcATop),
                  ),
                  label: "홈",
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/icons/tree.svg',
                    height: 24,
                    colorFilter: controller.index == 1
                        ? const ColorFilter.mode(
                            ColorStyles.main1, BlendMode.srcATop)
                        : const ColorFilter.mode(
                            ColorStyles.gray1, BlendMode.srcATop),
                  ),
                  label: "큐레이션",
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/icons/calendar.svg',
                    height: 24,
                    colorFilter: controller.index == 2
                        ? const ColorFilter.mode(
                            ColorStyles.main1, BlendMode.srcATop)
                        : const ColorFilter.mode(
                            ColorStyles.gray1, BlendMode.srcATop),
                  ),
                  label: "산책로그",
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/icons/profile.svg',
                    height: 20,
                    colorFilter: controller.index == 3
                        ? const ColorFilter.mode(
                            ColorStyles.main1, BlendMode.srcATop)
                        : const ColorFilter.mode(
                            ColorStyles.gray1, BlendMode.srcATop),
                  ),
                  label: "프로필",
                ),
              ],
              selectedLabelStyle: const TextStyle(
                fontSize: 13,
              ),
              // 선택되지 않은 항목에 대한 스타일도 설정할 수 있습니다.
              unselectedLabelStyle: const TextStyle(
                fontSize: 13,
              ),
            ),
          ),
        ));
  }
}

class CustomBottomNavigationBarController extends GetxController {
  final RxInt selectedIndex = 0.obs;

  static CustomBottomNavigationBarController get to => Get.find();
  int get index => selectedIndex.value;

  void changeIndex(int index) {
    selectedIndex(index);
  }
}
