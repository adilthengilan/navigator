import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:navigator_portal/view/desktop_view/home_dashboard/Assistance_and_Support/assistance.dart';
import 'package:navigator_portal/view/desktop_view/home_dashboard/dashboard/dashboard.dart';
import 'dart:ui';

class Cources_Screen extends StatelessWidget {
  const Cources_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20, left: 20),
            child: Text(
              'Skill up Cources',
              style: GoogleFonts.poppins(
                  fontSize: width * 0.018, fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: height * 0.55,
            width: width * 1,
            child: Lists_for_all(
              height,
              width,
              Skill_up_Cources,
              'Review',
              '   Enroll',
              Icon(
                Icons.reviews,
                size: width * 0.01,
              ),
              Icon(
                Icons.play_arrow,
                size: width * 0.01,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, left: 20),
            child: Text(
              'Soft Skill Training',
              style: GoogleFonts.poppins(
                  fontSize: width * 0.018, fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: height * 0.55,
            width: width * 1,
            child: Lists_for_all(
              height,
              width,
              Soft_skill_Cources,
              'Review',
              '   Enroll',
              Icon(
                Icons.reviews,
                size: width * 0.01,
              ),
              Icon(
                Icons.play_arrow,
                size: width * 0.01,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<dynamic> Skill_up_Cources = [
  {
    'Heading': 'Flutter Development',
    'image': 'assets/images/cources/flutter logo.png'
  },
  {
    'Heading': 'React Development',
    'image': 'assets/images/cources/react logo.png',
  },
  {
    'Heading': 'Python',
    'image': 'assets/images/cources/python logo.jpeg',
  },
  {
    'Heading': 'HTML',
    'image': 'assets/images/cources/html logo.jpeg',
  },
  {
    'Heading': 'CSS',
    'image': 'assets/images/cources/css logo.png',
  },
  {
    'Heading': 'JS',
    'image': 'assets/images/cources/js logo.png',
  },
  {
    'Heading': 'Artificial intelligence',
    'image': 'assets/images/cources/Ai logo.png',
  },
  {'Heading': 'Digital Marketing', 'image': 'assets/images/cources/DM logo.png'}
];

List<dynamic> Soft_skill_Cources = [
  {
    'Heading': 'Team Work',
    'image': 'assets/images/soft skill course/team work logo.jpeg'
  }
];
