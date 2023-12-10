class Tag {
  final int id;
  final String tag;

  Tag({required this.id, required this.tag});

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      id: json['id'],
      tag: json['tag'],
    );
  }
}
