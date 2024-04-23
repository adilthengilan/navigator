import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:navigator_portal/controller/indexController/indexController.dart';
import 'package:navigator_portal/model/widgets/constant.dart';
import 'package:navigator_portal/view/desktop_view/home_dashboard/navigation_dashboard.dart';
import 'package:navigator_portal/view/mobile_view/DashBoard/Widgets/Drawer/navigation_drawer.dart';

class MVDashBoard extends StatefulWidget {
  const MVDashBoard({super.key});

  @override
  State<MVDashBoard> createState() => _MVDashBoardState();
}

class _MVDashBoardState extends State<MVDashBoard> {
  @override
  Widget build(BuildContext context) {
    final Indexes indexes = Get.put(Indexes()); // Instantiate CounterController
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.8,
        title: Obx(
          () => Text(
            navigationButtons[indexes.mvDrawerIndex.value],
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: width * 0.04,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
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
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: height * 0.01,
              left: width * 0.03,
              right: width * 0.03,
            ),
            width: width,
            height: height * 0.05,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color.fromARGB(255, 236, 236, 236),
            ),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(top: height * 0.003),
                border: InputBorder.none,
                hintText: 'Search the new things...',
                hintStyle: GoogleFonts.poppins(fontSize: width * 0.04),
                prefixIcon: Icon(Icons.search),
                suffix: TextButton(
                  style: TextButton.styleFrom(),
                  onPressed: () {},
                  child: Text(
                    "Search",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(fontSize: width * 0.04),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
