class UserProfileModel {
  final String name;
  final String description;
  final List<String> tags;

  final String followingCount;
  final String followerCount;

  UserProfileModel(
    this.name,
    this.description,
    this.tags,
    this.followingCount,
    this.followerCount,
  );
}
