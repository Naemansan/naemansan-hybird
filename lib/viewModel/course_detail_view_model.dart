import 'package:get/get.dart';
import 'package:naemansan/models/course_overview_model.dart';
import 'package:naemansan/models/course_detail_model.dart';
import 'package:naemansan/models/moment_model.dart';
import 'package:naemansan/models/spot_model.dart';
import 'package:naemansan/services/course_service.dart';

class CourseDetailViewModel extends GetxController {
  final int courseId;
  CourseDetailViewModel({required this.courseId});

  final Rx<CourseDetail> course = CourseDetail(
          id: 0,
          title: '',
          content: '',
          siGuDong: '',
          locations: [Location(latitude: 0, longitude: 0)],
          tags: [],
          distance: '',
          createdAt: '',
          userId: '')
      .obs;

  final RxList<MomentModel> moments = <MomentModel>[].obs;
  final RxList<SpotModel> spots = <SpotModel>[].obs;
  final RxList<CourseOverview> similarCourses = <CourseOverview>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadCourseDetailData(courseId);
  }

  void loadCourseDetailData(int courseId) {
    CourseDetail dummyCourseDetail =
        CourseService().getDummyCourseDetail(courseId);

    course.value = dummyCourseDetail;
  }
}
