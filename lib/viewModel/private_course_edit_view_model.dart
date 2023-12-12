import 'package:get/get.dart';

import 'package:naemansan/models/course_detail_model.dart';
import 'package:naemansan/models/moment_model.dart';

import 'package:naemansan/models/spot_model.dart';
import 'package:naemansan/services/course_service.dart';

class PrivateCourseEditViewModel extends GetxController {
  final bool isNewSpot;
  final int courseId;

  final Rx<CourseDetail> course = CourseDetail(
          id: 0,
          title: '',
          content: '',
          siGuDong: '',
          locations: [Location(latitude: 0, longitude: 0)],
          tags: [],
          distance: '',
          createdAt: '',
          userId: '',
          userNickName: '')
      .obs;

  final RxList<Moment> moments = <Moment>[].obs;
  final RxList<Spot> spots = <Spot>[].obs;
  final RxList<Spot> newSpots = <Spot>[].obs;

  PrivateCourseEditViewModel({required this.isNewSpot, required this.courseId});

  @override
  void onInit() {
    super.onInit();
    loadCourseDetailData(courseId);
  }

  void loadCourseDetailData(
    int courseId,
  ) {
    CourseDetail dummyCourseDetail =
        CourseService().getDummyCourseDetail(courseId);
    List<Moment> dummyMoments = CourseService().getDummyMoment(courseId);
    List<Spot> dummySpots = CourseService().getDummySpot(courseId);

    course.value = dummyCourseDetail;
    moments.value = dummyMoments;
    spots.value = dummySpots;

    if (isNewSpot) {
      List<Spot> dummyNewSpots = CourseService().getDummyNewSpot();
      newSpots.value = dummyNewSpots;
    }
  }

  List<int> getDeleteSpotIds(List<int> spotIds) {
    //원래 스팟들
    List<int> originSpotIds = List.generate(spots.length, (index) => index);
    return originSpotIds
        .where((element) => !spotIds.contains(element))
        .toList();
  }

  List<Spot> getCreateSpots(List<int> spotIds, List<Spot> spotList) {
    //원래 스팟들
    List<int> originSpotIds = List.generate(spots.length, (index) => index);
    //추가된 스팟 찾기
    List<int> newSpotIds =
        spotIds.where((element) => !originSpotIds.contains(element)).toList();

    return newSpotIds.map((e) => spotList[e]).toList();
  }

  void updateCourseDetail(
      String title, String description, List<int> tags, List<int> spotIds) {
    //스팟 정보 반환
    List<int> deleteSpotIds = getDeleteSpotIds(spotIds);
    print("삭제해야할 스팟 : $deleteSpotIds");
  }

  void publishCourseDetail(
      String title, String description, List<int> tags, List<int> spotIds) {
    //스팟 정보 반환
    List<int> deleteSpotIds = getDeleteSpotIds(spotIds);
    print("삭제해야할 스팟 : $deleteSpotIds");
  }

  void updateCourseDetailWithNewSpot(String title, String description,
      List<int> tags, List<int> spotIds, List<Spot> spotList) {
    //스팟 정보 반환
    List<int> deleteSpotIds = getDeleteSpotIds(spotIds);
    List<Spot> createSpots = getCreateSpots(spotIds, spotList);
    print("삭제해야할 스팟 : $deleteSpotIds");
    print("추가해야할 스팟: ${createSpots.map((e) => e.title)}");
  }
}
