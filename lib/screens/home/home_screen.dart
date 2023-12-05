import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naemansan/models/geolocation_model.dart';
import 'package:naemansan/viewModel/home_view_model.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 홈 화면에 HomeViewModel 연결
    final HomeViewModel viewModel = Get.put(HomeViewModel());
    final pathOverlays = viewModel.createPathOverlays();

    return Scaffold(
      body: GetBuilder<HomeViewModel>(
        init: viewModel,
        builder: (viewModel) {
          if (viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return Stack(
            children: [
              Expanded(
                child: NaverMap(
                  scrollGestureEnable: false,
                  zoomGestureEnable: false,
                  mapType: MapType.Basic,
                  pathOverlays: pathOverlays, // Your path overlays here
                  initialCameraPosition: CameraPosition(
                    target: viewModel.currentLocation?.toLatLng() ??
                        const LatLng(37.3595704, 127.105399),
                    zoom: 17,
                  ),
                  initLocationTrackingMode: LocationTrackingMode.values[1],
                ),
              ),
              Positioned(
                bottom: 16, // Adjust the position as needed
                left: 16, // Adjust the position as needed
                child: Text(
                  viewModel.sigudongData?.toString() ?? '위치 정보 불러오는 중...',
                  style: const TextStyle(
                    color: Colors.white, // Set the text color
                    fontSize: 18, // Set the text font size
                    fontWeight: FontWeight.bold, // Set the text font weight
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

// Extension to convert GeoLocation to LatLng for NaverMap
extension on GeoLocation {
  LatLng toLatLng() => LatLng(latitude, longitude);
}

// si, gu, dong 정보를 담는 extends 
