import 'package:geolocator/geolocator.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';

class GeoLocation {
  // 위도, 경도
  final double latitude;
  final double longitude;

  GeoLocation({required this.latitude, required this.longitude});

  // 위치 정보를 받아서 GeoLocation 객체를 만듬
  factory GeoLocation.fromPosition(Position position) {
    return GeoLocation(
      latitude: position.latitude,
      longitude: position.longitude,
    );
  }

  // 문자열 출력
  @override
  String toString() =>
      'GeoLocation(Latitude: $latitude, Longitude: $longitude)';

  // LatLng 객체로 변환
  LatLng toLatLng() => LatLng(latitude, longitude);
}
