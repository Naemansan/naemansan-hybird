class CategoryConfig {
  static List<Category> categoryList = [
    Category(eng: "PUB_BAR", kor: "펍/바", icon: 'assets/icons/spotPUB_BAR.svg'),
    Category(
        eng: "ACCOMMODATION",
        kor: "숙소",
        icon: 'assets/icons/spotACCOMMODATION.svg'),
    Category(eng: "NATURE", kor: "자연", icon: 'assets/icons/spotNATURE.svg'),
    Category(eng: "SHOPPING", kor: "쇼핑", icon: 'assets/icons/spotSHOPPING.svg'),
    Category(eng: "FOOD", kor: "음식점", icon: 'assets/icons/spotFOOD.svg'),
    Category(eng: "PLACE", kor: "장소", icon: 'assets/icons/spotPLACE.svg'),
    Category(
        eng: "CAFE_BAKERY",
        kor: "카페/베이커리",
        icon: 'assets/icons/spotCAFE_BAKERY.svg')
  ];

  static String engTo(
    String type,
    String eng,
  ) {
    Category result = categoryList.firstWhere(
      (category) => category.eng == eng,
      orElse: () => Category(eng: "", kor: "", icon: ""),
    );

    if (type == "kor") {
      return result.kor;
    } else if (type == "icon") {
      return result.icon;
    } else {
      return result.eng;
    }
  }
}

class Category {
  final String eng;
  final String kor;
  final String icon;

  Category({required this.eng, required this.kor, required this.icon});
}
