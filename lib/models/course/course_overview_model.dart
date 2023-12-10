// ignore_for_file: non_constant_identifier_names

import 'package:naemansan/models/tag_model.dart';

class CourseOverviewModel {
  final int id;

  final bool isEnrolled;

  final String title;

  final String siGuDong; //start_location_name

  final int distance;

  final List<Tag> tags;

  final int moment_cnt;
  final int like_cnt;

  CourseOverviewModel(
      {required this.id,
      required this.isEnrolled,
      required this.title,
      required this.siGuDong,
      required this.distance,
      required this.tags,
      required this.moment_cnt,
      required this.like_cnt});
}
