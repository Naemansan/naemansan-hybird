class SimilarCourse {
  final int id;
  final String title;
  final String startLocationName;
  final String distance;
  final List<String> tags;

  SimilarCourse(
      {required this.id,
      required this.title,
      required this.startLocationName,
      required this.distance,
      required this.tags});
}
