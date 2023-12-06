class SiGuDongModel {
  // 시, 구, 동
  final String si;
  final String gu;
  final String dong;

  SiGuDongModel({required this.si, required this.gu, required this.dong});

  // json 데이터를 받아서 SiGuDongModel 객체를 만듬
  factory SiGuDongModel.fromJson(Map<String, dynamic> json) {
    var region = json["results"][1]['region'];
    return SiGuDongModel(
      si: region['area1']['name'],
      gu: region['area2']['name'],
      dong: region['area3']['name'],
    );
  }

  @override
  String toString() => '$si $gu $dong';
}
