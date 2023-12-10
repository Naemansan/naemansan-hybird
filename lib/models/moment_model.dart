// ignore_for_file: non_constant_identifier_names

class MomentModel {
  final int id;

  final String content;
  final String emotion;
  final String weather;

  final int course_id;
  final String user_id;

  final String created_at;

  MomentModel(
      {required this.id,
      required this.content,
      required this.weather,
      required this.emotion,
      required this.course_id,
      required this.user_id,
      required this.created_at});
}
