import 'package:get/get.dart';

import 'package:naemansan/models/moment_model.dart';
import 'package:naemansan/models/near_course_model.dart';
import 'package:naemansan/models/spot_model.dart';
import 'package:naemansan/models/course_detail_model.dart';

class CourseDetailViewModel extends GetxController {
  late CourseDetailModel _courseDetailInfo;
  CourseDetailViewModel() {
    _courseDetailInfo = CourseDetailModel(
        "산책로",
        "경기도 화성시 동탄반석로",
        "1,234m",
        ["#1", "#2"],
        "순간의 그 정지는 우리 시야에 크게 다가오는 특정 장소에 대한 이미지를 만들어낼 만큼 충분한 시간입니다. 물론 그 정지가 너무 순간적이어서 우리가 특정한 대상에 집중을 했는지조차 자각하지 못할 수도 있습니다.\n\n우리는 그저 전반적인 풍경만을 보았다고 믿으니까요.",
        "서현",
        "2023년 9월 24일",
        [
          MomentModel(
              "11/23", "2023", "Cloud", "Sad", "산책로산책로산책로", "모멘트 작성자 1", "좋네요"),
          MomentModel(
              "11/24",
              "2023",
              "FewCloudNight",
              "Hurt",
              "산책로",
              "모멘트 작성자 2",
              "좋네요... 그만하고싶다.좋네요... 그만하고싶다좋네요... 그만하고싶다좋네요... 그만하고싶다좋네요... 그만하고싶다"),
          MomentModel("11/24", "2023", "Snow", "Joy", "산책로", "모멘트 작성자 2",
              "좋네요... 그만하고싶다."),
          MomentModel("11/24", "2023", "Rain", "Com", "산책로", "모멘트 작성자 2",
              "좋네요... 그만하고싶다좋네요... 그만하고싶다좋네요... 그만하고싶다좋네요... 그만하고싶다좋네요... 그만하고싶다좋네요... 그만하고싶다좋네요... 그만하고싶다."),
        ],
        [
          SpotModel("스팟1", "Cafe", null, "헐..."),
          SpotModel("스팟2", "Nature", "1", "헐...")
        ],
        [
          Course(
              id: 1,
              title: "타이틀",
              siGuDong: "화성시동탄반석로",
              distance: "1,234m",
              keywords: [
                Keyword(id: 1, keyword: "123"),
                Keyword(id: 1, keyword: "123"),
                Keyword(id: 1, keyword: "123")
              ],
              locations: [
                Location(latitude: 12.0, longitude: 34.0),
              ]),
          Course(
              id: 2,
              title: "타이틀2",
              siGuDong: "화성시동탄반석로",
              distance: "1,234m",
              keywords: [
                Keyword(id: 1, keyword: "123"),
                Keyword(id: 1, keyword: "123"),
                Keyword(id: 1, keyword: "123")
              ],
              locations: [
                Location(latitude: 12.0, longitude: 34.0),
              ]),
          Course(
              id: 3,
              title: "타이틀2",
              siGuDong: "화성시동탄반석로",
              distance: "1,234m",
              keywords: [
                Keyword(id: 1, keyword: "123"),
                Keyword(id: 1, keyword: "123"),
                Keyword(id: 1, keyword: "123")
              ],
              locations: [
                Location(latitude: 12.0, longitude: 34.0),
              ])
        ]);
  }
  CourseDetailModel get courseDetailInfo => _courseDetailInfo;
}
