import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:navigator_portal/model/widgets/constant.dart';
import 'package:navigator_portal/model/widgets/texts.dart';

class Cources extends StatefulWidget {
  const Cources({super.key});

  @override
  State<Cources> createState() => _CourcesState();
}

class _CourcesState extends State<Cources> {
  List<dynamic> cources = [];
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    bool ishovered = false;
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: Providing_Programs.length,
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisExtent: 400,
        crossAxisCount: 4,
      ),
      itemBuilder: (context, index) {
        return MouseRegion(
          cursor: MouseCursor.uncontrolled,
          onEnter: (event) {
            setState(() {
              ishovered = !ishovered;
            });
          },
          onExit: (event) {
            setState(() {
              ishovered = false;
            });
          },
          child: Container(
            margin: EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                      height: height * 0.25,
                      width: 200,
                      margin: EdgeInsets.all(30),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                        programs_Image[index],
                      )))),
                ),
                Center(
                  child: Text(
                    '${Providing_Programs[index]}',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w700, fontSize: 20),
                  ),
                ),
                Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      sizedBox(0, width * 0.08),
                      Text(
                        'Courses',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            color: ishovered ? Colors.blue : Colors.black),
                      ),
                      Icon(Icons.arrow_right_alt)
                    ],
                  ),
                )
              ],
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color:
                    ishovered ? Color.fromARGB(255, 82, 33, 243) : Colors.white,
                boxShadow: [
                  BoxShadow(
                      spreadRadius: 1,
                      blurRadius: 10,
                      color: Color.fromARGB(255, 218, 218, 218),
                      blurStyle: BlurStyle.normal)
                ]),
          ),
        );
      },
    );
  }
}
