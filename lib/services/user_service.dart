import 'package:naemansan/models/tag_model.dart';
import 'package:naemansan/models/user_model.dart';

class UserService {
  // 사용자 더미 데이터를 제공하는 메소드
  User getDummyUser() {
    return User(
      isLoggedIn: false,
      deviceToken: 'dummyDeviceToken123',
      uuid: "user1",
      nickname: '서찬',
      introduction: '킹갓산책러버',
      tags: [Tag(id: 1, tag: '#산책')],
      profile_image_url:
          'https://static.vecteezy.com/system/resources/previews/005/544/718/non_2x/profile-icon-design-free-vector.jpg',
      following: ['user2', 'user3'],
      follower: ['user4', 'user5', 'user6'],
    );
  }
}
