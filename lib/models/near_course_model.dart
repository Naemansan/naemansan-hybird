import 'dart:async';

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
  final String title;
  final String siGuDong;
  final String distance;
  final List<Keyword> keywords;
  final List<Location> locations;

  Course({
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
      title: json['title'],
      siGuDong: json['siGuDong'],
      distance: json['distance'],
      keywords: keywordsJson.map((k) => Keyword.fromJson(k)).toList(),
      locations: locationsJson.map((l) => Location.fromJson(l)).toList(),
    );
  }
}

class Keyword {
  final String keyword;

  Keyword({required this.keyword});

  factory Keyword.fromJson(Map<String, dynamic> json) {
    return Keyword(
      keyword: json['keyword'],
    );
  }
}

// ㅇㅜㅣㅊㅣ
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
