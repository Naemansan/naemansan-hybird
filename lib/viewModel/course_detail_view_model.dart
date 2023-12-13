import 'package:get/get.dart';

import 'package:naemansan/models/course_detail_model.dart';
import 'package:naemansan/models/moment_model.dart';
import 'package:naemansan/models/similar_course_model.dart';
import 'package:naemansan/models/spot_model.dart';
import 'package:naemansan/services/course_service.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';

class CourseDetailViewModel extends GetxController {
  final Rx<CourseDetail> course = CourseDetail(
          id: 0,
          title: '',
          content: '',
          siGuDong: '',
          locations: [const LatLng(0, 0), const LatLng(0, 0)],
          tags: [],
          distance: '',
          createdAt: '',
          userId: '',
          userNickName: '')
      .obs;

  final RxList<Moment> moments = <Moment>[].obs;
  final RxList<Spot> spots = <Spot>[].obs;
  final RxList<SimilarCourse> similarCourses = <SimilarCourse>[].obs;

  void loadCourseDetailData(int courseId) {
    CourseDetail dummyCourseDetail =
        CourseService().getDummyCourseDetail(courseId);
    List<Moment> dummyMoments = CourseService().getDummyMoment(courseId);
    List<Spot> dummySpots = CourseService().getDummySpot(courseId);
    List<SimilarCourse> dummySimilarCourses =
        CourseService().getDummySimilarCourses(courseId);

    course.value = dummyCourseDetail;
    moments.value = dummyMoments;
    spots.value = dummySpots;
    similarCourses.value = dummySimilarCourses;
  }
}
