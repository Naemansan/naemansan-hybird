import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:naemansan/models/si_gu_dong_model.dart';

class SiGuDongService {
  // 시구동 정보를 받아오는 함수
  Future<SiGuDongModel> fetchData(double lat, double lon) async {
    // 환경 변수를 불러옴
    await dotenv.load(fileName: "assets/config/.env");

    // 헤더 설정
    Map<String, String> headers = {
      "X-NCP-APIGW-API-KEY-ID": dotenv.env['NAVER_MAP_ID']!,
      "X-NCP-APIGW-API-KEY": dotenv.env['NAVER_MAP_KEY']!,
    };

    // 요청 주소
    final uri = Uri.parse(
        "https://naveropenapi.apigw.ntruss.com/map-reversegeocode/v2/gc?request=coordsToaddr&coords=$lon,$lat&sourcecrs=epsg:4326&output=json");

    // 응답 받은 데이터를 SiguDongModel 객체로 만듬
    final response = await http.get(uri, headers: headers);

    // 만약 200 OK가 아니면 에러를 던짐
    if (response.statusCode == 200) {
      return SiGuDongModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('데이터 로드 실패');
    }
  }
}
