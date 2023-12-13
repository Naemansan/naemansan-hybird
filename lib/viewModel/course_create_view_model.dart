import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:naemansan/models/create_course/similar_walk_model.dart';
import 'package:naemansan/services/ceraete_course_service.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';
import 'package:naemansan/models/course_walking_single_spot_model.dart';

class CourseCreateViewModel extends GetxController {
  List<LatLng> latLngList = [];
  List<WalkingSingleSpotModel> spotList = [];
  bool isDataLoaded = false;
  var isSimilarity = false.obs;
  var isCheckingSimilarity = true.obs;
  var isPersonal = true.obs;

  var similarityResult = Rxn<SimilarWalkModel>();
  final SimilarityService _similarityService = SimilarityService();

  void loadData(
      List<LatLng> newLatLngList, List<WalkingSingleSpotModel> newSpotList) {
    latLngList = newLatLngList;
    spotList = newSpotList;
    isDataLoaded = true;
    update();
  }

  // 유사도 검사 메서드
  Future<void> checkSimilarity() async {
    isCheckingSimilarity.value = true;
    try {
      var result = await _similarityService.checkSimilarity(
          latLngList, isPersonal.value);
      similarityResult.value = result;
    } finally {
      isCheckingSimilarity.value = false;
      update();
    }
  }

  // 추가 로직 및 메서드...
}
