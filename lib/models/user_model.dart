// ignore_for_file: non_constant_identifier_names

import 'package:naemansan/models/tag_model.dart';

class User {
  String uuid;

  bool isLoggedIn; //로그인 여부
  String deviceToken;

  //userinfo랑 중복됨
  List<Tag> tags;

  List<String> following; // 팔로잉 사용자 ID 목록
  List<String> follower; // 팔로워 사용자 ID 목록

  User({
    required this.uuid,
    required this.isLoggedIn,
    required this.deviceToken,
    required this.tags,
    required this.following,
    required this.follower,
  });

  // JSON에서 User 객체로 변환하는 팩토리 생성자
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      uuid: json['uuid'] ?? '',
      isLoggedIn: json['isLoggedIn'] ?? false,
      deviceToken: json['deviceToken'] ?? '',
      tags: List<Tag>.from(json['tags']),
      following: List<String>.from(json['following'] ?? []),
      follower: List<String>.from(json['follower'] ?? []),
    );
  }

  // User 객체를 JSON으로 변환하는 메소드
  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'isLoggedIn': isLoggedIn,
      'deviceToken': deviceToken,
      'tags': tags,
      'following': following,
      'follower': follower,
    };
  }
}
