import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

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
            shape: const CircularNotchedRectangle(),
            notchMargin: 7.0,
            clipBehavior: Clip.antiAlias,
            child: BottomNavigationBar(
              elevation: 0,
              currentIndex: controller.index,
              onTap: controller.changeIndex,
              // padding

              // 아이템의 색상
              unselectedItemColor: Colors.grey[400],
              selectedItemColor: const Color(0xFF7541EF),

              // 탭 애니메이션 변경 (fixed: 없음)
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,

              // Bar에 보여질 요소. icon과 label로 구성.
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'assets/icons/user.svg',
                      height: 24,
                      colorFilter: controller.index == 0
                          ? const ColorFilter.mode(
                              Color(0xFF7541EF), BlendMode.srcATop)
                          : ColorFilter.mode(
                              Colors.grey[400]!, BlendMode.srcATop),
                    ),
                    label: "홈"),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/icons/house.svg',
                    height: 20,
                    colorFilter: controller.index == 1
                        ? const ColorFilter.mode(
                            Color(0xFF7541EF), BlendMode.srcATop)
                        : ColorFilter.mode(
                            Colors.grey[400]!, BlendMode.srcATop),
                  ),
                  label: "프로필",
                ),
              ],
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
