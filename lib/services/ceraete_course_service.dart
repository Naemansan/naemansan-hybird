import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:naemansan/models/create_course/similar_walk_model.dart';
import 'package:naemansan/models/spot_model.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';

class CreateCourseService {
  Dio dio;

  CreateCourseService()
      : dio = Dio(BaseOptions(
          baseUrl: '${dotenv.env['SERVER_HOST']}',
          connectTimeout: const Duration(milliseconds: 5000),
          receiveTimeout: const Duration(milliseconds: 3000),
        ));

  Future<SimilarWalkModel> checkSimilarity(
      List<LatLng> latLngList, bool isPersonal) async {
    try {
      var response = await dio.post(
        '/api/v1/similarity?isPersonal=$isPersonal',
        data: {
          "locations": latLngList
              .map((e) => {"latitude": e.latitude, "longitude": e.longitude})
              .toList(),
        },
        options: Options(
          headers: {"Content-Type": "application/json"},
        ),
      );

      if (response.statusCode == 200) {
        print("🚀 유사도 검사 결과 통신 성공");
        print(response.data);
        return SimilarWalkModel.fromJson(response.data);
      } else {
        throw Exception('Server error: ${response.data}');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  Future<void> publishCourse(List<LatLng> latLngList, List<Spot> spots,
      String title, String content, List<int> tagIds) async {
    try {
      var response = await dio.post(
        '/api/v1/courses',
        data: {
          "title": title,
          "content": content,
          "tagIds": tagIds,
          "locations": latLngList
              .map((e) => {"latitude": e.latitude, "longitude": e.longitude})
              .toList(),
          "spots": spots
              .map((spot) => {
                    "name": spot.title,
                    "description": spot.content,
                    "location": {
                      "latitude": spot.location.latitude,
                      "longitude": spot.location.longitude
                    },
                    "category": spot.category,
                  })
              .toList(),
        },
        options: Options(
          headers: {"Content-Type": "application/json"},
        ),
      );

      if (response.statusCode != 200) {
        throw Exception('Server error: ${response.data}');
      }
      print("🚀 산책록 등록 결과 통신 성공");
      print(response.data);
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }
}
