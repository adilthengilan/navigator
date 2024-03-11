import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final AppBarStyle = GoogleFonts.poppins(
    fontWeight: FontWeight.w600, color: Color.fromARGB(255, 0, 0, 0));
final clickedBarStyle = GoogleFonts.poppins(
    fontWeight: FontWeight.w600, color: Color.fromARGB(255, 90, 59, 113));
final drawerstyle = GoogleFonts.poppins(
    fontWeight: FontWeight.w600, color: Color.fromARGB(255, 0, 0, 0));

final Color primaryColor = Color.fromARGB(255, 255, 255, 255);
final Color SecondaryColor = Color.fromARGB(255, 234, 234, 234);

Widget sizedBox(double height, double width) {
  return SizedBox(
    height: height,
    width: width,
  );
}

final ClientName = 'NavigatorAdmin';
final ClientId = 'NavigatorAdmin123';
