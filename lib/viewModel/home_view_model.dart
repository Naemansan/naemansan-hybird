import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naemansan/models/geo_location.dart';
import 'package:naemansan/models/naver_map_sigudong.dart';
import 'package:naemansan/services/geolocator_service.dart';
import 'package:naemansan/services/naver_map_siGuDong_service.dart';
import 'package:naemansan/utilities/style/color_styles.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';

class HomeViewModel extends GetxController {
  // GeolocatorService, SiGuDongService 객체 생성
  final GeolocatorService _geolocatorService = GeolocatorService();
  final SiGuDongService _naverMapService = SiGuDongService();

  // 현재 위치, 시구동 정보, 로딩 여부 변수
  GeoLocation? _currentLocation;
  SiguDong? _naverMapData;
  bool _isLoading = false;

  HomeViewModel() {
    loadCurrentLocation();
  }

  // 현재 위치, 시구동 정보, 로딩 여부 변수의 getter
  GeoLocation? get currentLocation => _currentLocation;
  SiguDong? get naverMapData => _naverMapData;
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
  Set<PathOverlay> createPathOverlays() {
    Set<PathOverlay> pathOverlays = {};

    pathOverlays.add(
      PathOverlay(
        PathOverlayId("dummy"),
        [
          const LatLng(37.55905356536202, 127.00033312353234),
          const LatLng(37.55929595808703, 127.00037335666757),
          const LatLng(37.55950220390754, 127.000451140729),
          const LatLng(37.55957024364062, 127.00067108186822),
          const LatLng(37.559766156821595, 127.00080260449865),
          const LatLng(37.560045979501844, 127.00086248649693),
          const LatLng(37.560422098031914, 127.00094988935628),
          const LatLng(37.560763763504944, 127.00109481811523),
          const LatLng(37.56073718551571, 127.00100559439653),
        ],
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
        _naverMapData = await _naverMapService.fetchData(
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
