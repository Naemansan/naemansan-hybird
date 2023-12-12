class CourseDetail {
  final int id;
  final String title;
  final String content;
  final String siGuDong; //back siDongGu;

  final List<Location> locations;

  final List<String> tags;

  final String distance;
  final String createdAt;

  final String userId;
  final String userNickName;
  final String? userProfileImageUrl;

  CourseDetail({
    required this.id,
    required this.title,
    required this.content,
    required this.siGuDong,
    required this.locations,
    required this.tags,
    required this.distance,
    required this.createdAt,
    required this.userId,
    required this.userNickName,
    this.userProfileImageUrl,
  });
}

class Location {
  final double latitude;
  final double longitude;

  Location({required this.latitude, required this.longitude});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }
  @override
  String toString() => 'Location(latitude: $latitude, longitude: $longitude)';
}
