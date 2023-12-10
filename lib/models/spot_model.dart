// ignore_for_file: non_constant_identifier_names

class SpotModel {
  final int id;
  final String title;
  final String content;
  final String? thumbnail_url;

  final int course_id;
  final String category;

  SpotModel({
    required this.id,
    required this.title,
    required this.content,
    required this.course_id,
    required this.category,
    this.thumbnail_url,
  });
}
