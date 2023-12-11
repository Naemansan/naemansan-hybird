//사용자 정보
// ignore_for_file: non_constant_identifier_names

import 'package:naemansan/models/tag_model.dart';

class UserInfo {
  String uuid;

  String nickname;
  String introduction;
  List<Tag> tags;
  String profile_image_url;

  UserInfo({
    required this.uuid,
    required this.nickname,
    required this.introduction,
    required this.tags,
    required this.profile_image_url,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      uuid: json['uuid'] ?? '',
      nickname: json['nickname'] ?? '',
      introduction: json['introduction'] ?? '',
      tags: List<Tag>.from(json['tags']),
      profile_image_url: json['profile_image_url'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'nickname': nickname,
      'introduction': introduction,
      'tags': tags,
      'profile_image_url': profile_image_url,
    };
  }
}
