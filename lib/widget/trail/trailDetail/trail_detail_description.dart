import 'package:flutter/material.dart';

class TrailDetailDescription extends StatelessWidget {
  const TrailDetailDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      width: double.infinity,
      padding: const EdgeInsets.only(bottom: 8),
      child: Text("소개~"),
    );
  }
}
