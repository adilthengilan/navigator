import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:navigator_portal/controller/indexController/indexController.dart';
import 'package:navigator_portal/model/widgets/colors.dart';
import 'package:navigator_portal/model/widgets/constant.dart';
import 'package:navigator_portal/model/widgets/texts.dart';
import 'package:navigator_portal/view/desktop_view/home/desktop_homes.dart';
import 'package:navigator_portal/view/tab_view/widgets/course_list.dart';
import 'package:navigator_portal/view/tab_view/widgets/image_container.dart';

class TabView extends StatefulWidget {
  const TabView({super.key});

  @override
  State<TabView> createState() => _HomePageState();
}

class _HomePageState extends State<TabView> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final Indexes indexes = Get.put(Indexes()); // Instantiate CounterController

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [bgColor1, bgColor2],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
            leading: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/Logo.png'))),
              width: 100,
              height: 100,
            ),
            actions: [
              SizedBox(height: 30, child: AppBarButtons()),
              sizedBox(0, width * 0.10),
              Container(
                height: 40,
                width: width * 0.15,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 91, 67, 129),
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                  child: Text(
                    'Providers',
                    style: GoogleFonts.poppins(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              sizedBox(0, width * 0.05),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search_rounded,
                    color: Colors.green.shade400,
                  ))
            ]),
        body: Stack(children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        height: height * 0.50,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 154, 154, 154),
                            borderRadius: BorderRadius.circular(40)),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.only(left: width * 0.15, top: 10),
                            child: SizedBox(
                              width: width * 0.55,
                              child: Text(
                                HomeHeadingText,
                                style: GoogleFonts.poppins(
                                    fontSize: 40,
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(left: width * 0.15, top: 10),
                            child: SizedBox(
                              width: width * 0.55,
                              child: Text(
                                HomeHeadingText,
                                style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                          sizedBox(20, 0),
                          Padding(
                              padding:
                                  EdgeInsets.only(left: width * 0.15, top: 10),
                              child: Container(
                                height: height * 0.06,
                                width: width * 0.15,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 91, 67, 129),
                                    borderRadius: BorderRadius.circular(25)),
                                child: Center(
                                  child: Text(
                                    'Learn More...',
                                    style: GoogleFonts.poppins(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                ),
                              ))
                        ],
                      ), /////////////////////////////////////////////////////////////
                      ///////////////////////////////////////////////////////
                      //////////////////////////////////////////
                      ///
                      Image_Container_for_tabview(height)
                    ],
                  ),
                ),
                sizedBox(50, 0),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.elliptical(
                            1000,
                            100,
                          ),
                          topRight: Radius.elliptical(1000, 100)),
                      color: Colors.white),
                  child: Column(
                    children: [
                      sizedBox(100, 0),
                      Text(
                        HomeSubHeading1,
                        style: GoogleFonts.poppins(
                            fontSize: 25, fontWeight: FontWeight.w700),
                      ),
                      sizedBox(50, width),
                      SizedBox(
                        height: 70,
                        width: double.infinity,
                        child: Universities(),
                      ),
                      sizedBox(150, width),
                      Text(
                        HomeSubHeading2,
                        style: GoogleFonts.poppins(
                            fontSize: 25, fontWeight: FontWeight.w700),
                      ),
                      sizedBox(150, width),
                      SizedBox(
                        width: double.infinity,
                        child: Course_List(
                          height: height,
                          width: width,
                        ),
                      ),
                      sizedBox(150, width),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Container(
          //   height: 400,
          //   width: 400,
          //   decoration: BoxDecoration(
          //       image: DecorationImage(
          //           image: AssetImage(
          //               'assets/images/Create a image  013b7cc9-68ad-4838-9360-f9acb6387489.png'),s
          //           fit: BoxFit.fill)),
          // )
        ]),
        floatingActionButton: FloatingActionButton(
          shape: CircleBorder(),
          onPressed: () {
            // Scroll to the bottom
            _scrollController.animateTo(
              _scrollController.position.minScrollExtent,
              duration: Duration(milliseconds: 400),
              curve: Curves.linear,
            );
          },
          tooltip: 'Scroll to Bottom',
          child: Icon(Icons.arrow_upward),
        ),
      ),
    );
  }

  Widget AppBarButtons() {
    final Indexes indexes = Get.put(Indexes()); // Instantiate CounterController

    List<String> buttons = [
      // Text(
      //   'Home',
      //   style: AppBarStyle,
      // ),
      // Text('About', style: AppBarStyle),
      // Text('Service', style: AppBarStyle),
      // Text('Blog', style: AppBarStyle),
      // Text('Contact', style: AppBarStyle)
      'Home', 'About', 'Service', 'Blog', 'Contact'
    ];

    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: buttons.length,
      itemBuilder: (context, index) {
        return TextButton(
            onPressed: () {
              indexes.SelectedIndexes.value = index;
              switch (index) {
                case 0:
                  _scrollToPosition(0);
                case 1:
                  _scrollToPosition(200);
                case 2:
                  _scrollToPosition(400);

                case 3:
                  _scrollToPosition(600);
                case 4:
                  _scrollToPosition(800);
              }
            },
            child: Obx(
              () => Text(
                buttons[index],
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    color: indexes.SelectedIndexes == index
                        ? Color.fromARGB(255, 107, 38, 144)
                        : Colors.black),
              ),
            ));
      },
    );
  }

  void _scrollToPosition(double position) {
    _scrollController.animateTo(
      position,
      duration: Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }
}

Widget container(double height, double width, Color color, double radius) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
        color: color, borderRadius: BorderRadius.circular(radius)),
  );
}
