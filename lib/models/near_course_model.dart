import 'package:naver_map_plugin/naver_map_plugin.dart';

class NearCourseListModel {
  final List<Course> courses;

  NearCourseListModel({required this.courses});

  factory NearCourseListModel.fromJson(List<Map<String, dynamic>> json) {
    final List<Course> coursesList =
        json.map((courseJson) => Course.fromJson(courseJson)).toList();
    return NearCourseListModel(courses: coursesList);
  }
}

class Course {
  final int id;
  final String title;
  final String siGuDong;
  final String distance;
  final List<Tag> tags;
  final List<Location> locations;

  Course({
    required this.id,
    required this.title,
    required this.siGuDong,
    required this.distance,
    required this.tags,
    required this.locations,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    var tagsJson = json['tags'] as List;
    var locationsJson = json['locations'] as List;

    return Course(
      id: json['id'],
      title: json['title'],
      siGuDong: json['siGuDong'],
      distance: json['distance'],
      tags: tagsJson.map((k) => Tag.fromJson(k)).toList(),
      locations: locationsJson.map((l) => Location.fromJson(l)).toList(),
    );
  }
  // toLatLng
  // Location 객체를 cccs
  List<LatLng> toLatLng() {
    return locations.map((l) => LatLng(l.latitude, l.longitude)).toList();
  }
}

class Tag {
  final int id;
  final String tag;

  Tag({required this.id, required this.tag});

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      id: json['id'],
      tag: json['tag'],
    );
  }

// tag 10개
// 1. 일상속 여유
// 2. 평온한 힐링
// 3. 자연과 함께
// 4. 활기찬 분위기
// 5. 감성충만
// 6. 도심풍경
// 7. 새로운 모험
// 8.고즈넉한 무드
// 9. 강길을 따라
// 10. 일상의 재발견
// full Tag List
}

class Location {
  final double latitude;
  final double longitude;

  Location({required this.latitude, required this.longitude});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }
}
