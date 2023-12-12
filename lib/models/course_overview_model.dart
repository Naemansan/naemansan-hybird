class CourseOverview {
  final int id;

  final bool isEnrolled;

  final String title;
  final String siGuDong; //start_location_name

  final String distance;

  final List<String> tags;

  final int momentCount;
  final int likeCount;

  CourseOverview(
      {required this.id,
      required this.isEnrolled,
      required this.title,
      required this.siGuDong,
      required this.distance,
      required this.tags,
      required this.momentCount,
      required this.likeCount});
}
