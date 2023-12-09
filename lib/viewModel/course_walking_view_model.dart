import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:naemansan/services/location_service.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';
import 'package:naemansan/utilities/style/color_styles.dart';

class CourseWalkingViewModel extends GetxController {
  // 위치 정보를 받아오는 서비스
  final LocationService locationService = LocationService();
  // 현재 위치를 저장하는 리스트
  final RxList<LatLng> latLngList = <LatLng>[].obs;
  // 현재 경로를 표시하는 PathOverlay
  Rxn<PathOverlay> currentPathOverlay = Rxn<PathOverlay>();
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  @override
  void onInit() {
    super.onInit();
    _isLoading = true; // Set loading to true initially
    // Request current location permissions and set initial location
    determinePosition().then((Position position) {
      // Set loading to false when location is obtained
      _isLoading = false;
      // Add the current location to the path
      addInitialLocationToPath(position);
    }).catchError((e) {
      // Handle error, perhaps set a flag to show an error message
      _isLoading = false;
    });

    // If you don't want to wait for `determinePosition`, uncomment the following line
    // to add a default initial position to the path:
    // addInitialLocationToPath(Position(latitude: 37.3595704, longitude: 127.105399));
  }

  // Add initial location to the path
  void addInitialLocationToPath(Position position) {
    var initialPoint = LatLng(position.latitude, position.longitude);
    // Add the initial position twice to start the path
    latLngList.addAll([initialPoint, initialPoint]);

    // Update the PathOverlay
    updatePathOverlay();
  }

  // Function to create and update the path overlay
  void updatePathOverlay() {
    if (latLngList.length > 1) {
      var newPathOverlay = PathOverlay(
        PathOverlayId('walking_path'),
        latLngList.toList(),
        width: 12,
        color: ColorStyles.main2,
        outlineColor: Colors.transparent,
      );

      currentPathOverlay.value = newPathOverlay;
    }
  }

// 현재 위치를 경로에 추가하는 함수
  void addLocationToPath(Position position) {
    var newPoint = LatLng(position.latitude, position.longitude);
    //새 위치를 경로에 추가
    latLngList.add(newPoint);

    // 경로를 표시하는 PathOverlay 생성
    var newPathOverlay = PathOverlay(
      PathOverlayId('walking_path'),
      latLngList,
      width: 12,
      color: ColorStyles.main2,
      outlineColor: Colors.transparent,
    );

    // 업데이트
    currentPathOverlay.value = newPathOverlay;
  }

  // 사용자의 현재 위치를 결정하는 함수
  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    _isLoading = true;

    // 위치 서비스가 활성화되어 있는지 확인
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // 위치 서비스가 비활성화되어 있다면 에러를 반환
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // 권한이 거부되었다면 에러를 반환
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // 권한이 영구적으로 거부되었다면 에러를 반환
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // 현재 위치를 반환
    return await Geolocator.getCurrentPosition();
  }

// 산책 종료
  void endWalk() {}

// 산책 경로에 장소 추가
  void addSpot() {}
}
