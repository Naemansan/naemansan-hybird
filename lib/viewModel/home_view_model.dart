import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naemansan/models/geolocation_model.dart';
import 'package:naemansan/models/near_course_model.dart';
import 'package:naemansan/models/si_gu_dong_model.dart';
import 'package:naemansan/services/geolocation_service.dart';
import 'package:naemansan/services/si_gu_dong_service.dart';
import 'package:naemansan/utilities/style/color_styles.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';

class HomeViewModel extends GetxController {
  final GeolocatorService _geolocatorService = GeolocatorService();
  final SiGuDongService _naverMapService = SiGuDongService();
  var pathOverlays = Rx<Set<PathOverlay>>({});

  // 현재 위치, 시구동 정보, 로딩 여부 변수
  GeoLocation? _currentLocation;
  SiGuDongModel? _sigudongData;
  bool _isLoading = false;

  HomeViewModel() {
    loadCurrentLocation();
  }
  void updatePathOverlays(List<Location> locations) {
    Set<PathOverlay> newOverlays = createPathOverlays(locations);
    pathOverlays.value = newOverlays; // Update the Rx variable
  }

  // 현재 위치, 시구동 정보, 로딩 여부 변수의 getter
  GeoLocation? get currentLocation => _currentLocation;
  SiGuDongModel? get sigudongData => _sigudongData;
  bool get isLoading => _isLoading;

  // 현재 위치를 받아오는 함수
  void loadCurrentLocation() async {
    _isLoading = true;
    // 로딩 상태 변경
    update();

    try {
      _currentLocation = await _geolocatorService.getCurrentLocation();
      await fetchNaverMapData();
    } catch (e) {
      // Handle exceptions appropriately
    } finally {
      _isLoading = false;
      update();
    }
  }

  // 임시 더미데이터로 패스 오버레이 리스트 생성
  Set<PathOverlay> createPathOverlays(List<Location> locations) {
    Set<PathOverlay> pathOverlays = {};

    // Convert Location objects to LatLng and create PathOverlay
    List<LatLng> latLngList = locations
        .map((location) => LatLng(location.latitude, location.longitude))
        .toList();

    pathOverlays.add(
      PathOverlay(
        PathOverlayId(
            "Your Title Here"), // Use a unique identifier or course title
        latLngList,
        width: 12,
        color: ColorStyles.main2,
        outlineColor: Colors.transparent,
      ),
    );

    return pathOverlays;
  }

// 시구동 정보를 받아오는 함수
  Future<void> fetchNaverMapData() async {
    if (_currentLocation != null) {
      try {
        _sigudongData = await _naverMapService.fetchData(
          _currentLocation!.latitude,
          _currentLocation!.longitude,
        );
        update();
      } catch (e) {
        // Handle exceptions
      }
    }
  }
}
