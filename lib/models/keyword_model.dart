class KeywordModel {
  final int id;
  final String keyword;

  KeywordModel({required this.id, required this.keyword});

  factory KeywordModel.fromJson(Map<String, dynamic> json) {
    return KeywordModel(
      id: json['id'],
      keyword: json['keyword'],
    );
  }
}
