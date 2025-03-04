import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:navigator_portal/model/widgets/constant.dart';
import 'package:navigator_portal/view/mobile_view/dashboarduinew.dart';

class SignupPageMV extends StatelessWidget {
  const SignupPageMV({super.key});

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
              height: size.height * 0.7,
              width: size.width * 0.7,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
              child: Column(
                children: [
                  sizedBox(30, 0),
                  Text(
                    'Signup',
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
                          hintText: 'Enter Name'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          hintText: 'Enter Phonenumber'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          hintText: 'Enter email'),
                    ),
                  ),
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
                  sizedBox(20, 0),
                  Container(
                    width: size.width * 0.65,
                    height: size.height * 0.05,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.blue),
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NewDashBoardUiMV(),
                              ));
                        },
                        child: Text(
                          'Signup',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  sizedBox(10, 0),
                  Row(
                    children: [
                      sizedBox(0, 60),
                      Text(
                        'Already have an account?',
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
                        child: Text('  Login',
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
