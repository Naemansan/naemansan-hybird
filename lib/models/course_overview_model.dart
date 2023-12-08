import 'package:naemansan/models/keyword_model.dart';

class CourseOverviewModel {
  final int id;
  final String title;
  final String siGuDong;
  final String distance;
  final List<KeywordModel> keywords;

  final String momentCount;
  final String likeCount;

  CourseOverviewModel(
      {required this.id,
      required this.title,
      required this.siGuDong,
      required this.distance,
      required this.keywords,
      required this.momentCount,
      required this.likeCount});

  factory CourseOverviewModel.fromJson(Map<String, dynamic> json) {
    var keywordsJson = json['keywords'] as List;

    return CourseOverviewModel(
        id: json['id'],
        title: json['title'],
        siGuDong: json['siGuDong'],
        distance: json['distance'],
        keywords: keywordsJson
            .map((element) => KeywordModel.fromJson(element))
            .toList(),
        momentCount: json['momentCount'],
        likeCount: json['likeCount']);
  }
}
