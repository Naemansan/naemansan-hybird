import 'dart:convert';

import 'package:naemansan/models/tag_model.dart';
import 'package:naemansan/models/user_info_model.dart';
import 'package:naemansan/models/user_model.dart';
import 'package:naemansan/viewModel/follow_model.dart';

class UserService {
  // 사용자 더미 데이터를 제공하는 메소드
  User getDummyUser() {
    return User(
      isLoggedIn: false,
      deviceToken: 'dummyDeviceToken123',
      uuid: "user1",
      tags: [Tag(id: 1, tag: '산책')],
      following: ['user2', 'user3'],
      follower: ['user4', 'user5', 'user6'],
    );
  }

  UserInfo getDummyUserInfo() {
    return UserInfo(
        uuid: "user1",
        nickname: "서찬",
        introduction: "킹갓산책러버",
        tags: [Tag(id: 1, tag: '산책')],
        profile_image_url:
            'https://static.vecteezy.com/system/resources/previews/005/544/718/non_2x/profile-icon-design-free-vector.jpg');
  }

  List<Follow> getDummyFollowing() {
    return [
      Follow(
          userId: "서현",
          nickname: "서현",
          introduction: "안녕하세요?",
          profileImageUrl: "user2"),
      Follow(
          userId: "user3",
          nickname: "kpaas",
          introduction: "오픈클라우드 플랫폼",
          profileImageUrl: "user3"),
    ];
  }

  List<Follow> getDummyFollower() {
    return [
      Follow(
          userId: "user2",
          nickname: "user2",
          introduction: "user2의 자기소개",
          profileImageUrl: "user2"),
      Follow(
          userId: "user3",
          nickname: "user3",
          introduction: "user3의 자기소개",
          profileImageUrl: "user3"),
    ];
  }

  UserInfo getDummyOtherUserInfo(String uuid) {
    switch (uuid) {
      case "user3":
        return UserInfo(
            uuid: "user1",
            nickname: "이름...",
            introduction: "킹갓산책러버",
            tags: [Tag(id: 1, tag: '#산책')],
            profile_image_url:
                'https://static.vecteezy.com/system/resources/previews/005/544/718/non_2x/profile-icon-design-free-vector.jpg');

      default:
        return UserInfo(
            uuid: "user1",
            nickname: "서찬",
            introduction: "킹갓산책러버",
            tags: [Tag(id: 1, tag: '#산책')],
            profile_image_url:
                'https://static.vecteezy.com/system/resources/previews/005/544/718/non_2x/profile-icon-design-free-vector.jpg');
    }
  }
}
