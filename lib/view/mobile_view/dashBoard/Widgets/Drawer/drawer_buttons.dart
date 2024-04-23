import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:navigator_portal/controller/indexController/indexController.dart';
import 'package:navigator_portal/model/widgets/constant.dart';
import 'package:navigator_portal/view/desktop_view/home_dashboard/navigation_dashboard.dart';

class DrawerButtons extends StatelessWidget {
  final double width;
  final double height;
  const DrawerButtons({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    final Indexes indexes = Get.put(Indexes()); // Instantiate CounterController

    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: navigationButtons.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Obx(
                  () => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: InkWell(
                      
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        indexes.mvDrawerIndex.value = index;
                      },
                      child: Container(
                        height: height * 0.062,
                        width: width / 1.5,
                        decoration: BoxDecoration(
                            gradient: indexes.mvDrawerIndex == index
                                ? RadialGradient(colors: [
                                    Colors.white,
                                    Color.fromARGB(255, 158, 151, 255),
                                  ], radius: 10)
                                : RadialGradient(
                                    colors: [Colors.transparent, Colors.transparent]),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              sizedBox(0, 10),
                              Image(
                                height: height * 0.085,
                                width: width * 0.085,
                                image: AssetImage(
                                  navigattionButtonsIcon[index],
                                ),
                              ),
                              sizedBox(0, 15),
                              Text(
                                navigationButtons[index],
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: width * 0.034,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
