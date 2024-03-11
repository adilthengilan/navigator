import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:navigator_portal/view/home_page.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyD3H6hm3EiwJnbgDbzyuQbtmPjZr6OygQQ",
          authDomain: "navigatrr-b2318.firebaseapp.com",
          projectId: "navigatrr-b2318",
          storageBucket: "navigatrr-b2318.appspot.com",
          messagingSenderId: "543095413616",
          appId: "1:543095413616:web:3f2fb117577b4c1dc90db5",
          measurementId: "G-F0542RXSMW"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Navigator Portal',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: HomePage());
  }
}
