// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:new_version_15_march/Modules/Home_Pages/homePage.dart';
import 'package:new_version_15_march/Modules/Login_Signup/login_screen.dart';
import 'package:new_version_15_march/Shared/local/cache_helper.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: CacheHelper.getData(key: 'token') == null
          ? LoginScreen()
          : HomePage(),
      text: 'Courses App',
      colors: const [
        Colors.purple,
        Colors.blue,
        Colors.yellow,
        Colors.red,
      ],
      backgroundColor: Colors.white,
      duration: 8000,
      textType: TextType.ColorizeAnimationText,
      textStyle: const TextStyle(fontSize: 40.0),
    );
  }
}
