import 'package:flutter/material.dart';
import 'package:navigator_portal/view/mobile_view/registration_page/login_page.dart';

class MobileView extends StatefulWidget {
  const MobileView({super.key});

  @override
  State<MobileView> createState() => _HomePageState();
}

class _HomePageState extends State<MobileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Login_Page(),
    );
  }
}
