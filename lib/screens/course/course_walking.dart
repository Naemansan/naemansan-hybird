import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naemansan/viewModel/home_view_model.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';

class CourseWalking extends StatelessWidget {
  const CourseWalking({super.key});

  @override
  Widget build(BuildContext context) {
    // 홈 화면에 HomeViewModel 연결
    final HomeViewModel homeViewModel = Get.put(HomeViewModel());

    return Column(
      children: [
        NaverMap(
          scrollGestureEnable: false,
          zoomGestureEnable: false,
          mapType: MapType.Basic,
          initialCameraPosition: CameraPosition(
            target: homeViewModel.currentLocation?.toLatLng() ??
                const LatLng(37.3595704, 127.105399),
            zoom: 17,
          ),
          initLocationTrackingMode: LocationTrackingMode.values[1],
        ),
      ],
    );
  }
}
