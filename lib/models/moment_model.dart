// ignore_for_file: non_constant_identifier_names

class Moment {
  final int id;
  final int courseId;
  final String courseTitle;

  final String nickname;

  final String content;
  final String createdAt;

  final String emotion;
  final String weather;

  Moment(
      {required this.id,
      required this.courseId,
      required this.courseTitle,
      required this.nickname,
      required this.content,
      required this.createdAt,
      required this.emotion,
      required this.weather});
}
