import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:navigator_portal/controller/indexController/indexController.dart';
import 'package:navigator_portal/view/mobile_view/dashBoard/Widgets/Drawer/navigation_drawer.dart';

class MVHomePage extends StatefulWidget {
  const MVHomePage({super.key});

  @override
  State<MVHomePage> createState() => _MVHomePageState();
}

class _MVHomePageState extends State<MVHomePage> {
  @override
  Widget build(BuildContext context) {
    final Indexes indexes = Get.put(Indexes()); // Instantiate CounterController
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        leading: Image(image: AssetImage("assets/images/logobluetext.png")),
        leadingWidth: 150,
        actions: [
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
      body: Column(
        children: [],
      ),
    );
  }
}
