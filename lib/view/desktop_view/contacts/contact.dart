import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:navigator_portal/model/widgets/constant.dart';

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
      height: height * 0.6,
      width: double.infinity,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: height * 0.4,
                width: width * 0.2,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/Logo.png'),
                        fit: BoxFit.fill)),
              ),
              sizedBox(0, width * 0.20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Contact Us',
                    style: GoogleFonts.poppins(
                        fontSize: 25, fontWeight: FontWeight.w700),
                  ),
                  sizedBox(20, 0),
                  Text(
                    'Phone: +91 8593872030',
                    style: textstyle,
                  ),
                  sizedBox(10, 0),
                  Text(
                    'Email : navigatrr@gmail.com',
                    style: textstyle,
                  ),
                ],
              ),
              Text(
                'Follow Us',
                style: GoogleFonts.poppins(
                    fontSize: 25, fontWeight: FontWeight.w700),
              )
            ],
          )
        ],
      ),
    );
  }
}
