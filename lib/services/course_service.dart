import 'package:naemansan/models/course_detail_model.dart';
import 'package:naemansan/models/course_overview_model.dart';
import 'package:naemansan/models/moment_model.dart';
import 'package:naemansan/models/similar_course_model.dart';
import 'package:naemansan/models/spot_model.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';

class CourseService {
  List<CourseOverview> getDummyCourseOverviews(
      List<int>? tagIds, double? lati, double? longi, int? page, int? size) {
    switch (tagIds) {
      case [0]:
        {
          return [
            CourseOverview(
                id: 1,
                isEnrolled: true,
                title: "동대 자취촌",
                siGuDong: "서울특별시 둥구 동호로",
                distance: "2347",
                tags: ["평온하고 고요한", "일상 속 여유", "자연과 함께"],
                momentCount: 3,
                likeCount: 2,
                locations: [
                  const LatLng(37.55954952960852, 127.00046178211069),
                  const LatLng(37.559398566324774, 127.00039472688532),
                  const LatLng(37.55927524397866, 127.00034912933206),
                  const LatLng(37.559077502549364, 127.00037595142221),
                  const LatLng(37.55895154583334, 127.00042560938004),
                  const LatLng(37.5587942025498, 127.00051144006852),
                  const LatLng(37.55874742475276, 127.00083598735932),
                  const LatLng(37.558972808413756, 127.00091913583879),
                  const LatLng(37.55915779260724, 127.00109347942475),
                  const LatLng(37.559338523846954, 127.00134828928117),
                ]),
            CourseOverview(
                id: 2,
                isEnrolled: true,
                title: "동국대 거쳐서 충무로 가기",
                siGuDong: "경기도홧성시 동탄반석로",
                distance: "1234",
                tags: ["여유어쩌고", "뭐어쩌고"],
                momentCount: 1,
                likeCount: 1,
                locations: [
                  const LatLng(37.55943221677786, 127.00040940974625),
                  const LatLng(37.55960656863326, 127.00018946860703),
                  const LatLng(37.5596533458909, 126.99994806979569),
                  const LatLng(37.559921251437125, 127.00000171397599),
                  const LatLng(37.560150883995775, 126.99973885749253),
                  const LatLng(37.56049107907804, 126.99978177283677),
                  const LatLng(37.56068669054699, 126.99941162799271),
                  const LatLng(37.56093333036279, 126.99874107573899),
                  const LatLng(37.56036403558653, 126.99699640274048),
                  const LatLng(37.56120663001375, 126.99466411803635),
                ]),
          ];
        }
      case [1]:
        {
          return [
            CourseOverview(
                id: 1,
                isEnrolled: true,
                title: "덕수궁 산책로",
                siGuDong: "서울특별시 중구 세종대로",
                distance: "1327",
                tags: ["고즈넉한 무드", "자연과 함께"],
                momentCount: 1,
                likeCount: 0,
                locations: [
                  const LatLng(37.56789897124918, 126.97388648986816),
                  const LatLng(37.56789897124918, 126.97388648986816),
                  const LatLng(37.56686060330314, 126.97466333198547),
                  const LatLng(37.56653744564279, 126.97565038490295),
                  const LatLng(37.56657146230462, 126.97725971031188),
                  const LatLng(37.56509172315509, 126.97736699867248),
                  const LatLng(37.56487061018318, 126.97856862831115),
                  const LatLng(37.56298261885117, 126.98028524208068),
                  const LatLng(37.56284654555532, 126.9817658214569),
                  const LatLng(37.565584972804274, 126.98253829765319),
                ]),
            CourseOverview(
                id: 2,
                isEnrolled: true,
                title: "남산 둘레길",
                siGuDong: "서울특별시 용산구 용산동",
                distance: "32743",
                tags: ["자연과 함께", "감성충만"],
                momentCount: 2,
                likeCount: 4,
                locations: [
                  const LatLng(37.55594723362732, 126.97910316055847),
                  const LatLng(37.55484152650634, 126.98131330078674),
                  const LatLng(37.554348205728935, 126.98279388016296),
                  const LatLng(37.55492658148274, 126.98388822144103),
                  const LatLng(37.55293626959337, 126.98457486694885),
                  const LatLng(37.55097992832985, 126.98556191986633),
                  const LatLng(37.54985713536827, 126.98601253098083),
                ]),
          ];
        }
      default:
        {
          return [
            CourseOverview(
                id: 1,
                isEnrolled: true,
                title: "동대 자취촌",
                siGuDong: "서울특별시 중구 동호로",
                distance: "2347",
                tags: ["평온하고 고요한", "일상 속 여유", "자연과 함께"],
                momentCount: 3,
                likeCount: 2,
                locations: [
                  const LatLng(37.55954952960852, 127.00046178211069),
                  const LatLng(37.559398566324774, 127.00039472688532),
                  const LatLng(37.55927524397866, 127.00034912933206),
                  const LatLng(37.559077502549364, 127.00037595142221),
                  const LatLng(37.55895154583334, 127.00042560938004),
                  const LatLng(37.5587942025498, 127.00051144006852),
                  const LatLng(37.55874742475276, 127.00083598735932),
                  const LatLng(37.558972808413756, 127.00091913583879),
                  const LatLng(37.55915779260724, 127.00109347942475),
                  const LatLng(37.559338523846954, 127.00134828928117),
                ]),
            CourseOverview(
                id: 2,
                isEnrolled: true,
                title: "동국대 거쳐서 충무로 가기",
                siGuDong: "서울특별시 중구 충무로 3가",
                distance: "2147",
                tags: ["평온한 힐링"],
                momentCount: 1,
                likeCount: 3,
                locations: [
                  const LatLng(37.55943221677786, 127.00040940974625),
                  const LatLng(37.55960656863326, 127.00018946860703),
                  const LatLng(37.5596533458909, 126.99994806979569),
                  const LatLng(37.559921251437125, 127.00000171397599),
                  const LatLng(37.560150883995775, 126.99973885749253),
                  const LatLng(37.56049107907804, 126.99978177283677),
                  const LatLng(37.56068669054699, 126.99941162799271),
                  const LatLng(37.56093333036279, 126.99874107573899),
                  const LatLng(37.56036403558653, 126.99699640274048),
                  const LatLng(37.56120663001375, 126.99466411803635),
                ]),
            CourseOverview(
                id: 3,
                isEnrolled: true,
                title: "필동관 가는길",
                siGuDong: "서울특별시 중구 동호로",
                distance: "1200",
                tags: ["자연과 함꼐", "활기찬 분위기"],
                momentCount: 1,
                likeCount: 1,
                locations: [
                  const LatLng(37.559292302821966, 127.00035887682333),
                  const LatLng(37.55947515997886, 127.00042056763067),
                  const LatLng(37.559564462148195, 127.00070756399526),
                  const LatLng(37.559921251437125, 127.00000171397599),
                  const LatLng(37.560150883995775, 126.99973885749253),
                  const LatLng(37.56049107907804, 126.99978177283677),
                  const LatLng(37.56068669054699, 126.99941162799271),
                  const LatLng(37.56093333036279, 126.99874107573899),
                  const LatLng(37.56036403558653, 126.99699640274048),
                  const LatLng(37.56120663001375, 126.99466411803635),
                ]),
          ];
        }
    }
  }

  CourseDetail getDummyCourseDetail(int courseId) {
    List<CourseDetail> dummyCourseDetails = [
      CourseDetail(
          id: 1,
          title: "동대 자취촌",
          content: "동대 자취촌 지름길은 이겁니다!",
          siGuDong: "서울특별시 중구 동호로",
          locations: [
            const LatLng(37.55954952960852, 127.00046178211069),
            const LatLng(37.559398566324774, 127.00039472688532),
            const LatLng(37.55927524397866, 127.00034912933206),
            const LatLng(37.559077502549364, 127.00037595142221),
            const LatLng(37.55895154583334, 127.00042560938004),
            const LatLng(37.5587942025498, 127.00051144006852),
            const LatLng(37.55874742475276, 127.00083598735932),
            const LatLng(37.558972808413756, 127.00091913583879),
            const LatLng(37.55915779260724, 127.00109347942475),
            const LatLng(37.559338523846954, 127.00134828928117),
          ],
          tags: ["평온하고 고요한", "일상 속 여유", "자연과 함께"],
          distance: "1234",
          createdAt: "2023-12-11",
          userId: "user1",
          userNickName: "서찬"),
      CourseDetail(
          id: 2,
          title: "동국대 거쳐서 충무로 가기",
          siGuDong: "서울특별시 중구 충무로 3가",
          distance: "2147",
          tags: ["평온한 힐링"],
          content: "동국대 거쳐서 충무로가는 법은 생각보다 쉽답니다!",
          locations: [
            const LatLng(37.55943221677786, 127.00040940974625),
            const LatLng(37.55960656863326, 127.00018946860703),
            const LatLng(37.5596533458909, 126.99994806979569),
            const LatLng(37.559921251437125, 127.00000171397599),
            const LatLng(37.560150883995775, 126.99973885749253),
            const LatLng(37.56049107907804, 126.99978177283677),
            const LatLng(37.56068669054699, 126.99941162799271),
            const LatLng(37.56093333036279, 126.99874107573899),
            const LatLng(37.56036403558653, 126.99699640274048),
            const LatLng(37.56120663001375, 126.99466411803635),
          ],
          createdAt: "2023-12-11",
          userId: "user1",
          userNickName: "서찬"),
    ];

    if (dummyCourseDetails.length >= courseId) {
      return dummyCourseDetails[courseId - 1];
    } else {
      return CourseDetail(
          id: 1111,
          title: "필동관 가는길",
          content: "필동관을 아시나요?",
          siGuDong: "서울특별시 중구 동호로",
          locations: [
            const LatLng(37.559292302821966, 127.00035887682333),
            const LatLng(37.55947515997886, 127.00042056763067),
            const LatLng(37.559564462148195, 127.00070756399526),
            const LatLng(37.559921251437125, 127.00000171397599),
            const LatLng(37.560150883995775, 126.99973885749253),
            const LatLng(37.56049107907804, 126.99978177283677),
            const LatLng(37.56068669054699, 126.99941162799271),
            const LatLng(37.56093333036279, 126.99874107573899),
            const LatLng(37.56036403558653, 126.99699640274048),
            const LatLng(37.56120663001375, 126.99466411803635),
          ],
          tags: [],
          distance: "1234",
          createdAt: "2023-12-11",
          userId: "user1",
          userNickName: "서현");
    }
  }

  List<Moment> getDummyMoment(int courseId) {
    List<List<Moment>> dummyMoments = [
      [
        Moment(
            id: 1,
            courseId: 1,
            courseTitle: "동대 자취촌",
            nickname: "서현",
            content: "우와,,,정말좋아요",
            createdAt: "2023-09-23",
            emotion: "SADNESS",
            weather: "CLOUDY_DAY"),
        Moment(
            id: 2,
            courseId: 1,
            courseTitle: "동대 자취촌",
            nickname: "히찬",
            content: "산뜻, 그 단어 자취촌에서 볼 수 있네요.",
            createdAt: "2023-10-24",
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
            title: "감성 카페",
            content: "이 카페, 정말 감성이 느껴져요",
            location: Location(latitude: 10.0, longitude: 20.0),
            category: "CAFE_BAKERY"),
        Spot(
            id: 2,
            title: "맛집",
            content: "맛있는건 여기 있어요",
            location: Location(latitude: 10.0, longitude: 20.0),
            category: "FOOD"),
      ],
      [
        Spot(
            id: 1,
            title: "감성 카페",
            content: "이 카페, 정말 감성이 느껴져요",
            location: Location(latitude: 10.0, longitude: 20.0),
            category: "CAFE_BAKERY"),
        Spot(
            id: 2,
            title: "맛집",
            content: "맛있는건 여기 있어요",
            location: Location(latitude: 10.0, longitude: 20.0),
            category: "FOOD"),
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
            title: "동국대 거쳐서 충무로 가기",
            startLocationName: "서울특별시 중구 충무로 3가",
            distance: "2147",
            tags: ["힐링", "중구"]),
        SimilarCourse(
          id: 3,
          startLocationName: "서울특별시 중구 동호로",
          title: "필동관 가는길",
          distance: "1200",
          tags: ["자연과 함꼐", "활기찬 분위기"],
        )
      ];
    } else {
      return [];
    }
  }
}
