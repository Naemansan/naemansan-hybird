import 'package:naemansan/models/course_detail_model.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';

class WalkingSingleSpotModel {
  final String title;
  final String content;
  final Location location;
  final String category;
  Marker marker;
  // final ImageState? imageState;

  WalkingSingleSpotModel({
    required this.title,
    required this.content,
    required this.location,
    required this.category,
    Marker? marker, // Marker 매개변수를 옵션으로 만듭니다.
  }) : marker = marker ??
            Marker(
              // 기본값 설정
              markerId: '',
              position: const LatLng(0, 0),
            );
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
