import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:navigator_portal/model/widgets/constant.dart';
import 'package:firebase_core/firebase_core.dart';
class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textstyle = GoogleFonts.roboto(
        color: Colors.blueGrey, fontSize: 18, fontWeight: FontWeight.w400);
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: Column(
        children: [
          Row(
            children: [
              sizedBox(0, width * 0.01),
              Container(
                height: height * 0.4,
                child: Image.asset('assets/images/Logo.png'),
              ),
              sizedBox(0, width * 0.1),
              Column(
                children: [
                  Text('Contact Us'),
                ],
              ),
              sizedBox(0, width * 0.1),
              Container(
                height: 100,
                width: 100,
                color: Colors.yellow,
              )
            ],
          ),
        ],
      ),
    );
  }
}
