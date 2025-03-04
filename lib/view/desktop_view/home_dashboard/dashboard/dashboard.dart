import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:navigator_portal/controller/indexController/webviewmain_indexController.dart';
import 'package:navigator_portal/model/widgets/constant.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'dart:ui';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  // void inti
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    // final _youtubecontroller = YoutubePlayerController();
    final sideHeading = GoogleFonts.poppins(
        fontSize: width * 0.016, fontWeight: FontWeight.w600);
    return SingleChildScrollView(
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: height * 0.02),
            width: width * 0.7,
            height: height * 0.06,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(255, 236, 236, 236)),
            child: TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 9),
                    border: InputBorder.none,
                    hintText: 'Search the new things...',
                    hintStyle: GoogleFonts.poppins(
                        fontSize: 16, fontFeatures: List.empty()),
                    prefixIcon: Icon(Icons.search),
                    suffix: InkWell(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.only(right: 10, bottom: 12),
                        height: 30,
                        width: 100,
                        child: Center(
                          child: Text(
                            'Search',
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 101, 74, 127),
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ))),
          ),
          sizedBox(20, 0),
          SizedBox(
            height: height * 0.2,
            child: showList(width),
            width: double.infinity,
          ),
          sizedBox(height * 0.05, 0),
          RecentActivityList.isNotEmpty
              ? Row(
                  children: [
                    sizedBox(0, 30),
                    Text(
                      'Recent Activity',
                      style: sideHeading,
                    ),
                    sizedBox(0, 10),
                    SizedBox(
                        height: 30,
                        width: 30,
                        child: Image.asset('assets/images/recent icon.png'))
                  ],
                )
              : SizedBox(),
          sizedBox(10, 0),
          RecentActivityList.isEmpty
              ? SizedBox()
              : SizedBox(
                  height: height * 0.55,
                  width: width * 1,
                  child: Lists_for_all(
                    height,
                    width,
                    RecentActivityList,
                    'Cancel',
                    'Resume',
                    Icon(Icons.close),
                    Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                    ),
                  ),
                ),
          sizedBox(30, 0),
          Row(children: [
            sizedBox(0, width * 0.01),
            Text(
              'Latest Tech News',
              style: sideHeading,
            ),
            Icon(
              Icons.new_releases,
              color: Colors.red,
            )
          ]),
          SizedBox(
            height: height * 0.55,
            width: width * 1,
            child: Lists_for_all(
              height,
              width,
              latestTechNews,
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

///---------------------------------Show List is containing simple navigation to the expected and overreview of the programs like , cource , materials,
/// faculties etc...
Widget showList(width) {
  final NavigationBarController indexes =
      Get.put(NavigationBarController()) // Instantiate CounterController
      ;
  return GridView.builder(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 10 / 30,
    ),
    scrollDirection: Axis.horizontal,
    itemCount: showList_Content.length,
    itemBuilder: (context, index) {
      return MouseRegion(
        onEnter: (event) {
          indexes.isenter = true;
          indexes.showContent_index.value = index;
        },
        onExit: (event) {
          indexes.isenter = false;
        },
        child: Obx(
          () => Container(
            margin: EdgeInsets.all(10),
            height: 30,
            decoration: BoxDecoration(
              color: indexes.showContent_index == index
                  ? Color.fromARGB(255, 73, 71, 105)
                  : Color.fromARGB(255, 242, 242, 242),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: Obx(
                () => Text(
                  '${showList_Content[index]}',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      color: indexes.showContent_index == index
                          ? Colors.white
                          : Colors.black,
                      fontSize: width * 0.009),
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}

List<dynamic> showList_Content = [
  'Cources',
  'Soft Skills',
  'Study Materials',
  'Internship Assistance',
  'Placement cell',
  'Job Assistance',
  'Freelance Works',
  'Latest Tech News',
  'Skill up Cources',
  'Work Status',
  'Community',
  'Events',
  'Meetings',
  'Support'
];

Widget Lists_for_all(
  height,
  width,
  List,
  Button1,
  Button2,
  Icon icon1,
  Icon icon2,
) {
  return ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: List.length,
    itemBuilder: (context, index) {
      return Container(
        width: width * 0.197,
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromARGB(255, 248, 248, 248),
            boxShadow: [
              BoxShadow(
                  blurRadius: 10,
                  blurStyle: BlurStyle.normal,
                  spreadRadius: 5,
                  color: Color.fromARGB(255, 238, 238, 238))
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 15, left: 15, right: 15),
              height: height / 3,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('${List[index]['image']}'),
                      fit: BoxFit.fill),
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(5)),
            ),
            Container(
              margin: EdgeInsets.only(top: 6),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30), color: Colors.white),
              height: height * 0.05,
              width: width * 0.18,
              child: Center(
                  child: Text(
                List[index]['Heading'],
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500, fontSize: width * 0.01),
              )),
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    // Button1 == 'Cancel'
                    //     ? [RecentActivityList.remove(List[index]),
                    //     RecentActivityListLOgo.remove(ImageList[index])]
                    //     : SizedBox(); 
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      top: 8,
                      left: width * 0.0095,
                      right: width * 0.0095,
                    ),
                    height: height * 0.05,
                    width: width * 0.08,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(30)),
                    child: Row(
                      children: [
                        sizedBox(0, width * 0.015),
                        Text(
                          Button1,
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: width * 0.01),
                        ),
                        sizedBox(0, 5),
                        // Icon(
                        //   Icons.close,
                        //   color: Colors.black,
                        // )
                        icon1
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    RecentActivityList.contains(List[index])
                        ? 0
                        : addtorecent(List[index]);
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      top: 8,
                      left: width * 0.009,
                    ),
                    height: height * 0.05,
                    width: width * 0.08,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 73, 71, 105),
                        borderRadius: BorderRadius.circular(30)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        sizedBox(0, width * 0.015),
                        Text(
                          Button2,
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: width * 0.01),
                        ),
                        icon2
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      );
    },
  );
}

// ----------------Function for add to recent activtiy ----------------------
void addtorecent(data) {
  RecentActivityList.add(data);
}

//---------------------Recent Activity List here  ------------------------------
List<dynamic> RecentActivityList = [
  {'Heading': '', 'image': ''}
];

// -----------------------Here have the New updates session for everyone ---------------------
List<dynamic> newUpdates = [''];

// -----------------------------Here have the Latest Tech News session for users --------------------
List<dynamic> latestTechNews = [
  {'Heading': '', 'image': ''}
];
