class TagModel {
  final int id;
  final String tag;

  TagModel({required this.id, required this.tag});

  factory TagModel.fromJson(Map<String, dynamic> json) {
    return TagModel(
      id: json['id'],
      tag: json['tag'],
    );
  }
}
