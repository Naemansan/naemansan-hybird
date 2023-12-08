import 'package:flutter/material.dart';

class TrailDetailWriter extends StatefulWidget {
  const TrailDetailWriter({super.key});

  @override
  State<TrailDetailWriter> createState() => _TrailDetailWriterState();
}

class _TrailDetailWriterState extends State<TrailDetailWriter> {
  @override
  Widget build(BuildContext context) {
    return //제작자 정보
        Container(
      width: double.infinity,
      color: Colors.indigo,
      padding: const EdgeInsets.only(bottom: 20),
      child: Text("제작자 정보"),
    ); //제작자 정보
  }
}
