class TrailDetailModel {
  final String name;
  final String location;
  final String distance;

  final String description;

  final List<String> tags;

  final String writer;
  final String date;

  TrailDetailModel(this.name, this.location, this.distance, this.tags,
      this.description, this.writer, this.date);
}
