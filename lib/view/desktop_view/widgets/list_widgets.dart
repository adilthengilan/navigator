import 'package:flutter/material.dart';

class Cources extends StatefulWidget {
  const Cources({super.key});

  @override
  State<Cources> createState() => _CourcesState();
}

class _CourcesState extends State<Cources> {
  List<dynamic> cources = [];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 90,
          crossAxisSpacing: 80,
          childAspectRatio: 10 / 10),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    spreadRadius: 1,
                    blurRadius: 10,
                    color: Color.fromARGB(255, 218, 218, 218),
                    blurStyle: BlurStyle.normal)
              ]),
        );
      },
    );
  }
}
