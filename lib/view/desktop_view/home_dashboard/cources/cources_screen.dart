import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:navigator_portal/view/desktop_view/home_dashboard/dashboard/dashboard.dart';

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
                Icon(Icons.reviews),
                Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                )),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, left: 20),
            child: Text(
              'Soft Skill Cources',
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
                Icon(Icons.reviews),
                Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                )),
          ),
        ],
      ),
    );
  }
}

List<dynamic> Skill_up_Cources = [
  'Flutter Development',
  'React Development',
  'Python',
  'HTML',
  'CSS'
];

List<dynamic> Soft_skill_Cources = ['Language Training'];
