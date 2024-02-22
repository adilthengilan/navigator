import 'package:flutter/material.dart';

Widget Image_Container_for_tabview(height) {
  return Container(
    margin: EdgeInsets.only(top: 20),
    height: height * 0.40,
    width: height * 0.40,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      gradient: RadialGradient(colors: [
        Color.fromARGB(60, 168, 177, 255),
        Color.fromARGB(255, 255, 255, 255)
      ], radius: 4),
    ),
    child: Stack(
      children: [
        Center(
          child: Container(
            height: height * 0.4,
            width: height * 0.4,
            decoration: BoxDecoration(
                gradient: RadialGradient(colors: [
                  Color.fromARGB(255, 168, 177, 255),
                  Color.fromARGB(255, 255, 255, 255)
                ], radius: 4),
                borderRadius: BorderRadius.circular(height * 0.25),
                border: Border.all(color: Colors.white)),
          ),
        ),
        Center(
          child: Container(
            height: height * 0.20,
            width: height * 0.20,
            decoration: BoxDecoration(
              gradient: RadialGradient(colors: [
                Color.fromARGB(255, 168, 177, 255),
                Color.fromARGB(201, 255, 255, 255)
              ]),
              borderRadius: BorderRadius.circular(height * 0.15),
            ),
          ),
        ),
        Center(
          child: Container(
            height: height * 0.2,
            width: height * 0.2,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(height * 0.25),
                border: Border.all(color: Colors.white)),
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: height * 0.40,
          child: Image(image: AssetImage('assets/images/student image.png')),
        )
      ],
    ),
  );
}
