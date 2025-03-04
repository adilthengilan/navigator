import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:navigator_portal/view/desktop_view/home_dashboard/dashboard/dashboard.dart';
import 'dart:ui';
import 'package:url_launcher/url_launcher.dart';

class Assistance_Screen extends StatelessWidget {
  const Assistance_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            'Remote Jobs',
            style: GoogleFonts.poppins(
                fontSize: height * 0.04, fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(
          height: height * 0.55,
          width: width * 1,
          child: Lists_for_all(
            height,
            width,
            Remote_Jobs,
            'Review',
            '  Apply',
            Icon(
              Icons.reviews,
            ),
            Icon(
              Icons.play_arrow,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

List<dynamic> Remote_Jobs = [
  {'Heading': '', 'image': ''}
];

launchURLApp() async {
  var url = Uri.parse("https://www.geeksforgeeks.org/");
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}
