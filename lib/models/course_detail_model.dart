import 'package:naemansan/models/course_overview_model.dart';
import 'package:naemansan/models/keyword_model.dart';
import 'package:naemansan/models/moment_model.dart';

import 'package:naemansan/models/spot_model.dart';

class CourseDetailModel {
  final int id;

  final String title;
  final String siGuDong;
  final String distance;
  final List<KeywordModel> keywords;

  final String descriptionCourseOverview;

  final String date;

  final int writerId;
  final String writerName;

  final int momentCount;
  final int likeCount;

  final List<MomentModel> momentList;
  final List<SpotModel> spotList;
  final List<CourseOverviewModel> similarCourseList;

  CourseDetailModel(
      {required this.id,
      required this.title,
      required this.siGuDong,
      required this.distance,
      required this.keywords,
      required this.descriptionCourseOverview,
      required this.date,
      required this.writerId,
      required this.writerName,
      required this.momentCount,
      required this.likeCount,
      required this.momentList,
      required this.spotList,
      required this.similarCourseList});
}
