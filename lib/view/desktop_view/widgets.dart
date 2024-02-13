import 'package:flutter/material.dart';

Widget ImageContainer(height) {
  return Container(
    margin: EdgeInsets.only(top: 20),
    height: height * 0.60,
    width: height * 0.60,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      gradient: RadialGradient(colors: [
        Color.fromARGB(255, 168, 177, 255),
        Color.fromARGB(255, 255, 255, 255)
      ], radius: 4),
    ),
    child: Stack(
      children: [
        Center(
          child: Container(
            height: height * 0.30,
            width: height * 0.30,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(height * 0.15),
                border: Border.all(color: Colors.white)),
          ),
        ),
        Center(
          child: Container(
            height: height * 0.4,
            width: height * 0.4,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(height * 0.25),
                border: Border.all(color: Colors.white)),
          ),
        ),
        Center(
          child: Container(
            height: height * 0.6,
            width: height * 0.6,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(height * 0.25),
                border: Border.all(color: Colors.white)),
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: height * 0.50,
          child: Image(image: AssetImage('assets/images/student image.png')),
        )
      ],
    ),
  );
}
