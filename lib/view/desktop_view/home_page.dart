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
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
            backgroundColor: primaryColor,
            leading: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/Logo.png'))),
              width: 100,
              height: 100,
            ),
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
                    color: Color.fromARGB(255, 91, 67, 129),
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
        body: Stack(children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              'assets/images/Create a image  013b7cc9-68ad-4838-9360-f9acb6387489.png'),
                          fit: BoxFit.fill),
                      gradient: LinearGradient(colors: [
                        Color.fromARGB(255, 247, 247, 247),
                        Color.fromARGB(255, 255, 255, 255)
                      ], begin: Alignment.topCenter, end: Alignment.center)),
                  child: Column(
                    children: [
                      sizedBox(70, 0),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: width * 0.65),
                              child: CircleAvatar(
                                maxRadius: height * 0.60,
                                backgroundColor:
                                    const Color.fromARGB(58, 255, 255, 255),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Container(
          //   height: 400,
          //   width: 400,
          //   decoration: BoxDecoration(
          //       image: DecorationImage(
          //           image: AssetImage(
          //               'assets/images/Create a image  013b7cc9-68ad-4838-9360-f9acb6387489.png'),
          //           fit: BoxFit.fill)),
          // )
        ]));
  }
}

Widget container(double height, double width, Color color, double radius) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
        color: color, borderRadius: BorderRadius.circular(radius)),
  );
}
