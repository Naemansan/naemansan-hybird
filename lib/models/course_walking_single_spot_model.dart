import 'package:naemansan/models/course_detail_model.dart';

class WalkingSingleSpotModel {
  final String title;
  final String content;
  final Location location;
  final String category;
  // final ImageState? imageState;

  WalkingSingleSpotModel({
    required this.title,
    required this.content,
    required this.location,
    required this.category,
  });
  @override
  String toString() =>
      'WalkingSingleSpotModel(title: $title, content: $content, location: $location, category: $category)';
}
// class ImageState {
//   final String? type;
//   final bool? isUsed;

//   ImageState({this.type, this.isUsed});

//   factory ImageState.fromJson(Map<String, dynamic> json) {
//     return ImageState(
//       type: json['type'],
//       isUsed: json['isUsed'],
//     );
//   }
//   @override
//   String toString() => 'ImageState(type: $type, isUsed: $isUsed)';
// }
