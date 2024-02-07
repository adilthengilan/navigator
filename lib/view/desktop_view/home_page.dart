import 'package:flutter/material.dart';
import 'package:navigator_portal/model/widgets/contants.dart';

class DesktopView extends StatefulWidget {
  const DesktopView({super.key});

  @override
  State<DesktopView> createState() => _HomePageState();
}

class _HomePageState extends State<DesktopView> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Image.asset(''),
          actions: [
            TextButton(
                onPressed: () {},
                child: Text(
                  'HOME',
                  style: AppBarStyle,
                )),
            TextButton(
                onPressed: () {},
                child: Text(
                  'ABOUT',
                  style: AppBarStyle,
                )),
            TextButton(
                onPressed: () {},
                child: Text(
                  'SERVICE',
                  style: AppBarStyle,
                )),
            TextButton(
                onPressed: () {},
                child: Text(
                  'BLOG',
                  style: AppBarStyle,
                )),
            TextButton(
                onPressed: () {},
                child: Text(
                  'CONTACT',
                  style: AppBarStyle,
                )),
            sizedBox(0, width * 0.10),
            Container(
              height: 40,
              width: width * 0.1,
              decoration: BoxDecoration(
                  color: Colors.green.shade400,
                  borderRadius: BorderRadius.circular(30)),
            ),
            sizedBox(0, width * 0.05),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search_rounded,
                  color: Colors.green.shade400,
                ))
          ]),
    );
  }
}
