import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:naemansan/models/course_detail_model.dart';
import 'package:naemansan/models/course_walking_single_spot_model.dart';
import 'package:naemansan/models/spot_model.dart';
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

// 스팟 리스트에서 인덱스당 category와 location을 반환하는 함수
  // List<Spot> getSpotList() {
  //   List<Spot> spotList = [];
  //   for (int i = 0; i < this.spotList.length; i++) {
  //     spotList.add(Spot(
  //         category: this.spotList[i].category,
  //         location: this.spotList[i].location));
  //   }
  //   return spotList;
  // }

// 현재 위치 받아오기
  Future<Position> getNowLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return position;
  }

  // 스팟 등록 함수
  void registerSpot(
    String title,
    String content,
    String categroy,
  ) async {
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
    // 등록된 spot
    print(newSpot);
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
