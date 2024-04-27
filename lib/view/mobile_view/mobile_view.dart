import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:navigator_portal/controller/indexController/indexController.dart';
import 'package:navigator_portal/model/widgets/constant.dart';
import 'package:navigator_portal/view/mobile_view/Assistance/assistance_screen.dart';
import 'package:navigator_portal/view/mobile_view/Course/Course_screen.dart';
import 'package:navigator_portal/view/mobile_view/DashBoard/Widgets/Drawer/navigation_drawer.dart';
import 'package:navigator_portal/view/mobile_view/DashBoard/dashboard_screen.dart';
import 'package:navigator_portal/view/mobile_view/Study%20Materials/Study_Materials.dart';

class MobileView extends StatefulWidget {
  const MobileView({super.key});

  @override
  State<MobileView> createState() => _HomePageState();
}

class _HomePageState extends State<MobileView> {
  @override
  Widget build(BuildContext context) {
    final Indexes indexes = Get.put(Indexes());
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    List<Widget> MvDrawerButtonsScreens = [
      MVDashBoard(height: height, width: width),
      MvCourse(height: height, width: width),
      MvStudyMaterials(height: height, width: width),
      MvAssistance(height: height, width: width),
      MvAssistance(height: height, width: width),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.8,
        actions: [
          Text(
            "Hi, Naheel J",
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: width * 0.038,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          sizedBox(0, 10),
          CircleAvatar(
            radius: width * 0.040,
            foregroundImage: AssetImage("assets/images/personal.png"),
          ),
          sizedBox(0, 10),
        ],
      ),
      drawer: MvDrawer(width: width, height: height),
      body: Obx(
        () => MvDrawerButtonsScreens[indexes.mvDrawerIndex.value],
      ),
    );
  }
}
