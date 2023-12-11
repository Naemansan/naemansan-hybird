import 'package:naemansan/models/course_detail_model.dart';
import 'package:naemansan/models/course_overview_model.dart';
import 'package:naemansan/models/tag_model.dart';

class CourseService {
  List<CourseOverview> getDummyCourseOverviews(
      List<int> tagIds, double lati, double longi, int page, int size) {
    return [
      CourseOverview(
          id: 1,
          isEnrolled: true,
          title: "1번산책로",
          siGuDong: "경기도홧성시 동탄반석로",
          distance: 1234,
          tags: [],
          momentCount: 1,
          likeCount: 1),
      CourseOverview(
          id: 2,
          isEnrolled: true,
          title: "1번산책로",
          siGuDong: "경기도홧성시 동탄반석로",
          distance: 1234,
          tags: [],
          momentCount: 1,
          likeCount: 1),
      CourseOverview(
          id: 3,
          isEnrolled: true,
          title: "1번산책로",
          siGuDong: "경기도홧성시 동탄반석로",
          distance: 1234,
          tags: [],
          momentCount: 1,
          likeCount: 1)
    ];
  }

  CourseDetail getDummyCourseDetail(int courseId) {
    List<CourseDetail> dummyCourseDetails = [
      CourseDetail(
          id: 1,
          title: "1번산책로",
          content: "1번산책로 설명",
          siGuDong: "경기도 화성시 동탄반석로",
          locations: [Location(latitude: 11.2, longitude: 11.1)],
          tags: [],
          distance: "1234",
          createdAt: "2023-12-11",
          userId: "user1"),
      CourseDetail(
          id: 2,
          title: "1번산책로",
          content: "1번산책로 설명",
          siGuDong: "경기도 화성시 동탄반석로",
          locations: [Location(latitude: 11.2, longitude: 11.1)],
          tags: [],
          distance: "1234",
          createdAt: "2023-12-11",
          userId: "user1"),
    ];

    if (dummyCourseDetails.length >= courseId) {
      return dummyCourseDetails[courseId - 1];
    } else {
      return CourseDetail(
          id: 1111,
          title: "범위 넘음",
          content: "1번산책로 설명",
          siGuDong: "경기도 화성시 동탄반석로",
          locations: [Location(latitude: 11.2, longitude: 11.1)],
          tags: [],
          distance: "1234",
          createdAt: "2023-12-11",
          userId: "user1");
    }
  }
}
