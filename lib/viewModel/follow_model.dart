class Follow {
  String userId;
  String nickname;
  String introduction;
  String profileImageUrl;

  Follow({
    required this.userId,
    required this.nickname,
    required this.introduction,
    required this.profileImageUrl,
  });

  factory Follow.fromJson(Map<String, dynamic> json) {
    return Follow(
        userId: json['userId'],
        nickname: json['nickname'],
        introduction: json['introduction'],
        profileImageUrl: json['profileImageUrl']);
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'nickname': nickname,
      'introduction': introduction,
      'profileImageUrl': profileImageUrl,
    };
  }
}
