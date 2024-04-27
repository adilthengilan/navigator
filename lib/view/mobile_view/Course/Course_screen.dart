import 'package:flutter/material.dart';

class MvCourse extends StatefulWidget {
  final double height;
  final double width;
  const MvCourse({
    super.key,
    required this.height,
    required this.width,
  });

  @override
  State<MvCourse> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<MvCourse> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [],
    );
  }
}
