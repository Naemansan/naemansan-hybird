import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naemansan/models/geolocation_model.dart';
import 'package:naemansan/models/near_course_model.dart';
import 'package:naemansan/models/si_gu_dong_model.dart';
import 'package:naemansan/services/geolocation_service.dart';
import 'package:naemansan/services/si_gu_dong_service.dart';
import 'package:naemansan/utilities/style/color_styles.dart';
import 'package:naemansan/viewModel/course_view_model.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';

class HomeViewModel extends GetxController {
  // 홈 스크롤 컨트롤러
  final ScrollController scrollController = ScrollController();

  // 위치 정보, 시구동 정보, 로딩 여부 변수
  final GeolocatorService _geolocatorService = GeolocatorService();
  // 시구동 정보를 받아오는 서비스
  final SiGuDongService _siGuDong = SiGuDongService();
  var pathOverlays = Rx<Set<PathOverlay>>({});

  // 현재 위치, 시구동 정보, 로딩 여부 변수
  GeoLocation? _currentLocation;
  SiGuDongModel? _sigudongData;
  bool _isLoading = false;

  HomeViewModel() {
    loadCurrentLocation();
  }
  // 현재 위치 업데이트 함수
  void updatePathOverlays(List<Location> locations) {
    Set<PathOverlay> newOverlays = createPathOverlays(locations);
    pathOverlays.value = newOverlays; // Update the Rx variable
  }

  // 현재 위치, 시구동 정보, 로딩 여부 변수의 getter
  GeoLocation? get currentLocation => _currentLocation;
  SiGuDongModel? get sigudongData => _sigudongData;
  bool get isLoading => _isLoading;

  // 홈 스크롤 컨트롤러 초기화
  void initScrollListener(CourseController courseController) {
    scrollController.addListener(() {
      if (courseController.course.value?.courses.isNotEmpty ?? false) {
        int mostVisibleIndex = getMostVisibleCardIndex(
            courseController.course.value!.courses.length);
        Course mostVisibleCourse =
            courseController.course.value!.courses[mostVisibleIndex];
        updatePathOverlays(mostVisibleCourse.locations);
      }
    });
  }

// 가장 많이 보이는 카드의 인덱스를 반환하는 함수
  int getMostVisibleCardIndex(int itemCount) {
    double cardWidth = 320.0;
    double currentScroll = scrollController.offset;
    int index = (currentScroll / cardWidth).round();
    return index.clamp(0, itemCount - 1);
  }

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
        _sigudongData = await _siGuDong.fetchData(
          _currentLocation!.latitude,
          _currentLocation!.longitude,
        );
        update();
      } catch (e) {
        // Handle exceptions
      }
    }
  }

  // 홈 스크롤 컨트롤러 초기화
  @override
  void onInit() {
    super.onInit();
    final courseController = Get.put(CourseController());
    initScrollListener(courseController);
  }

// 홈 스크롤 컨트롤러 종료
  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
