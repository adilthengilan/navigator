import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:navigator_portal/model/widgets/constant.dart';
import 'package:navigator_portal/model/widgets/texts.dart';

class MvCourse extends StatefulWidget {
  const MvCourse({super.key});

  @override
  State<MvCourse> createState() => _MvCourseState();
}

class _MvCourseState extends State<MvCourse> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          HomeSubHeading2,
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        sizedBox(100, 0),
        GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: 10,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              childAspectRatio: 10 / 10),
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    spreadRadius: .2,
                    blurRadius: 1,
                    color: Color.fromARGB(255, 218, 218, 218),
                    blurStyle: BlurStyle.normal,
                  )
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
