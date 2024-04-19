import 'package:flutter/material.dart';
import 'package:navigator_portal/view/desktop_view/home_dashboard/navigation_dashboard.dart';
import 'package:navigator_portal/view/desktop_view/desktop_navigation.dart';
import 'package:navigator_portal/view/mobile_view/mobile_view.dart';
import 'package:navigator_portal/view/responsive_layout.dart';
import 'package:navigator_portal/view/tab_view/home/tab_home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(
          DesktopView: Navigation_dashBoard(),
          MobileViews: MobileView(),
          TabView: TabView()),
    );
  }
}
