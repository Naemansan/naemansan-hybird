import 'package:naemansan/models/moment_model.dart';
import 'package:naemansan/models/spot_model.dart';

class CourseDetailModel {
  final String name;
  final String location;
  final String distance;

  final String description;

  final List<String> tags;

  final String writer;
  final String date;

  final List<MomentModel> momnetList;

  final List<SpotModel> spotList;

  CourseDetailModel(this.name, this.location, this.distance, this.tags,
      this.description, this.writer, this.date, this.momnetList, this.spotList);
}
