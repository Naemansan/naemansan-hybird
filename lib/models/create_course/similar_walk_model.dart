import 'package:naemansan/models/tag_model.dart';

class SimilarWalkModel {
  bool success;
  List<WalkData> data;
  dynamic error;

  SimilarWalkModel({required this.success, required this.data, this.error});

  factory SimilarWalkModel.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<WalkData> walkDataList =
        list.map((i) => WalkData.fromJson(i)).toList();

    return SimilarWalkModel(
      success: json['success'],
      data: walkDataList,
      error: json['error'],
    );
  }
  @override
  String toString() {
    return 'SimilarWalkModel{success: $success, data: $data, error: $error}';
  }
}

class WalkData {
  int id;
  String title;
  String startLocationName;
  String distance;
  List<Tag> tags;

  WalkData(
      {required this.id,
      required this.title,
      required this.startLocationName,
      required this.distance,
      required this.tags});

  factory WalkData.fromJson(Map<String, dynamic> json) {
    var tagsList = json['tags'] as List;
    List<Tag> tagsData = tagsList.map((i) => Tag.fromJson(i)).toList();

    return WalkData(
      id: json['id'],
      title: json['title'],
      startLocationName: json['startLocationName'],
      distance: json['distance'],
      tags: tagsData,
    );
  }
}
