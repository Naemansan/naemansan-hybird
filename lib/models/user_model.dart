import 'package:naemansan/models/near_course_model.dart';

class User {
  bool isLoggedIn;
  String deviceToken;
  String nickname;
  String bio;
  Keyword keywords;
  String profileImageUrl;
  List<String> following; // 팔로잉 사용자 ID 목록
  List<String> followers; // 팔로워 사용자 ID 목록

  User({
    required this.isLoggedIn,
    required this.deviceToken,
    required this.nickname,
    required this.bio,
    required this.keywords,
    required this.profileImageUrl,
    required this.following,
    required this.followers,
  });

  // JSON에서 User 객체로 변환하는 팩토리 생성자
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      isLoggedIn: json['isLoggedIn'] ?? false,
      deviceToken: json['deviceToken'] ?? '',
      nickname: json['nickname'] ?? '',
      bio: json['bio'] ?? '',
      keywords: Keyword.fromJson(json['keywords']),
      profileImageUrl: json['profileImageUrl'] ?? '',
      following: List<String>.from(json['following'] ?? []),
      followers: List<String>.from(json['followers'] ?? []),
    );
  }

  // User 객체를 JSON으로 변환하는 메소드
  Map<String, dynamic> toJson() {
    return {
      'isLoggedIn': isLoggedIn,
      'deviceToken': deviceToken,
      'nickname': nickname,
      'bio': bio,
      'keywords': keywords,
      'profileImageUrl': profileImageUrl,
      'following': following,
      'followers': followers,
    };
  }
}
