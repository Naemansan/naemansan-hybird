import 'package:get/get.dart';

class CourseSpotCreateViewModel extends GetxController {
  // 스팟 이름 설명 카테고리 인덱스
  var selectedIndex = Rx<int?>(null);

  var spotName = ''.obs;
  var spotDescription = ''.obs;

  // 폼이 유효한지 확인하는 getter
  bool get isFormValid =>
      spotName.isNotEmpty &&
      spotDescription.isNotEmpty &&
      selectedIndex.value != null;

  // 카테고리 아이콘 선택
  void selectSpotIcon(int index) {
    selectedIndex.value = index;
  }

  // 스팟 등록 함수
  void registerSpot(String name, String description) {
    // 등록 알고리즘
    // ..
    // 등록 후 폼 초기화
    spotName.value = '';
    spotDescription.value = '';
    selectedIndex.value = null;
  }

  // 유저가 입력한 스팟 이름과 설명을 업데이트하는 함수
  void updateName(String name) {
    spotName.value = name;
  }

  void updateDescription(String description) {
    spotDescription.value = description;
  }
}
