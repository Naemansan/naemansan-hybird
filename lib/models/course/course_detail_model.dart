// ignore_for_file: non_constant_identifier_names

import 'package:naemansan/models/course/course_overview_model.dart';

import 'package:naemansan/models/moment_model.dart';

import 'package:naemansan/models/spot_model.dart';
import 'package:naemansan/models/tag_model.dart';

class CourseDetailModel {
  final int id;

  final String title;
  final String content;

  final String siGuDong; //start_location_name

  final int distance;

  final List<Tag> tags;

  final String created_at;

  final String user_id;

  final int like_cnt;

  final List<MomentModel> moments;
  final List<SpotModel> spots;
  final List<CourseOverviewModel> similarCourses;

  CourseDetailModel(
      {required this.id,
      required this.title,
      required this.content,
      required this.siGuDong,
      required this.distance,
      required this.tags,
      required this.created_at,
      required this.user_id,
      required this.like_cnt,
      required this.moments,
      required this.spots,
      required this.similarCourses});
}
