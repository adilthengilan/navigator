import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:navigator_portal/model/widgets/colors.dart';
import 'package:navigator_portal/model/widgets/constant.dart';
import 'package:navigator_portal/view/mobile_view/widgets/image_container.dart';

class Mobile_View_Home extends StatefulWidget {
  const Mobile_View_Home({super.key});

  @override
  State<Mobile_View_Home> createState() => _Mobile_View_HomeState();
}

class _Mobile_View_HomeState extends State<Mobile_View_Home> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [bgColor1, bgColor2],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight)),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Image.asset('assets/images/Logo.png'),
        ),
        drawer: Drawer(
            child: ListView(
          children: [],
        )),
        backgroundColor: Colors.transparent,
        body: Stack(children: [
          Container(
            height: height / 2,
            width: double.infinity,
            color: Color.fromARGB(18, 255, 255, 255),
          ),
          Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: NeverScrollableScrollPhysics(),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    sizedBox(0, width / 4),
                    CircleAvatar(
                      maxRadius: height / 2.5,
                      backgroundColor: Color.fromARGB(99, 255, 255, 255),
                    )
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, left: width * 0.1),
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: height / 4,
              child: Image.asset('assets/images/student image.png'),
            ),
          )
        ]),
      ),
    );
  }
}

Widget MV_AppBarContainer() {
  return Container(
    height: 50,
    child: Row(
      children: [
        TextButton(
            onPressed: () {},
            child: Text(
              'Home',
              style: style,
            )),
        TextButton(
            onPressed: () {},
            child: Text(
              'Home',
              style: style,
            )),
        TextButton(
            onPressed: () {},
            child: Text(
              'Home',
              style: style,
            ))
      ],
    ),
  );
}

final style =
    GoogleFonts.poppins(color: Colors.black, fontWeight: FontWeight.w500);
