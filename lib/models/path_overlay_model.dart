import 'package:flutter/material.dart';
import 'package:naemansan/utilities/style/color_styles.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';

class PathOverlayModel {
  final String id;
  final List<LatLng> points;
  final int width;
  final Color color;
  final Color outlineColor;

  PathOverlayModel({
    required this.id,
    required this.points,
    this.width = 12,
    this.color = ColorStyles.main2, // Default color, can be changed as needed
    this.outlineColor = Colors.transparent,
  });

// 팩토리 생성자를 이용하여 json 데이터를 PathOverlayModel로 변환
  factory PathOverlayModel.fromJson(Map<String, dynamic> json) {
    var pointsJson = json['points'] as List;
    List<LatLng> points = pointsJson.map((point) {
      return LatLng(point['latitude'], point['longitude']);
    }).toList();

    return PathOverlayModel(
      id: json['id'] ?? 'default_id',
      points: points,
      width: 12,
      color: ColorStyles.main2,
      outlineColor: Colors.transparent,
    );
  }

  // 패스 오버레이를 생성하는 함수
  PathOverlay toPathOverlay() {
    return PathOverlay(
      PathOverlayId(id),
      points,
      width: width,
      color: color,
      outlineColor: outlineColor,
    );
  }
}
