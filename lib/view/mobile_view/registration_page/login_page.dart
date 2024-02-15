import 'package:flutter/material.dart';
import 'package:navigator_portal/model/widgets/constantss.dart';
import 'package:navigator_portal/view/mobile_view/dashBoard/mv_home_page.dart';

class Login_Page extends StatefulWidget {
  const Login_Page({super.key});

  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          sizedBox(50, 0),
          Container(height: 200,child: Image.asset("assets/images/logoSplash.png")),
          sizedBox(40, 0),
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: TextField(
              controller: username,
              decoration: InputDecoration(
                  hintText: 'username',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          sizedBox(20, 0),
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: TextField(
              controller: password,
              decoration: InputDecoration(
                  hintText: 'password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          sizedBox(20, 0),
          InkWell(
            onTap: () {
              login();
            },
            child: Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.blue),
              child: Center(
                  child: Text(
                'Login',
                style: TextStyle(fontWeight: FontWeight.w700),
              )),
            ),
          )
        ],
      ),
    );
  }

  void login() {
    if (username.text.isNotEmpty || password.text.isNotEmpty) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MVHomePage(),
          ));
    } else {
      snackBar(
        context,
      );
    }
  }
}

void snackBar(
  BuildContext context,
) {
  const snackdemo = SnackBar(
    content: Text('Please fill the field'),
    backgroundColor: Color.fromARGB(255, 0, 0, 0),
    elevation: 10,
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.all(5),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackdemo);
}
