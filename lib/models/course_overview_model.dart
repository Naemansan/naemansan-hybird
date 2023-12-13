import 'package:naemansan/models/course_detail_model.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';

class CourseOverview {
  final int id;

  final bool isEnrolled;

  final String title;
  final String siGuDong; //start_location_name

  final String distance;

  final List<String> tags;

  final int momentCount;
  final int likeCount;
  final List<LatLng> locations;

  CourseOverview(
      {required this.id,
      required this.isEnrolled,
      required this.title,
      required this.siGuDong,
      required this.distance,
      required this.tags,
      required this.momentCount,
      required this.likeCount,
      required this.locations});
}
