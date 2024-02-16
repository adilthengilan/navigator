import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:navigator_portal/model/widgets/constant.dart';
import 'package:navigator_portal/model/widgets/texts.dart';
import 'package:navigator_portal/view/desktop_view/home/image_widgets.dart';
import 'package:navigator_portal/view/desktop_view/widgets/list_widgets.dart';

class Home extends StatefulWidget {
  final double height;
  final double width;
  const Home({super.key, required this.height, required this.width});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        sizedBox(100, 0),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(
                height: widget.height * 0.50,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 154, 154, 154),
                    borderRadius: BorderRadius.circular(40)),
              ),
              Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(left: widget.width * 0.15, top: 10),
                    child: SizedBox(
                      width: widget.width * 0.55,
                      child: Text(
                        HomeHeadingText,
                        style: GoogleFonts.poppins(
                            fontSize: 60,
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: widget.width * 0.15, top: 10),
                    child: SizedBox(
                      width: widget.width * 0.55,
                      child: Text(
                        HomeSubHeadingText,
                        style: GoogleFonts.poppins(
                            fontSize: 25,
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  sizedBox(20, 0),
                  Padding(
                      padding:
                          EdgeInsets.only(left: widget.width * 0.15, top: 10),
                      child: Container(
                        height: widget.height * 0.06,
                        width: widget.width * 0.15,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(25)),
                        child: Center(
                          child: Text(
                            'Learn More...',
                            style: GoogleFonts.alef(
                                color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ))
                ],
              ),
              ImageContainer(widget.height)
            ],
          ),
        ),
        sizedBox(50, 0),
        Container(
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.elliptical(
                    1000,
                    100,
                  ),
                  topRight: Radius.elliptical(1000, 100)),
              color: Colors.white),
        ),
        Container(
          width: double.infinity,
          color: Colors.white,
          child: Column(
            children: [
              Text(
                HomeSubHeading1,
                style: GoogleFonts.poppins(
                    fontSize: 40, fontWeight: FontWeight.w700),
              ),
              sizedBox(100, 0),
              Container(
                height: widget.height * 0.09,
                width: double.infinity,
                child: Universities(),
              ),
              sizedBox(150, 0),
              Text(
                HomeSubHeading2,
                style: GoogleFonts.poppins(
                    fontSize: 40, fontWeight: FontWeight.w700),
              ),
              sizedBox(100, 0),
              SizedBox(height: widget.height * 0.7, child: Cources()),
              sizedBox(widget.height * 0.05, 0)
            ],
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
        )
      ],
    );
  }
}

class Universities extends StatefulWidget {
  const Universities({super.key});

  @override
  State<Universities> createState() => _UniversitiesState();
}

class _UniversitiesState extends State<Universities> {
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _startAutoScroll() {
    Timer(Duration(milliseconds: 50), () {
      if (_scrollController.hasClients) {
        _scrollController
            .animateTo(
          _scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 10000),
          curve: Curves.easeInOut,
        )
            .then((value) {
          _scrollController.jumpTo(0.0);
          _startAutoScroll();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<String> universities = [
      "Jain University",
      "Yenepoya University",
      "Vignan University",
      "Hindustan University",
      "Google For",
      "Jain University",
      "Yenepoya University",
      "Vignan University",
      "Hindustan University",
      "Google For",
    ];
    return ListView.builder(
      controller: _scrollController,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: universities.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.all(10),
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    spreadRadius: 2,
                    color: Color.fromARGB(255, 229, 229, 229),
                    blurStyle: BlurStyle.normal,
                    blurRadius: 10)
              ]),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/cap.png'))),
                ),
                Center(
                    child: Text(
                  universities[index],
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                )),
                sizedBox(0, 20)
              ],
            ),
          ),
        );
      },
    );
  }
}
