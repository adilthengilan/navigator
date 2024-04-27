//
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:navigator_portal/controller/indexController/indexController.dart';
import 'package:navigator_portal/model/widgets/constant.dart';
import 'package:navigator_portal/view/desktop_view/home_dashboard/dashboard/dashboard.dart';
import 'package:navigator_portal/view/desktop_view/home_dashboard/navigation_dashboard.dart';

class MVDashBoard extends StatefulWidget {
  final double height;
  final double width;
  const MVDashBoard({
    super.key,
    required this.height,
    required this.width,
  });

  @override
  State<MVDashBoard> createState() => _MVDashBoardState();
}

class _MVDashBoardState extends State<MVDashBoard> {
  @override
  Widget build(BuildContext context) {
    final Indexes indexes = Get.put(Indexes());
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            sizedBox(0, widget.width * 0.04),
            //========================================== Page Tieles & Icon Image ================================================
            Obx(
              () => Image(
                height: widget.width * 0.12,
                width: widget.width * 0.12,
                image: AssetImage(
                  navigattionButtonsIcon[indexes.mvDrawerIndex.value],
                ),
              ),
            ),
            sizedBox(0, 10),
            Obx(
              () => Text(
                navigationButtons[indexes.mvDrawerIndex.value],
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: widget.width * 0.046,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
        //=========================================== DashBoard's Search Bar =========================================
        Container(
          margin: EdgeInsets.only(
            top: widget.height * 0.01,
            left: widget.width * 0.04,
            right: widget.width * 0.04,
          ),
          width: widget.width,
          height: widget.height * 0.05,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromARGB(255, 236, 236, 236),
          ),
          child: TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(bottom: widget.height * 0.018),
              border: InputBorder.none,
              hintText: 'Search the new things...',
              hintStyle: GoogleFonts.poppins(fontSize: widget.width * 0.04),
              prefixIcon: Icon(Icons.search),
              suffix: TextButton(
                style: TextButton.styleFrom(),
                onPressed: () {},
                child: Text(
                  "Search",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(fontSize: widget.width * 0.04),
                  ),
                ),
              ),
            ),
          ),
        ),
        sizedBox(widget.height * 0.015, 0),
        navigatorrServicesButtonsList(indexes)
      ],
    );
  }

// Display a list of buttons representing services offered on the app, positioned at the top of the dashboard.
// Takes an object of the `indexes` class from the GetX controller as a parameter.
// If `mvShowMore` is false, only the first four buttons are shown; if `mvShowMore` is true, all buttons are displayed.
  Widget navigatorrServicesButtonsList(indexes) {
    return Obx(
      () => Wrap(
        children: [
          ...(indexes.mvShowMore.value
                  ? showList_Content
                  : showList_Content.take(4).toList())
              .map(
                (contents) => Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: widget.width * 0.02,
                    vertical: widget.height * 0.006,
                  ),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 237, 236, 236),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      child: Text(
                        contents,
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: widget.width * 0.04,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
          //======================= // Display "See More" if mvShowMore is False, otherwise display "See Less"=====================
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: widget.width * 0.02,
              vertical: widget.height * 0.006,
            ),
            child: TextButton(
              onPressed: () {
                indexes.mVShowMoreButtons();
              },
              child: Text(
                indexes.mvShowMore.value ? "See Less" : "See More",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: widget.width * 0.03,
                    fontWeight: FontWeight.w500,
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
