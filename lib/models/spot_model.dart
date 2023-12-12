// ignore_for_file: non_constant_identifier_names

import 'package:naemansan/models/course_detail_model.dart';

class Spot {
  final int id;

  final String title;
  final String content;

  final Location location;

  final String category;

  final String? thumbnailurl;

  Spot({
    required this.id,
    required this.title,
    required this.content,
    required this.location,
    required this.category,
    this.thumbnailurl,
  });
  @override
  String toString() {
    return 'Spot(id: $id, title: $title, content: $content, location: $location, category: $category, thumbnailurl: $thumbnailurl)';
  }
}
