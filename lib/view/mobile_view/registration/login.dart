import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:navigator_portal/model/widgets/constant.dart';
import 'package:navigator_portal/view/mobile_view/registration/signup.dart';

class LoginPageMV extends StatelessWidget {
  const LoginPageMV({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 43, 56, 157),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: size.height * 0.75,
              width: size.width * 0.7,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10, left: size.width / 2.5),
                    child: Text(
                      'Login As Guest',
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                    ),
                  ),
                  sizedBox(20, 0),
                  Text(
                    'Login',
                    style: GoogleFonts.poppins(
                        fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                  sizedBox(30, 0),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          hintText: 'Enter username or email'),
                    ),
                  ),
                  sizedBox(20, 0),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          hintText: 'Enter password'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5, left: size.width / 2.6),
                    child: Text(
                      'Forgot password',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 54, 52, 122)),
                    ),
                  ),
                  sizedBox(30, 0),
                  Container(
                    width: size.width * 0.65,
                    height: size.height * 0.05,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.blue),
                    child: Center(
                      child: Text(
                        'Login',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  sizedBox(20, 0),
                  Text(
                    '_____Login With_____',
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                  ),
                  sizedBox(10, 0),
                  Row(
                    children: [
                      sizedBox(0, 85),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey),
                      ),
                      sizedBox(0, 30),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey),
                      ),
                      sizedBox(0, 30),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey),
                      ),
                    ],
                  ),
                  sizedBox(30, 0),
                  Row(
                    children: [
                      sizedBox(0, 65),
                      Text(
                        'Dont have an account?',
                        style: GoogleFonts.poppins(fontWeight: FontWeight.w300),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignupPageMV(),
                              ));
                        },
                        child: Text('  Signup',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                color: Colors.blue)),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
