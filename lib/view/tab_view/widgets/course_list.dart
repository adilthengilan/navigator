import 'package:flutter/material.dart';

class Course_List extends StatefulWidget {
  final height;
  final width;
  const Course_List({super.key, this.height, this.width});

  @override
  State<Course_List> createState() => _Course_ListState();
}

class _Course_ListState extends State<Course_List> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemCount: 6,
      itemBuilder: (context, index) {
        return Container(
          height: widget.height * 4,
          width: widget.width * 3,
          margin: EdgeInsets.all(40),
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    blurRadius: 10,
                    color: Color.fromARGB(255, 231, 231, 231),
                    blurStyle: BlurStyle.outer,
                    spreadRadius: 10)
              ]),
        );
      },
    );
  }
}
