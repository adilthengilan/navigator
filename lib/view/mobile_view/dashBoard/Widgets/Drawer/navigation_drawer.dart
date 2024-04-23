import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:navigator_portal/model/widgets/constant.dart';
import 'package:navigator_portal/view/mobile_view/dashBoard/Widgets/Drawer/drawer_buttons.dart';

class MvDrawer extends StatelessWidget {
  final double width;
  final double height;
  const MvDrawer({
    super.key,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      width: width / 1.5,
      shape: BeveledRectangleBorder(),
      child: Column(
        children: [
          sizedBox(20, 0),
          Text(
            "TECHNI",
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: width * 0.068,
                letterSpacing: 1
              ),
            ),
          ),
          Text(
            "____Powered By____",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w200,
              fontSize: width * 0.030,
            ),
          ),
          Image.asset(
            "assets/images/logobluetext.png",
            width: width / 3.5,
            height: 30,
          ),
          sizedBox(20, 0),
          Divider(thickness: 0.3),
          sizedBox(10, 0),
          DrawerButtons(width: width, height: height),
        ],
      ),
    );
  }
}
