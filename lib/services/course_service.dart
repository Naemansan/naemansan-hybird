import 'package:naemansan/models/course_detail_model.dart';
import 'package:naemansan/models/course_overview_model.dart';
import 'package:naemansan/models/moment_model.dart';
import 'package:naemansan/models/similar_course_model.dart';
import 'package:naemansan/models/spot_model.dart';

class CourseService {
  List<CourseOverview> getDummyCourseOverviews(
      List<int>? tagIds, double? lati, double? longi, int? page, int? size) {
    switch (tagIds) {
      case [0]:
        {
          return [
            CourseOverview(
                id: 2,
                isEnrolled: true,
                title: "충무로에서 동대 입구",
                siGuDong: "서울 특별시 중구 필동1가",
                distance: "1745",
                tags: ["활기찬 분위기", "일상속 여유"],
                momentCount: 15,
                likeCount: 61),
          ];
        }
      case [1]:
        {
          return [
            CourseOverview(
                id: 1,
                isEnrolled: true,
                title: "혜화 가는 길",
                siGuDong: "서울특별시 종로 대학로",
                distance: "1253",
                tags: ["감성 충만"],
                momentCount: 12,
                likeCount: 50),
            CourseOverview(
                id: 1,
                isEnrolled: true,
                title: "동국대학교 산책로",
                siGuDong: "서울특별시 중구 필동로",
                distance: "723",
                tags: ["일상의 재발견"],
                momentCount: 12,
                likeCount: 31),
            CourseOverview(
                id: 2,
                isEnrolled: true,
                title: "충무로에서 동대 입구",
                siGuDong: "서울 특별시 중구 필동1가",
                distance: "1745",
                tags: ["활기찬 분위기", "일상속 여유"],
                momentCount: 15,
                likeCount: 61),
            CourseOverview(
                id: 3,
                isEnrolled: true,
                title: "집가는 길",
                siGuDong: "서울 특별시 중고 동호로",
                distance: "923",
                tags: ["도심 풍경", "일상의 재발견", "감성 충만"],
                momentCount: 15,
                likeCount: 61)
          ];
        }
      default:
        return [
          CourseOverview(
              id: 1,
              isEnrolled: true,
              title: "동국대학교 산책로",
              siGuDong: "서울특별시 중구 필동로",
              distance: "723",
              tags: ["일상의 재발견"],
              momentCount: 12,
              likeCount: 31),
          CourseOverview(
              id: 2,
              isEnrolled: true,
              title: "충무로에서 동대 입구",
              siGuDong: "서울 특별시 중구 필동1가",
              distance: "1745",
              tags: ["활기찬 분위기", "일상속 여유"],
              momentCount: 15,
              likeCount: 61),
          CourseOverview(
              id: 3,
              isEnrolled: true,
              title: "집가는 길",
              siGuDong: "서울 특별시 중고 동호로",
              distance: "923",
              tags: ["도심 풍경", "일상의 재발견", "감성 충만"],
              momentCount: 15,
              likeCount: 61)
        ];
    }
  }

  CourseDetail getDummyCourseDetail(int courseId) {
    List<CourseDetail> dummyCourseDetails = [
      CourseDetail(
          id: 1,
          title: "동국대학교 산책로",
          content: "동국대학교의 산책로 입니다.",
          siGuDong: "서울 특별시 중구 필동로",
          locations: [Location(latitude: 11.2, longitude: 11.1)],
          tags: [],
          distance: "723",
          createdAt: "2023-12-11",
          userId: "user1",
          userNickName: "서현"),
      CourseDetail(
          id: 2,
          title: "2번산책로",
          content: "2번산책로 설명",
          siGuDong: "경기도 화성시 동탄반석로",
          locations: [Location(latitude: 11.2, longitude: 11.1)],
          tags: [],
          distance: "1234",
          createdAt: "2023-12-11",
          userId: "user1",
          userNickName: "user1"),
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
          userId: "user1",
          userNickName: "user1");
    }
  }

  List<Moment> getDummyMoment(int courseId) {
    List<List<Moment>> dummyMoments = [
      [
        Moment(
            id: 1,
            courseId: 1,
            courseTitle: "동국대학교 산책로",
            nickname: "희찬",
            content: "정말... 행복합니다...",
            createdAt: "2023-12-11",
            emotion: "JOY",
            weather: "CLOUDY_DAY"),
        Moment(
            id: 2,
            courseId: 1,
            courseTitle: "동국대학교 산책로",
            nickname: "서현",
            content: "잘 됐으면 좋겠다.",
            createdAt: "2023-12-11",
            emotion: "FLUTTER",
            weather: "CLOUDY_DAY")
      ],
      [
        Moment(
            id: 1,
            courseId: 2,
            courseTitle: "산책로2",
            nickname: "서현",
            content: "안녕하세요?3",
            createdAt: "2023-09-23",
            emotion: "SADNESS",
            weather: "CLOUDY_DAY"),
        Moment(
            id: 2,
            courseId: 2,
            courseTitle: "산책로2",
            nickname: "서현2",
            content: "안녕하세요?4",
            createdAt: "2023-09-24",
            emotion: "FLUTTER",
            weather: "CLOUDY_DAY")
      ]
    ];

    if (dummyMoments.length >= courseId) {
      return dummyMoments[courseId - 1];
    } else {
      return [
        Moment(
            id: 1,
            courseId: 111,
            courseTitle: "범위 초과 산책로",
            nickname: "서현",
            content: "안녕하세요?",
            createdAt: "2023-09-23",
            emotion: "SADNESS",
            weather: "CLOUDY_DAY"),
        Moment(
            id: 2,
            courseId: 111,
            courseTitle: "범위 초과 산책로",
            nickname: "서현2",
            content: "안녕하세요?",
            createdAt: "2023-09-24",
            emotion: "FLUTTER",
            weather: "CLOUDY_DAY")
      ];
    }
  }

  List<Spot> getDummySpot(int courseId) {
    List<List<Spot>> dummySpots = [
      [
        Spot(
            id: 1,
            title: "컴포즈",
            content: "한잔 들고 학교 가면 좋아요",
            location: Location(latitude: 10.0, longitude: 20.0),
            category: "CAFE_BAKERY"),
        Spot(
            id: 1,
            title: "비둘기 많은 곳",
            content: "비둘기가 정말 많습니다...",
            location: Location(latitude: 10.0, longitude: 20.0),
            category: "PLACE"),
      ],
      [
        Spot(
            id: 1,
            title: "1",
            content: "1",
            location: Location(latitude: 10.0, longitude: 20.0),
            category: "CAFE_BAKERY"),
        Spot(
            id: 1,
            title: "1",
            content: "1",
            location: Location(latitude: 10.0, longitude: 20.0),
            category: "CAFE_BAKERY"),
      ],
    ];

    if (dummySpots.length >= courseId) {
      return dummySpots[courseId - 1];
    } else {
      return [
        Spot(
            id: 1,
            title: "1",
            content: "1",
            location: Location(latitude: 10.0, longitude: 20.0),
            category: "CAFE_BAKERY"),
        Spot(
            id: 1,
            title: "1",
            content: "1",
            location: Location(latitude: 10.0, longitude: 20.0),
            category: "CAFE_BAKERY"),
      ];
    }
  }

  List<Spot> getDummyNewSpot() {
    List<Spot> dummySpots = [
      Spot(
          id: 6,
          title: "새로운 스팟 1",
          content: "1",
          location: Location(latitude: 10.0, longitude: 20.0),
          category: "SHOPPING"),
      Spot(
          id: 7,
          title: "새로운 스팟 2",
          content: "1",
          location: Location(latitude: 10.0, longitude: 20.0),
          category: "FOOD"),
      Spot(
          id: 6,
          title: "새로운 스팟 3",
          content: "1",
          location: Location(latitude: 10.0, longitude: 20.0),
          category: "ACCOMMODATION"),
      Spot(
          id: 6,
          title: "새로운 스팟 4",
          content: "1",
          location: Location(latitude: 10.0, longitude: 20.0),
          category: "PUB_BAR"),
      Spot(
          id: 6,
          title: "새로운 스팟 5",
          content: "1",
          location: Location(latitude: 10.0, longitude: 20.0),
          category: "NATURE"),
    ];

    return dummySpots;
  }

  List<SimilarCourse> getDummySimilarCourses(int courseId) {
    if (courseId == 1) {
      return [
        SimilarCourse(
            id: 2,
            title: "팔정도 한바퀴",
            startLocationName: "동국대학교 중구 필동로",
            distance: "124",
            tags: ["고즈넉한 무드"]),
        SimilarCourse(
          id: 3,
          title: "충무로에서 동대 입구",
          startLocationName: "서울 특별시 중구 필동1가",
          distance: "1745",
          tags: ["활기찬 분위기", "일상속 여유"],
        )
      ];
    } else {
      return [];
    }
  }
}
