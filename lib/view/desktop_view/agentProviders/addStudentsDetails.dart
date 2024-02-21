import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:navigator_portal/model/widgets/constant.dart';

class StudentsAdding extends StatefulWidget {
  const StudentsAdding({super.key});

  @override
  State<StudentsAdding> createState() => _StudentsAddingState();
}

class _StudentsAddingState extends State<StudentsAdding> {
  final TextEditingController StudentName = TextEditingController();
  final TextEditingController StudentNumber = TextEditingController();
  final TextEditingController StudentCourse = TextEditingController();
  List<dynamic> StudentDetails = [];

  @override
  Widget build(BuildContext context) {
    print(StudentDetails);
    final width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        const Color.fromARGB(255, 235, 235, 235),
        const Color.fromARGB(255, 239, 239, 239)
      ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(actions: [Image.asset('assets/images/Logo.png')]),
        body: SingleChildScrollView(
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                sizedBox(0, width / 5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    sizedBox(30, 0),
                    Text(
                      'Students',
                      style: GoogleFonts.poppins(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                    sizedBox(30, 0),
                    Container(
                      width: 300,
                      child: StudentsDetails(studentDetails: StudentDetails),
                    )
                    // SizedBox(
                    //   width: width / 3,
                    //   child: ListView.builder(
                    //     shrinkWrap: true,
                    //     itemCount: StudentDetails.length,
                    //     itemBuilder: (context, index) {

                    //     },
                    //   ),
                    // )
                  ],
                ),
                sizedBox(0, width / 4),
                Column(
                  children: [
                    sizedBox(30, 0),
                    Text(
                      'Add Students',
                      style: GoogleFonts.poppins(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                    sizedBox(30, 0),
                    SizedBox(
                        width: 300,
                        child: TextField(
                          controller: StudentName,
                          decoration: InputDecoration(hintText: 'Student Name'),
                        )),
                    sizedBox(30, 0),
                    SizedBox(
                        width: 300,
                        child: TextField(
                          controller: StudentNumber,
                          decoration:
                              InputDecoration(hintText: 'Student PhoneNumber'),
                        )),
                    sizedBox(30, 0),
                    SizedBox(
                        width: 300,
                        child: TextField(
                          controller: StudentCourse,
                          decoration: InputDecoration(hintText: 'Course'),
                        )),
                    sizedBox(30, 0),
                    SizedBox(
                        width: 300,
                        child: TextButton(
                          onPressed: () {
                            if (StudentName.text.isEmpty ||
                                StudentNumber.text.isEmpty ||
                                StudentCourse.text.isEmpty) {
                            } else {
                              final data = {
                                'Name': StudentName.text,
                                'PhoneNo': StudentNumber.text,
                                'Course': StudentCourse.text
                              };
                              setState(() {
                                StudentDetails.add(data);
                              });
                            }
                          },
                          child: Text(
                            'Submit',
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  Color.fromARGB(255, 75, 66, 112)),
                              shape: MaterialStatePropertyAll(
                                  ContinuousRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10)))),
                        ))
                  ],
                )
              ]),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class StudentsDetails extends StatelessWidget {
  List studentDetails;
  StudentsDetails({super.key, required this.studentDetails});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: studentDetails.length,
      itemBuilder: (context, index) {
        if (studentDetails.isNotEmpty) {
          return Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Student Name: ${studentDetails[index]['Name']}',
                  style: GoogleFonts.poppins(
                      color: Colors.black, fontWeight: FontWeight.w500),
                ),
                sizedBox(20, 0),
                Text(
                  'Student Number: ${studentDetails[index]['PhoneNo']}',
                  style: GoogleFonts.poppins(
                      color: Colors.black, fontWeight: FontWeight.w500),
                ),
                sizedBox(20, 0),
                Text(
                  'Course: ${studentDetails[index]['Course']}',
                  style: GoogleFonts.poppins(
                      color: Colors.black, fontWeight: FontWeight.w500),
                ),
                sizedBox(20, 0),
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
