import 'package:naemansan/models/tag_model.dart';

class CourseOverviewModel {
  final int id;
  final String title;
  final String siGuDong;
  final String distance;
  final List<TagModel> tags;

  final int momentCount;
  final int likeCount;

  final bool isPublished;

  CourseOverviewModel({
    required this.id,
    required this.title,
    required this.siGuDong,
    required this.distance,
    required this.tags,
    required this.momentCount,
    required this.likeCount,
    required this.isPublished,
  });

  factory CourseOverviewModel.fromJson(Map<String, dynamic> json) {
    var tagsJson = json['tags'] as List;

    return CourseOverviewModel(
        id: json['id'],
        title: json['title'],
        siGuDong: json['siGuDong'],
        distance: json['distance'],
        tags: tagsJson.map((element) => TagModel.fromJson(element)).toList(),
        momentCount: json['momentCount'],
        likeCount: json['likeCount'],
        isPublished: true);
  }
}
