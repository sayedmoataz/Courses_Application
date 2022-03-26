// ignore_for_file: unused_import, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_version_15_march/Modules/Home_Pages/homePage.dart';
import 'package:new_version_15_march/Modules/Login_Signup/Splash_Screen.dart';
import 'package:new_version_15_march/Shared/disable_screen_record.dart';
import 'package:new_version_15_march/Shared/local/cache_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    disableCapture();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
