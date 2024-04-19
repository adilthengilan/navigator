// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:navigator_portal/model/widgets/constant.dart';
// import 'package:firebase_core/firebase_core.dart';

// class get_in_Touch extends StatefulWidget {
//   const get_in_Touch({super.key});

//   @override
//   State<get_in_Touch> createState() => _get_in_TouchState();
// }

// class _get_in_TouchState extends State<get_in_Touch> {
//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;
//     final textstyle = GoogleFonts.roboto(
//         color: Colors.blueGrey, fontSize: 18, fontWeight: FontWeight.w400);
//     return Container(
//       color: Colors.white,
//       height: height * 0.5,
//       width: double.infinity,
//       child: Column(
//         children: [
//           SizedBox(
//             child: Text(
//               'Get in Touch!',
//               style: GoogleFonts.poppins(
//                   fontSize: 50, fontWeight: FontWeight.w600),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: width * 0.2),
//             child: Row(
//               children: [
//                 SizedBox(
//                     height: 50,
//                     width: width * 0.3,
//                     child: TextField(
//                       decoration: InputDecoration(
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(20))),
//                     )),
//                 sizedBox(0, width * 0.01),
//                 SizedBox(
//                     height: 40,
//                     width: width * 0.3,
//                     child: TextField(
//                       decoration: InputDecoration(
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(20))),
//                     ))
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
