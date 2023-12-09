class MomentModel {
  final int id;

  final String date;
  final String year;

  final String weather;
  final String emotion;

  final int courseId;
  final String courseTitle;

  final int userId;
  final String userName;

  final String content;

  MomentModel(
      {required this.id,
      required this.date,
      required this.year,
      required this.weather,
      required this.emotion,
      required this.courseId,
      required this.courseTitle,
      required this.userId,
      required this.userName,
      required this.content});

  factory MomentModel.fromJson(Map<String, dynamic> json) {
    return MomentModel(
        id: json['id'],
        date: json['date'],
        year: json['year'],
        weather: json['weather'],
        emotion: json['emotion'],
        courseId: json['courseId'],
        courseTitle: json['courseTtile'],
        userId: json['userId'],
        userName: json['userName'],
        content: json['content']);
  }
}
