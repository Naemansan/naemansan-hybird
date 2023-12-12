import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:naemansan/services/location_service.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';
import 'package:naemansan/utilities/style/color_styles.dart';

class CourseWalkingViewModel extends GetxController {
  /* ---------------- 위치 관련 ----------------  */
  // 위치 정보를 받아오는 서비스
  final LocationService locationService = LocationService();
  // 현재 위치를 저장하는 리스트
  final RxList<LatLng> latLngList = <LatLng>[].obs;
  // 현재 경로를 표시하는 PathOverlay
  Rxn<PathOverlay> currentPathOverlay = Rxn<PathOverlay>();

/* ---------------- SPOT 관련 ----------------  */
  // 선택한 카테고리 아이콘
  var selectedIndex = Rx<int?>(null);
  var spotName = ''.obs;
  var spotDescription = ''.obs;
  // 등록한 스팟 갯수
  var spotCnt = 0.obs;

/* ---------------- 그외 ----------------  */
  bool _isLoading = false;
  bool get isLoading => _isLoading;

/* ---------------- Method ----------------  */
  @override
  void onInit() {
    super.onInit();
    _isLoading = true;
    // 현재 위치를 받아옴
    determinePosition().then((Position position) {
      _isLoading = false;
      addInitialLocationToPath(position);
    }).catchError((e) {
      _isLoading = false;
    });
  }

  // 폼이 유효한지 확인하는 getter
  bool get isFormValid =>
      spotName.isNotEmpty &&
      spotDescription.isNotEmpty &&
      selectedIndex.value != null;

  // 카테고리 아이콘 선택
  void selectSpotIcon(int index) {
    selectedIndex.value = index;
  }

  // 스팟 등록 함수
  void registerSpot(String name, String description) {
    // 등록 알고리즘
    // ..
    // 장소 추가 성공시 cnt 증가
    spotCnt.value++;
    // 등록 후 폼 초기화
    spotName.value = '';
    spotDescription.value = '';
    selectedIndex.value = null;
  }

  // 유저가 입력한 스팟 이름과 설명을 업데이트하는 함수
  void updateName(String name) {
    spotName.value = name;
  }

  void updateDescription(String description) {
    spotDescription.value = description;
  }

  // 산책 시작 처음 위치를 경로에 추가
  void addInitialLocationToPath(Position position) {
    var initialPoint = LatLng(position.latitude, position.longitude);
    latLngList.addAll([initialPoint, initialPoint]);
    updatePathOverlay();
  }

  // 업데이트 경로
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

  // 산책 중 현재 위치를 경로에 추가
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
}
