import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:naemansan/models/create_course/similar_walk_model.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';

class SimilarityService {
  Dio dio;

  SimilarityService()
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
        return SimilarWalkModel.fromJson(response.data);
      } else {
        throw Exception('Server error: ${response.data}');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }
}
