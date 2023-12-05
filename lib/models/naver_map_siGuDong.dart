class SiguDong {
  // 시, 구, 동
  final String si;
  final String gu;
  final String dong;

  SiguDong({required this.si, required this.gu, required this.dong});

  // json 데이터를 받아서 SiguDong 객체를 만듬
  factory SiguDong.fromJson(Map<String, dynamic> json) {
    var region = json["results"][1]['region'];
    return SiguDong(
      si: region['area1']['name'],
      gu: region['area2']['name'],
      dong: region['area3']['name'],
    );
  }

  @override
  String toString() => '$si $gu $dong';
}
