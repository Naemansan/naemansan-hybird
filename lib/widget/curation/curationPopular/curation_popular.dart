import 'package:flutter/material.dart';

import 'package:naemansan/widget/curation/curationPopular/curation_popular_moment.dart';
import 'package:naemansan/widget/curation/curationPopular/curtaion_popular_course.dart';

class CurationPopular extends StatelessWidget {
  const CurationPopular({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [CurationPopularMoment(), CurationPopularCourse()],
    );
  }
}
