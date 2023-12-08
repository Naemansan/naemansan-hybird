import 'package:get/get.dart';
import 'package:naemansan/models/near_course_model.dart';
import 'package:naemansan/services/near_course_service.dart';

class CourseController extends GetxController {
  var course = Rx<NearCourseListModel?>(null);

  @override
  void onInit() {
    super.onInit();
    fetchCourse();
  }

  void fetchCourse() async {
    try {
      // NearCourseService를 통해 코스 데이터를 가져옴
      var courseData = await NearCourseService().fetchNearCourses();

      if (courseData.courses.isEmpty) {
        print("courseData is empty");
        return;
      }

      // course 변수에 있는 데이터를 출력합니다.
      print(
          "courseData: ${courseData.courses[0].siGuDong}, ${courseData.courses[0].distance}, ${courseData.courses[0].keywords}, ${course.value!.courses[0].locations}");
    } catch (e) {
      print("Error fetching course data: $e");
    }
  }
}
