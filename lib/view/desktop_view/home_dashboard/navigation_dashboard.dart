import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:navigator_portal/controller/indexController/webviewmain_indexController.dart';
import 'package:navigator_portal/model/widgets/constant.dart';
import 'package:navigator_portal/view/desktop_view/home_dashboard/Assistance_and_Support/assistance.dart';
import 'package:navigator_portal/view/desktop_view/home_dashboard/cources/cources_screen.dart';
import 'package:navigator_portal/view/desktop_view/home_dashboard/dashboard/dashboard.dart';
import 'package:navigator_portal/view/desktop_view/home_dashboard/study_materials/study_materials_screen.dart';

class Navigation_dashBoard extends StatefulWidget {
  const Navigation_dashBoard({super.key});

  @override
  State<Navigation_dashBoard> createState() => _Navigation_dashBoardState();
}

class _Navigation_dashBoardState extends State<Navigation_dashBoard> {
  @override
  Widget build(BuildContext context) {
    final NavigationBarController indexes =
        Get.put(NavigationBarController()) // Instantiate CounterController
        ;
    final Height = MediaQuery.of(context).size.height;
    final Width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: NeverScrollableScrollPhysics(),
        child: Row(
          children: [
            Container(
              height: 1000,
              width: 300,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      right: BorderSide(
                          color: Color.fromARGB(255, 233, 233, 233)))),
              child: Center(
                  child: Column(
                children: [
                  sizedBox(20, 0),
                  Text(
                    'TECHNI',
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w700),
                  ),
                  Text('Powered by'),
                  SizedBox(
                      height: Height * 0.05,
                      width: Width * 0.1,
                      child: Image(
                          image: AssetImage('assets/images/logobluetext.png'))),
                  sizedBox(20, 0),
                  Divider(
                    thickness: 1,
                    color: Colors.grey,
                  ),
                  sizedBox(10, 0),
                  Container(
                    width: 300,
                    child: navigationList(Width),
                  )
                ],
              )),
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 70,
                    width: Width * 1,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                            bottom: BorderSide(
                                color:
                                    const Color.fromARGB(255, 230, 230, 230)))),
                    child: Row(
                      children: [
                        sizedBox(0, 50),
                        Container(
                          width: Width * 0.42,
                          child: Row(
                            children: [
                              SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: Obx(
                                    () => Image.asset(
                                        '${navigattionButtonsIcon[indexes.navigationindex.value]}'),
                                  )),
                              sizedBox(0, 10),
                              Obx(
                                () => Text(
                                  '${navigationButtons[indexes.navigationindex.value]}',
                                  style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: Width * 0.02),
                                ),
                              ),
                            ],
                          ),
                        ),
                        sizedBox(0, Width / 6),
                        SizedBox(
                          width: Width / 7,
                          child: Text(
                            'Mr, Adil Thengilan',
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: Width * 0.015),
                          ),
                        ),
                        sizedBox(0, 10),
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.grey,
                        )
                      ],
                    ),
                  ),
                  Obx(
                    () => Container(
                      width: Width * 0.805,
                      height: Height / 1.11,
                      child: screens[indexes.navigationindex.value],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget navigationList(width) {
  final NavigationBarController indexes =
      Get.put(NavigationBarController()) // Instantiate CounterController
      ;
  return ListView.builder(
    shrinkWrap: true,
    itemCount: navigationButtons.length,
    itemBuilder: (context, index) {
      return InkWell(
        onTap: () {
          indexes.navigationindex.value = index;
        },
        child: Obx(
          () => Container(
            height: 50,
            width: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: indexes.navigationindex.value == index
                    ? RadialGradient(colors: [
                        Colors.white,
                        Color.fromARGB(255, 196, 192, 255),
                      ], radius: 10)
                    : RadialGradient(colors: [Colors.white, Colors.white])),
            child: Center(
              child: Row(
                children: [
                  sizedBox(0, 10),
                  Center(
                      child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage('${navigattionButtonsIcon[index]}'),
                            fit: BoxFit.fill)),
                  )),
                  sizedBox(0, 20),
                  Text(
                    '${navigationButtons[index]}',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600, fontSize: width * 0.01),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

List<Widget> screens = [
  DashBoard(),
  Cources_Screen(),
  Study_Materials_Screen(),
  Assistance_Screen()
];

List<String> navigationButtons = [
  'Dashboard',
  'Cources',
  'StudyMaterials',
  'Assistance',
  'Support',
];
List<String> navigattionButtonsIcon = [
  'assets/images/dashboard_icon.png',
  'assets/images/cap.png',
  'assets/images/studymaterials.png',
  'assets/images/internship (2).png',
  'assets/images/internship (1).png',
];
