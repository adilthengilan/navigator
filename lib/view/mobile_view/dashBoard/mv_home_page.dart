import 'package:flutter/material.dart';
import 'package:navigator_portal/view/desktop_view/home_page.dart';

class MVHomePage extends StatefulWidget {
  const MVHomePage({super.key});

  @override
  State<MVHomePage> createState() => _MVHomePageState();
}

class _MVHomePageState extends State<MVHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 75,width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                Image.asset("assets/images/logobluetext.png",scale: 5,),
                Padding(
                  padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width/2
                  ),
                  child: CircleAvatar(backgroundColor: Colors.black,),
                )
              ],
            ),
          ),
          Row(
            children: [
              Padding(
                padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height/20,left: MediaQuery.of(context).size.width/20),
                child: Text("Summary",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
              ),
            ],
          )
          ],
      ),
    );
  }
}
