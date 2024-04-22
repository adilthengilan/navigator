import 'package:flutter/material.dart';

class MvContact extends StatefulWidget {
  final double height;
  final double width;
  const MvContact({
    super.key,
    required this.height,
    required this.width,
  });

  @override
  State<MvContact> createState() => _ContactState();
}

class _ContactState extends State<MvContact> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [],
    );
  }
}
