import 'package:get/get.dart';
import 'package:naemansan/models/course/course_overview_model.dart';

import 'package:naemansan/models/moment_model.dart';

import 'package:naemansan/models/spot_model.dart';
import 'package:naemansan/models/course/course_detail_model.dart';
import 'package:naemansan/models/tag_model.dart';

class CourseDetailViewModel extends GetxController {
  late CourseDetailModel _courseDetailInfo;
  CourseDetailViewModel() {
    _courseDetailInfo = CourseDetailModel(
        id: 1,
        title: "산책로",
        content: "내용",
        siGuDong: "서울시 중구 필동",
        distance: 1234,
        tags: [Tag(id: 1, tag: "1")],
        created_at: "날짜:수정필요",
        user_id: "user1",
        like_cnt: 12,
        moments: [
          MomentModel(
              id: 1,
              content: "1",
              weather: "Cloud",
              emotion: "Sad",
              course_id: 1,
              user_id: "user2",
              created_at: "날짜:수정필요")
        ],
        spots: [
          SpotModel(
              id: 1, title: "2", content: "2", course_id: 222, category: "Cafe")
        ],
        similarCourses: [
          CourseOverviewModel(
              id: 1,
              isEnrolled: true,
              title: "타이틀",
              siGuDong: "경기화성동탄반석로",
              distance: 123,
              tags: [Tag(id: 1, tag: "1")],
              moment_cnt: 123,
              like_cnt: 112)
        ]);
  }
  CourseDetailModel get courseDetailInfo => _courseDetailInfo;
}
