import 'package:flutter/material.dart';
import 'package:navigator_portal/model/widgets/constant.dart';

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
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sizedBox(20, 0),
            Image.asset(
              'assets/images/logobluetext.png',
              width: 180,
            ),
            sizedBox(20, 0),
            Row(
              children: [
                for (int i = 0; i < 4; i++)
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: CircleAvatar(
                      radius: 13,
                      backgroundImage: AssetImage("assets/images/whatsapp_icon.png"),
                    ),
                  )
              ],
            ),
            sizedBox(100, 0)
          ],
        ),
      ),
    );
  }
}
