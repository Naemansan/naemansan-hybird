class TrailCardModel {
  final String name;
  final String location;
  final String distance;

  final List<String> tags;
  final String momentCount;
  final String likeCount;

  TrailCardModel(this.name, this.location, this.distance, this.tags,
      this.momentCount, this.likeCount);
}
