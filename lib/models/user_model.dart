import 'package:naemansan/models/tag_model.dart';

class User {
  bool isLoggedIn;
  String deviceToken;
  String nickname;
  String bio;
  List<Tag> tags;
  String profileImageUrl;
  List<String> following; // 팔로잉 사용자 ID 목록
  List<String> follower; // 팔로워 사용자 ID 목록

  User({
    required this.isLoggedIn,
    required this.deviceToken,
    required this.nickname,
    required this.bio,
    required this.tags,
    required this.profileImageUrl,
    required this.following,
    required this.follower,
  });

  // JSON에서 User 객체로 변환하는 팩토리 생성자
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      isLoggedIn: json['isLoggedIn'] ?? false,
      deviceToken: json['deviceToken'] ?? '',
      nickname: json['nickname'] ?? '',
      bio: json['bio'] ?? '',
      tags: List<Tag>.from(json['tags']),
      profileImageUrl: json['profileImageUrl'] ?? '',
      following: List<String>.from(json['following'] ?? []),
      follower: List<String>.from(json['follower'] ?? []),
    );
  }

  // User 객체를 JSON으로 변환하는 메소드
  Map<String, dynamic> toJson() {
    return {
      'isLoggedIn': isLoggedIn,
      'deviceToken': deviceToken,
      'nickname': nickname,
      'bio': bio,
      'tags': tags,
      'profileImageUrl': profileImageUrl,
      'following': following,
      'follower': follower,
    };
  }
}
