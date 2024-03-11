import 'package:flutter/material.dart';
import 'package:navigator_portal/view/mobile_view/dashBoard/Widgets/Drawer/drawer_buttons.dart';

class MvDrawer extends StatelessWidget {
  final double width;
  final double height;
  const MvDrawer({
    super.key,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: width / 1.2,
      child: Column(
        children: [
          Image.asset(
            "assets/images/logobluetext.png",
            width: width / 2,
            height: 60,
          ),
          DrawerButtons(width: width,height: height),
        ],
      ),
    );
  }
}