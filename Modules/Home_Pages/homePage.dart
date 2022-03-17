// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:new_version_15_march/Shared/UI/Drawer/custom_drawer.dart';
import 'package:new_version_15_march/Shared/post_card_vertical.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              PostCardScreen(
                NoOfFaculties: 10,
                URLUniversityimage: 'assets/images/Cairo_University_Crest.png',
                UniversityName: 'cairo university',
                nostudent: 35,
                buttonaction: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
