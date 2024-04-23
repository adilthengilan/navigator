import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:navigator_portal/model/widgets/constant.dart';
import 'package:navigator_portal/model/widgets/texts.dart';
import 'package:navigator_portal/view/desktop_view/home/desktop_homes.dart';


class MvHomeScreen extends StatefulWidget {
  final double width;
  final double height;
  const MvHomeScreen({
    super.key,
    required this.width,
    required this.height,
  });

  @override
  State<MvHomeScreen> createState() => _MvHomeScreenState();
}

class _MvHomeScreenState extends State<MvHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MvHome(
        height: widget.height,
        width: widget.width,
      ),
    );
  }
}

class MvHome extends StatefulWidget {
  final double height;
  final double width;
  const MvHome({
    super.key,
    required this.height,
    required this.width,
  });

  @override
  State<MvHome> createState() => _MvHomeState();
}

class _MvHomeState extends State<MvHome> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        sizedBox(60, 0),
        Container(
          margin: EdgeInsets.only(left: widget.width / 15,right: widget.width / 10),
          child: Column(
            children: [
              Text(
                HomeHeadingText,
                textAlign: TextAlign.start,
                style: GoogleFonts.poppins(
                  fontSize: 32,
                  color:  Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
              sizedBox(15, 0),
              Text(
                HomeSubHeadingText,
                textAlign: TextAlign.start,
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),        
        sizedBox(60, 0),
        sizedBox(60, 0),
        Center(
          child: Container(
            height: 40,
            width: 120,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Center(
              child: Text(
                'Learn More...',
                style: GoogleFonts.alef(color: Colors.white, fontSize: 14),
              ),
            ),
          ),
        ),
        sizedBox(60, 0),
        Container(
          // Curved Behavior Box
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.elliptical(1000, 100),
                topRight: Radius.elliptical(1000, 100)),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              sizedBox(widget.height * .12, 0),
              SizedBox(
                width: widget.width / 1.5,
                child: Text(
                  HomeSubHeading1,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      fontSize: 24, fontWeight: FontWeight.w700),
                ),
              ),
              sizedBox(80, 0),
              SizedBox(
                height: widget.height * 0.09,
                width: double.infinity,
                child: Universities(),
              ),
              sizedBox(80, 0),
              sizedBox(80, 0)
            ],
          ),
        ),
      ],
    );
  }
}
