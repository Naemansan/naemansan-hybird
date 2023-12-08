import 'package:get/get.dart';
import 'package:naemansan/models/near_course_model.dart';
import 'package:naemansan/services/near_course_service.dart';

class CourseController extends GetxController {
  var isLoading = true.obs;
  var course = Rx<NearCourseListModel?>(null);

  @override
  void onInit() {
    super.onInit();
    fetchCourse();
  }

  void fetchCourse() async {
    try {
      isLoading.value = true;
      var courseData = await NearCourseService().fetchNearCourses();

      if (courseData.courses.isEmpty) {
        print("courseData is empty");
        return;
      }

      // 코스 데이터를 course 변수에 할당

      course.value = courseData; // Rx 변수 업데이트
    } catch (e) {
      print("Error fetching course data: $e");
    } finally {
      isLoading.value = false;
    }
  }

  // getCourse
  // 코스 데이터를 반환하는 함수
  // 코스 데이터가 없으면 null을 반환합니다.
  NearCourseListModel? get getCourse => course.value;
}
