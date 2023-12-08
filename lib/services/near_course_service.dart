import 'dart:async';
import 'package:naemansan/models/near_course_model.dart';

class NearCourseService {
  Future<NearCourseListModel> fetchNearCourses() async {
    // 더미 JSON 데이터를 리스트로 정의합니다.
    final Map<String, dynamic> dummyData = {
      "courses": [
        {
          "title": "산책로 1",
          "siGuDong": "경기도 화성시 동탄반석로",
          "distance": "2,347m",
          "keywords": [
            {"keyword": "#1"},
            {"keyword": "#2"}
          ],
          "locations": [
            {"latitude": 37.123, "longitude": 127.123},
            {"latitude": 37.123, "longitude": 127.123}
          ]
        },
        {
          "title": "산책로 2",
          "siGuDong": "경기도 화성시 동탄반석로",
          "distance": "2,347m",
          "keywords": [
            {"keyword": "#1"},
            {"keyword": "#2"}
          ],
          "locations": [
            {"latitude": 37.123, "longitude": 127.123},
            {"latitude": 37.123, "longitude": 127.123}
          ]
        },
        {
          "title": "산책로 3",
          "siGuDong": "경기도 화성시 동탄반석로",
          "distance": "2,347m",
          "keywords": [
            {"keyword": "#1"},
            {"keyword": "#2"}
          ],
          "locations": [
            {"latitude": 37.123, "longitude": 127.123},
            {"latitude": 37.123, "longitude": 127.123}
          ]
        },
      ]
    };
    // 더미데이터중 courses를 가져옴
    final List<dynamic> coursesData = dummyData['courses'];

    // 더미 데이터를 NearCourseListModel로 변환합니다.
    final List<NearCourseListModel> nearCourseList =
        coursesData.map((data) => NearCourseListModel.fromJson(data)).toList();

    // 2초 뒤에 데이터를 반환, 실제로는 서버에서 데이터를 받아오는 시간 대신해서
    await Future.delayed(const Duration(seconds: 2));

    // 실제 데이터 반환
    return nearCourseList[0];
  }
}
