class SpotModel {
  final int id;

  final String title;
  final String category;

  final String? thumbnail;

  final String description;

  SpotModel(
      {required this.id,
      required this.title,
      required this.category,
      required this.description,
      required this.thumbnail});
}
