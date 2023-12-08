import 'package:get/get.dart';
import 'package:naemansan/models/trail_detail_model.dart';

class TrailDetailViewModel extends GetxController {
  late TrailDetailModel _trailDetailInfo;
  TrailDetailViewModel() {
    _trailDetailInfo = TrailDetailModel("산책로", "경기도 화성시 동탄반석로", "1,234m",
        ["#1", "#2"], "24", "24", "설명", "서현", "2023년 9월 24일");
  }
  TrailDetailModel get trailDetailInfo => _trailDetailInfo;
}
