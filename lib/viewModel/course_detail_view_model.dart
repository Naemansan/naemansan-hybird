import 'package:get/get.dart';
import 'package:naemansan/models/course_overview_model.dart';
import 'package:naemansan/models/keyword_model.dart';
import 'package:naemansan/models/moment_model.dart';

import 'package:naemansan/models/spot_model.dart';
import 'package:naemansan/models/course_detail_model.dart';

class CourseDetailViewModel extends GetxController {
  late CourseDetailModel _courseDetailInfo;
  CourseDetailViewModel() {
    _courseDetailInfo = CourseDetailModel(
        id: 1,
        title: "산책로1",
        siGuDong: "경기도화성시동탄반석로",
        distance: "1,234m",
        keywords: [
          KeywordModel(id: 1, keyword: "123"),
          KeywordModel(id: 1, keyword: "123"),
          KeywordModel(id: 1, keyword: "123")
        ],
        descriptionCourseOverview: "1111",
        date: "2023/12/23",
        writerId: 1,
        writerName: "서현",
        momentCount: 3,
        likeCount: 4,
        momentList: [
          MomentModel(
              id: 1,
              date: "11/2",
              year: "2023",
              weather: "Cloud",
              emotion: "Sad",
              courseId: 2,
              courseTitle: "산책로2",
              userId: 1,
              userName: "서현  ",
              content: "내용"),
          MomentModel(
              id: 2,
              date: "11/3",
              year: "2023",
              weather: "FewCloudDay",
              emotion: "Joy",
              courseId: 2,
              courseTitle: "산책로2",
              userId: 1,
              userName: "서현  ",
              content: "내용"),
        ],
        spotList: [
          SpotModel(
              id: 1,
              title: "카페",
              category: "Cafe",
              description: "설명",
              thumbnail: null),
          SpotModel(
              id: 2,
              title: "산책로",
              category: "Nature",
              description: "설명",
              thumbnail: "사진있음")
        ],
        similarCourseList: [
          CourseOverviewModel(
              id: 1,
              title: "산책로1",
              siGuDong: "경기도 화성시 석우동",
              distance: "1,234m",
              keywords: [
                KeywordModel(id: 1, keyword: "@"),
                KeywordModel(id: 1, keyword: "@"),
                KeywordModel(id: 1, keyword: "@")
              ],
              momentCount: 1,
              likeCount: 2,
              isPublished: true),
          CourseOverviewModel(
              id: 1,
              title: "산책로2",
              siGuDong: "경기도 화성시 석우동",
              distance: "1,234m",
              keywords: [
                KeywordModel(id: 1, keyword: "@"),
                KeywordModel(id: 1, keyword: "@"),
                KeywordModel(id: 1, keyword: "@")
              ],
              momentCount: 1,
              likeCount: 2,
              isPublished: true)
        ]);
  }
  CourseDetailModel get courseDetailInfo => _courseDetailInfo;
}
