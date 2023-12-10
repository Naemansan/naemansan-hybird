// ignore_for_file: non_constant_identifier_names

import 'package:naemansan/models/tag_model.dart';

class User {
  bool isLoggedIn; //로그인 여부
  String deviceToken;

  String uuid;

  String nickname;
  String introduction;
  List<Tag> tags;
  String profile_image_url;
  List<String> following; // 팔로잉 사용자 ID 목록
  List<String> follower; // 팔로워 사용자 ID 목록

  User({
    required this.isLoggedIn,
    required this.deviceToken,
    required this.uuid,
    required this.nickname,
    required this.introduction,
    required this.tags,
    required this.profile_image_url,
    required this.following,
    required this.follower,
  });

  // JSON에서 User 객체로 변환하는 팩토리 생성자
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      isLoggedIn: json['isLoggedIn'] ?? false,
      deviceToken: json['deviceToken'] ?? '',
      uuid: json['uuid'] ?? '',
      nickname: json['nickname'] ?? '',
      introduction: json['introduction'] ?? '',
      tags: List<Tag>.from(json['tags']),
      profile_image_url: json['profile_image_url'] ?? '',
      following: List<String>.from(json['following'] ?? []),
      follower: List<String>.from(json['follower'] ?? []),
    );
  }

  // User 객체를 JSON으로 변환하는 메소드
  Map<String, dynamic> toJson() {
    return {
      'isLoggedIn': isLoggedIn,
      'deviceToken': deviceToken,
      'uuid': uuid,
      'nickname': nickname,
      'introduction': introduction,
      'tags': tags,
      'profile_image_url': profile_image_url,
      'following': following,
      'follower': follower,
    };
  }
}
