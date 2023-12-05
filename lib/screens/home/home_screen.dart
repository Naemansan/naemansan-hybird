import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:naemansan/utilities/style/color_styles.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final MapType _mapType = MapType.Basic;
  LatLng? _currentLocation;
  NaverMapController? _mapController;
  //
  final Set<PathOverlay> _pathOverlays = {
    PathOverlay(
      PathOverlayId('1'),
      [
        // 임시데이터
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
    )
  };

  late List<Map<String, dynamic>> courseData;

  bool _isLoading = true; // Added loading state variable

  void _updateCurrentLocation(double latitude, double longitude) {
    _currentLocation = LatLng(latitude, longitude);
    print('현재 위치: $_currentLocation');
  }

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
        _isLoading = false; // Update loading state
      });
    } catch (e) {
      // Handle error or set loading state to false
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
    courseData = [
      {
        'title': '코스1',
        'location': '서울특별시 성북구 정릉동 1-1',
        'pathOverlays': _pathOverlays.elementAt(0), // Corrected access
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator()) // Loading indicator
          : Column(
              children: [
                Expanded(
                  child: NaverMap(
                    scrollGestureEnable: false,
                    zoomGestureEnable: false,
                    mapType: _mapType,
                    pathOverlays: _pathOverlays,
                    initialCameraPosition: CameraPosition(
                      target: _currentLocation ??
                          const LatLng(37.3595704, 127.105399),
                      zoom: 17,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
