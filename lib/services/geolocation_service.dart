import 'package:geolocator/geolocator.dart';
import 'package:naemansan/models/geolocation_model.dart';

class GeolocatorService {
  // 현재 위치를 받아오는 함수
  Future<GeoLocation> getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('위치 권한이 없습니다.');
      }
      // 현재 위치를 받아서 GeoLocation 객체를 만듬
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      // 위도, 경도 반환
      return GeoLocation.fromPosition(position);
    } catch (e) {
      // Handle exceptions
      rethrow;
    }
  }
}
