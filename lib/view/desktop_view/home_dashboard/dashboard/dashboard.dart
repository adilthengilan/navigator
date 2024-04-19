import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:navigator_portal/controller/indexController/webviewmain_indexController.dart';
import 'package:navigator_portal/model/widgets/constant.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
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
                    hintStyle: GoogleFonts.poppins(fontSize: 16),
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
            child: showList(),
            width: double.infinity,
          )
        ],
      ),
    );
  }
}

////////////////////
///Show List is containing simple navigation to the expected and overreview of the programs like , cource , materials,
/// faculties etc...
Widget showList() {
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
                          : Colors.black),
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
