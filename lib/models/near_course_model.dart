import 'dart:async';

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
  final List<Keyword> keywords;
  final List<Location> locations;

  Course({
    required this.id,
    required this.title,
    required this.siGuDong,
    required this.distance,
    required this.keywords,
    required this.locations,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    var keywordsJson = json['keywords'] as List;
    var locationsJson = json['locations'] as List;

    return Course(
      id: json['id'],
      title: json['title'],
      siGuDong: json['siGuDong'],
      distance: json['distance'],
      keywords: keywordsJson.map((k) => Keyword.fromJson(k)).toList(),
      locations: locationsJson.map((l) => Location.fromJson(l)).toList(),
    );
  }
  // toLatLng
  // Location 객체를 LatLng 객체로 변환하는 함수
  List<LatLng> toLatLng() {
    return locations.map((l) => LatLng(l.latitude, l.longitude)).toList();
  }
}

class Keyword {
  final int id;
  final String keyword;

  Keyword({required this.id, required this.keyword});

  factory Keyword.fromJson(Map<String, dynamic> json) {
    return Keyword(
      id: json['id'],
      keyword: json['keyword'],
    );
  }
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
