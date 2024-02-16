import 'package:flutter/material.dart';

Widget container(double height, double width, Color color, double radius) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
        color: color, borderRadius: BorderRadius.circular(radius)),
  );
}



