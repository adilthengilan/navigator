import 'package:flutter/material.dart';

class MvContact extends StatefulWidget {
  final double height;
  final double width;
  const MvContact({
    super.key,
    required this.height,
    required this.width,
  });

  @override
  State<MvContact> createState() => _ContactState();
}

class _ContactState extends State<MvContact> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: widget.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/images/Logo.png',width: 180,height: 180,),
          // sizedBox(0, width / 10),
          // Column(
          //   children: [
          //     Text('Contact Us'),
          //   ],
          // ),
          // sizedBox(0, widget.width / 10),
          // Container(
          //   height: 100,
          //   width: 100,
          //   color: Colors.yellow,
          // ),
        ],
      ),
    );
  }
}
