import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:navigator_portal/model/widgets/constant.dart';
import 'package:navigator_portal/model/widgets/texts.dart';

class MvCourse extends StatefulWidget {
  final double height;
  final double width;
  const MvCourse({
    super.key,
    required this.height,
    required this.width,
  });

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
          style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w700),
        ),
        sizedBox(80, 0),
        GridView.builder(
          padding: EdgeInsets.symmetric(vertical: 10),
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: Providing_Programs.length,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 80,
              childAspectRatio: widget.width * 2 / widget.height * .85),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: (){},
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: decorations_of_the_Container,
                child: inner_part_of_the_Containers(index),
              ),
            );
          },
        ),
      ],
    );
  }

  final decorations_of_the_Container = BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          offset: Offset(2, 2),
          spreadRadius: .2,
          blurRadius: 2,
          color: Color.fromARGB(255, 218, 218, 218),
          blurStyle: BlurStyle.normal,
        )
      ],
    );

  Padding inner_part_of_the_Containers(int index) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            height: widget.height / 3.4,
            width: widget.width,
            image: AssetImage("assets/images/Create a image  013b7cc9-68ad-4838-9360-f9acb6387489.png"),
            fit: BoxFit.cover,
          ),
          sizedBox(10, 0),
          Text(
            Providing_Programs[index],
            style:
                GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w600),
          ),
          sizedBox(10, 0),
          Text("this is an Start up consultancy, its supporting to which students would like study in out of country or state",
            style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
