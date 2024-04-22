// import 'package:flutter/material.dart';

// void studentProviderShowdialog(BuildContext context) {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: Text('Student Detailes'),
//         content: Column(children: [
//           TextField(
//             decoration: InputDecoration(
//               labelText: "Student Name",
//               border:
//                   OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
//             ),
//           ),
//           SizedBox(
//             height: 15,
//           ),
//           TextField(
//             decoration: InputDecoration(
//               labelText: "Location(optional)",
//               border:
//                   OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
//             ),
//           ),
//           SizedBox(
//             height: 15,
//           ),
//           TextField(
//             decoration: InputDecoration(
//               labelText: "Looking Course",
//               border:
//                   OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
//             ),
//           ),
//           SizedBox(
//             height: 15,
//           ),
//           TextField(
//             decoration: InputDecoration(
//               labelText: "College(optional)",
//               border:
//                   OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
//             ),
//           ),
//           SizedBox(
//             height: 15,
//           ),
//           TextField(
//             decoration: InputDecoration(
//               labelText: "Phone Number",
//               border:
//                   OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
//             ),
//           ),
//         ]),
//         actions: [
//           TextButton(
//             onPressed: () {
//               // Close the dialog
//               Navigator.of(context).pop();
//             },
//             child: Text('Cancel'),
//           ),
//           TextButton(
//             onPressed: () {
//               // Close the dialog
//               Navigator.of(context).pop();
//             },
//             child: Text('Submit'),
//           ),
//         ],
//       );
//     },
//   );
// }