import 'dart:async';
import 'package:naemansan/models/near_course_model.dart';

class NearCourseService {
  Future<NearCourseListModel> fetchNearCourses() async {
    // 더미 JSON 데이터를 리스트로 정의합니다.
    final Map<String, dynamic> dummyData = {
      "courses": [
        {
          "id": 1,
          "title": "동대 자취촌",
          "siGuDong": "서울특별시 중구 동호로",
          "distance": "2,347m",
          "tags": [
            {
              "id": 1,
              "tag": "평온하고 고요한",
            },
            {
              "id": 2,
              "tag": "일상속 여유",
            },
            {
              "id": 3,
              "tag": "자연과 함께",
            }
          ],
          "locations": [
            {"latitude": 37.55954952960852, "longitude": 127.00046178211069},
            {"latitude": 37.559398566324774, "longitude": 127.00039472688532},
            {"latitude": 37.55927524397866, "longitude": 127.00034912933206},
            {"latitude": 37.559077502549364, "longitude": 127.00037595142221},
            {"latitude": 37.55895154583334, "longitude": 127.00042560938004},
            {"latitude": 37.5587942025498, "longitude": 127.00051144006852},
            {"latitude": 37.55874742475276, "longitude": 127.00083598735932},
            {"latitude": 37.558972808413756, "longitude": 127.00091913583879},
            {"latitude": 37.55915779260724, "longitude": 127.00109347942475},
            {"latitude": 37.559338523846954, "longitude": 127.00134828928117},
          ]
        },
        // {
        //   "id": 1,
        //   "title": "남산 아래 한바퀴",
        //   "siGuDong": "서울특별시 중구 동호로",
        //   "distance": "350m",
        //   "tags": [
        //     {
        //       "id": 1,
        //       "tag": "평온하고 고요한",
        //     },
        //     {
        //       "id": 2,
        //       "tag": "일상속 여유",
        //     },
        //     {
        //       "id": 3,
        //       "tag": "자연과 함께",
        //     }
        //   ],
        //   "locations": [
        //     {"latitude": 37.55935013125368, "longitude": 127.00036986480936},
        //     {"latitude": 37.55949258966444, "longitude": 127.00042887340769},
        //     {"latitude": 37.559556376924256, "longitude": 127.00065954338297},
        //     {"latitude": 37.55947770596263, "longitude": 127.00096531521066},
        //     {"latitude": 37.55944368606161, "longitude": 127.00140251528009},
        //     {"latitude": 37.55944368606161, "longitude": 127.00183166872247},
        //     {"latitude": 37.55912900124074, "longitude": 127.0017646134971},
        //     {"latitude": 37.55886959788908, "longitude": 127.00164123188242},
        //     {"latitude": 37.55872649439647, "longitude": 127.0018974773057},
        //     {"latitude": 37.55889446912363, "longitude": 127.00227298656779},
        //     {"latitude": 37.558996529532386, "longitude": 127.00262703815775},
        //   ]
        // },
        {
          "id": 2,
          "title": "동국대 거쳐서 충무로 가기",
          "siGuDong": "서울특별시 중구 충무로 3가",
          "distance": "2,147m",
          "tags": [
            {
              "id": 1,
              "tag": "힐링",
            },
            {
              "id": 10,
              "tag": "중구",
            },
            {
              "id": 5,
              "tag": "지하철",
            }
          ],
          "locations": [
            {"latitude": 37.55943221677786, "longitude": 127.00040940974625},
            {"latitude": 37.55960656863326, "longitude": 127.00018946860703},
            {"latitude": 37.5596533458909, "longitude": 126.99994806979569},
            {"latitude": 37.559921251437125, "longitude": 127.00000171397599},
            {"latitude": 37.560150883995775, "longitude": 126.99973885749253},
            {"latitude": 37.56049107907804, "longitude": 126.99978177283677},
            {"latitude": 37.56068669054699, "longitude": 126.99941162799271},
            {"latitude": 37.56093333036279, "longitude": 126.99874107573899},
            {"latitude": 37.56112043588531, "longitude": 126.99808661673936},
            {"latitude": 37.560099854599486, "longitude": 126.99692790244492},
            {"latitude": 37.559539058421514, "longitude": 126.99652433395386},
            {"latitude": 37.55947048917129, "longitude": 126.99618761275681},
            {"latitude": 37.56036403558653, "longitude": 126.99699640274048},
            {"latitude": 37.560645312685914, "longitude": 126.9960052225438},
            {"latitude": 37.56148728709178, "longitude": 126.9959515783635},
            {"latitude": 37.56120663001375, "longitude": 126.99466411803635},
          ]
        },
        {
          "id": 3,
          "title": "필동관 가는길",
          "siGuDong": "서울특별시 중구 동호로",
          "distance": "107m",
          "tags": [
            {
              "id": 4,
              "tag": "하이",
            },
            {
              "id": 6,
              "tag": "랄라",
            },
            {
              "id": 9,
              "tag": "바보",
            }
          ],
          "locations": [
            {"latitude": 37.559292302821966, "longitude": 127.00035887682333},
            {"latitude": 37.55947515997886, "longitude": 127.00042056763067},
            {"latitude": 37.559564462148195, "longitude": 127.00070756399526},
            {"latitude": 37.55977921216488, "longitude": 127.00083094560995},
            {"latitude": 37.56017864648534, "longitude": 127.00093181390126},
            {"latitude": 37.560435919063636, "longitude": 127.00093717831929},
          ]
        },
      ]
    };

// 더미 데이터를 NearCourseListModel로 변환합니다.

    final List<dynamic> coursesData = dummyData['courses'];

    // Convert each course data item to a Course object and then create a NearCourseListModel
    final List<Course> coursesList =
        coursesData.map((data) => Course.fromJson(data)).toList();

    // Create a NearCourseListModel using the list of Course objects
    final NearCourseListModel nearCourseListModel =
        NearCourseListModel(courses: coursesList);
    await Future.delayed(const Duration(seconds: 2));

    // Return the NearCourseListModel
    return nearCourseListModel;
  }
}
