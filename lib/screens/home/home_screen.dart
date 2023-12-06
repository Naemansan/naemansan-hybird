import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naemansan/models/geolocation_model.dart';
import 'package:naemansan/utilities/style/color_styles.dart';
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
              NaverMap(
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
              Positioned(
                bottom: 20,
                left: 16,
                right: 50,
                child: Container(
                  height: 112,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(4),
                    ),
                    // border color
                    border: Border.fromBorderSide(
                      BorderSide(
                        color: ColorStyles.main1,
                        width: 2,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          viewModel.sigudongData?.toString() ?? '',
                          style: const TextStyle(
                            color: ColorStyles.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          viewModel.sigudongData?.toString() ?? '',
                          style: const TextStyle(
                            color: ColorStyles.gray5,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
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
