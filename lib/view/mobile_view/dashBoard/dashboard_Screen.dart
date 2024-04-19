import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:navigator_portal/controller/indexController/indexController.dart';
import 'package:navigator_portal/model/widgets/colors.dart';
import 'package:navigator_portal/view/mobile_view/Contact/contact.dart';
import 'package:navigator_portal/view/mobile_view/DashBoard/Widgets/Drawer/navigation_drawer.dart';
import 'package:navigator_portal/view/mobile_view/Home/home%20_screen.dart';

class MVDashBoard extends StatefulWidget {
  const MVDashBoard({super.key});

  @override
  State<MVDashBoard> createState() => _MVDashBoardState();
}

class _MVDashBoardState extends State<MVDashBoard> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final Indexes indexes = Get.put(Indexes()); // Instantiate CounterController
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      // backgroundColor: bgColor1,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Image(image: AssetImage("assets/images/logobluetext.png")),
        leadingWidth: 150,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search_outlined)),
          Builder(
            builder: (context) {
              return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(Icons.menu),
              );
            },
          )
        ],
      ),
      drawer: MvDrawer(width: width, height: height),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Stack(
          children: [
            Container(
              width: width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [bgColor1, bgColor2],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight)),
              child: Column(
                children: [
                  MvHome(height: height, width: width),
                  MvContact(height: height, width: width)
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        mini: true,
        shape: CircleBorder(),
        onPressed: () {
          // Scroll to the bottom //
          _scrollController.animateTo(
            _scrollController.position.minScrollExtent,
            duration: Duration(milliseconds: 400),
            curve: Curves.linear,
          );
        },
        child: Icon(Icons.arrow_upward),
      ),
    );
  }
}
