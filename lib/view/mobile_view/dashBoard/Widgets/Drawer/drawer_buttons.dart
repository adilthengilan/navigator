import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:navigator_portal/controller/indexController/indexController.dart';
import 'package:navigator_portal/model/widgets/colors.dart';
import 'package:navigator_portal/model/widgets/constant.dart';
import 'package:navigator_portal/view/mobile_view/dashBoard/Widgets/Drawer/student_reference.dart';

class DrawerButtons extends StatelessWidget {
  final double width;
  final double height;
  const DrawerButtons({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    final Indexes indexes = Get.put(Indexes()); // Instantiate CounterController

    List<String> buttons = ['Home', 'About', 'Service', 'Blog', 'Contact'];

    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: buttons.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Divider(thickness: .3),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Obx(
                    () => TextButton(
                      style: TextButton.styleFrom(),
                      onPressed: () {
                        indexes.mvDrawerIndex.value = index;
                        switch (index) {
                          case 0: 
                          case 1:
                          case 2:
                          case 3:
                          case 4:
                        }
                      },
                      child: Text(buttons[index],
                          style: GoogleFonts.poppins(
                              color: indexes.mvDrawerIndex.value == index
                                  ? bgColor2
                                  : Colors.black)),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
        sizedBox(30, 0),
        InkWell(
          onTap: () {
            // Student reference Box
            studentProviderShowdialog(context);
          },
          child: Container(
            height: 40,
            width: width / 2,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 91, 67, 129),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: Text(
                'Providers',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
