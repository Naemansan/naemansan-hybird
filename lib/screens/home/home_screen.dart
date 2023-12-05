import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // map type 설정
  final MapType _mapType = MapType.Basic;
  // 현재 위치
  LatLng? _currentLocation;
// 지도 컨트롤러
  NaverMapController? _mapController;
  // path overlay
  final Set<PathOverlay> _pathOverlays = {};

  void _updateCurrentLocation(double latitude, double longitude) {
    _currentLocation = LatLng(latitude, longitude);
    print('현재 위치: $_currentLocation');
  }

  // 현재위치 가져오기
  void getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return;
      }
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      setState(() {
        _updateCurrentLocation(position.latitude, position.longitude);
      });
    } catch (e) {
      // print('위치 정보를 가져오는 중에 오류가 발생했습니다: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: NaverMap(
                // onMapCreated: onMapCreated,
                mapType: _mapType,
                // initLocationTrackingMode: LocationTrackingMode.Face,
                locationButtonEnable: true,
                pathOverlays: _pathOverlays,
                initialCameraPosition: CameraPosition(
                  target:
                      _currentLocation ?? const LatLng(37.3595704, 127.105399),
                  zoom: 16,
                )),
          )
        ],

        // naver map
      ),
    );
  }
}
