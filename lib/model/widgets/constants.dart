import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final AppBarStyle =
    GoogleFonts.poppins(fontWeight: FontWeight.w600, color: Colors.black);
final Color primaryColor = Color.fromARGB(255, 255, 255, 255);
final Color SecondaryColor = Color.fromARGB(255, 234, 234, 234);

Widget sizedBox(double height, double width) {
  return SizedBox(
    height: height,
    width: width,
  );
}