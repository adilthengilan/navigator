import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:navigator_portal/controller/indexController/indexController.dart';
import 'package:navigator_portal/model/widgets/colors.dart';
import 'package:navigator_portal/model/widgets/constant.dart';
import 'package:navigator_portal/view/desktop_view/contacts/contact.dart';
import 'package:navigator_portal/view/desktop_view/home/desktop_homes.dart';

class DesktopView extends StatefulWidget {
  const DesktopView({super.key});

  @override
  State<DesktopView> createState() => _HomePageState();
}

class _HomePageState extends State<DesktopView> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final Indexes indexes = Get.put(Indexes()); // Instantiate CounterController

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
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
              width: width * 0.1,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 91, 67, 129),
                  borderRadius: BorderRadius.circular(30)),
            ),
            sizedBox(0, width * 0.05),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search_rounded,
                  color: Colors.green.shade400,
                ))
          ]),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Stack(children: [
          Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [bgColor1, bgColor2],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight)),
              child: Column(
                children: [
                  Home(height: height, width: width),
                  sizedBox(height * 0.10, 0),
                  Contact()
                ],
              )),
        ]),
      ),
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
    );
  }

  Widget AppBarButtons() {
    final Indexes indexes =
        Get.find<Indexes>(); // Instantiate CounterController

    List<String> buttons = ['Home', 'About', 'Service', 'Blog', 'Contact'];

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
                  _scrollToPosition(400);
                case 2:
                  _scrollToPosition(800);

                case 3:
                  _scrollToPosition(1200);
                case 4:
                  _scrollToPosition(1600);
              }
            },
            child: Obx(
              () => Text(
                buttons[index],
                style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: indexes.SelectedIndexes.value == index
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
