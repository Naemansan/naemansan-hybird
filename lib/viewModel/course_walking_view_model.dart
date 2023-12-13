import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:naemansan/models/course_detail_model.dart';
import 'package:naemansan/models/course_walking_single_spot_model.dart';
import 'package:naemansan/services/location_service.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';
import 'package:naemansan/utilities/style/color_styles.dart';

class CourseWalkingViewModel extends GetxController {
  /* ---------------- 위치 관련 ----------------  */
  StreamSubscription<Position>? _positionStreamSubscription;
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

  // spot저장할 리스트
  var spotList = <WalkingSingleSpotModel>[].obs;

/* ---------------- 그외 ----------------  */
  bool _isLoading = false;
  bool get isLoading => _isLoading;

/* ---------------- Method ----------------  */
  @override
  void onInit() {
    super.onInit();
    _isLoading = true;
    // 현재 위치를 받아옴

    updatePathOverlay();
  }

  @override
  void onClose() {
    super.onClose();
    stopLocationTracking();
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

  // index에 따라 카테고리 string 반환
  String getSpotCategory(int index) {
    // index가 null이면 빈 문자열 반환
    switch (index) {
      case 0:
        return 'PUB_BAR';
      case 1:
        return 'ACCOMMODATION';
      case 2:
        return 'NATURE';
      case 3:
        return 'SHOPPING';
      case 4:
        return 'FOOD';
      case 5:
        return 'CAFE_BAKERY';
      case 6:
        return 'PLACE';

      default:
        return '';
    }
  }

  // 스팟 등록 함수
  void registerSpot(
    String title,
    String content,
    String categroy,
  ) async {
    _isLoading = true;
    // 현재 위치 받아오기
    Position position = await getNowLocation();

    // spot 모델을 토대로 새로운 spot 생성
    WalkingSingleSpotModel newSpot = WalkingSingleSpotModel(
      title: title,
      content: content,
      location:
          Location(latitude: position.latitude, longitude: position.longitude),
      category: categroy,
      // imageState: imageState
    );

    // 생성된 spot 리스트에 추가
    spotList.add(newSpot);
    update(); // 상태 업데이트
    _isLoading = false;
    // 등록된 spot

    // 등록 알고리즘

    // 등록 후 폼 초기화
    spotName.value = '';
    spotDescription.value = '';
    selectedIndex.value = null;
  }

  // 유저가 입력한 스팟 이름과 설명을 업데이트하는 함수
  void updateSpotName(String name) {
    spotName.value = name;
  }

  void updateSpotDescription(String description) {
    spotDescription.value = description;
  }

// 현재 위치 받아오기
  Future<Position> getNowLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return position;
  }

  void setLatLngList() async {
    final Position postionNowLocation = await getNowLocation();

    latLngList
        .add(LatLng(postionNowLocation.latitude, postionNowLocation.longitude));
    latLngList
        .add(LatLng(postionNowLocation.latitude, postionNowLocation.longitude));
    print("초기 위치 설정 완료");
    print(latLngList);
    print("위치 추적 시작");
    startLocationTracking();
  }

  // 업데이트 경로
  void updatePathOverlay() {
    print("updatePathOverlay");
    if (latLngList.isEmpty) {
      setLatLngList();
    } else {
      var newPathOverlay = PathOverlay(
        PathOverlayId('walking_path'),
        latLngList,
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
    print("addLocationToPath $newPoint");
    // 위치가 실제로 변경되었는지 확인
    if (latLngList.isEmpty || _isPositionChanged(newPoint)) {
      print("위치 변경");
      latLngList.add(newPoint); //새 위치를 경로에 추가
      updatePathOverlay(); // 경로 업데이트
    } else {
      print("위치 변경 안됨");
    }
  }

  bool _isPositionChanged(LatLng newPoint) {
    if (latLngList.isEmpty) {
      return true;
    }

    final lastPoint = latLngList.last;
    final distance = Geolocator.distanceBetween(lastPoint.latitude,
        lastPoint.longitude, newPoint.latitude, newPoint.longitude);

    // 거리가 3미터 이상인지 확인
    return distance > 3.0;
  }

  void startLocationTracking() {
    const locationOptions = LocationSettings(
      accuracy: LocationAccuracy.bestForNavigation,
      distanceFilter: 5,
      timeLimit: Duration(seconds: 5),
    );
    print("위치 추적 시작");

    _positionStreamSubscription = Geolocator.getPositionStream(
      locationSettings: locationOptions,
    ).listen((Position position) {
      addLocationToPath(position);
    });
  }

// 산책 중지
  void stopLocationTracking() {
    if (_positionStreamSubscription != null) {
      _positionStreamSubscription!.cancel();
      _positionStreamSubscription = null;
      print("위치 추적 중단");
    } else {
      print("위치 추적 중단 실패");
    }
    // 경로 초기화
    latLngList.clear();
    print("경로 초기화");
  }

// 산책 종료
  void endWalk() {}
}
