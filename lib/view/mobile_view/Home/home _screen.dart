import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:navigator_portal/model/widgets/constant.dart';
import 'package:navigator_portal/model/widgets/texts.dart';
import 'package:navigator_portal/view/desktop_view/home/desktop_homes.dart';
import 'package:navigator_portal/view/desktop_view/home/image_widgets.dart';
import 'package:navigator_portal/view/mobile_view/Home/home_image.dart';
import 'package:navigator_portal/view/tab_view/widgets/image_container.dart';

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
        Padding(
          padding: const EdgeInsets.only(left: 20,right: 60),
          child: SizedBox(
            child: Text(
              HomeHeadingText,
              textAlign: TextAlign.start,
              style: GoogleFonts.poppins(
                fontSize: 26,
                color: const Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        sizedBox(15, 0),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 15),
          child: SizedBox(
            child: Text(
              HomeSubHeadingText,
              textAlign: TextAlign.start,
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: const Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        sizedBox(40, 0),
        Center(
          child: Container(
            height: 40,
            width: 120,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(25)),
            child: Center(
              child: Text(
                'Learn More...',
                style: GoogleFonts.alef(color: Colors.white, fontSize: 14),
              ),
            ),
          ),
        ),
        sizedBox(50, 0),
        Image_Container_for_MobileView(widget.height),
        sizedBox(50, 0),
        Container(
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
              Text(
                HomeSubHeading1,
                style: GoogleFonts.poppins(
                    fontSize: 22, fontWeight: FontWeight.w700),
              ),
              sizedBox(50, 0),
              SizedBox(
                height: widget.height * 0.09,
                width: double.infinity,
                child: Universities(),
              ),
              sizedBox(50, 0),
              Text(
                HomeSubHeading2,
                style: GoogleFonts.poppins(
                    fontSize: 24, fontWeight: FontWeight.w700),
              ),
              sizedBox(100, 0),
              // // SizedBox(height: widget.height * 0.7, child: Cources()),
              // sizedBox(widget.height * 0.05, 0)
            ],
            
          ),
        ),
      ],
    );
  }
}
