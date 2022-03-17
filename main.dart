// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:new_version_15_march/Modules/Home_Pages/homePage.dart';
import 'package:new_version_15_march/Modules/Login_Signup/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(), //WelcomeScreen(),
    );
  }
}
