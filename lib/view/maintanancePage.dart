import 'package:flutter/material.dart';
import 'package:navigator_portal/model/widgets/constant.dart';

class MantainencePage extends StatelessWidget {
  const MantainencePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            sizedBox(0, MediaQuery.of(context).size.width / 2.8),
            Image.asset('assets/images/maintanance.png')
          ],
        )
      ],
    ));
  }
}
