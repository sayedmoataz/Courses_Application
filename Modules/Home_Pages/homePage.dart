// ignore_for_file: file_names, unused_local_variable, avoid_print, non_constant_identifier_names, prefer_const_constructors, unnecessary_null_comparison

import 'dart:convert';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:new_version_15_march/Shared/UI/Cards/post_card_horizontal.dart';
import 'package:new_version_15_march/Shared/UI/Drawer/custom_drawer.dart';
import 'package:new_version_15_march/models/universities_models/all_universities.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AllUniversitiesModel? allUniversitiesModel;
  Future<void> getAllUniversities() async {
    var uri =
        Uri.parse('http://courses-apps.herokuapp.com/public/api/university');
    await http.get(uri, headers: {"Accept": "application/json"}).then((value) {
      setState(() {
        allUniversitiesModel =
            AllUniversitiesModel.fromJson(jsonDecode(value.body));
      });
      print(allUniversitiesModel!.data[0].name);
    }).catchError((e) {
      print(e.toString());
    });
  }

  @override
  void initState() {
    getAllUniversities();
    super.initState();
  }

  String? selectedValue;
  List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(40, 38, 56, 1),
      appBar: AppBar(
        title: const Text('Courses App'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
            padding: const EdgeInsets.only(right: 10.0),
          ),
        ],
      ),
      drawer: const CustomDrawer(),
      body: allUniversitiesModel == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: allUniversitiesModel!.data.length,
                itemBuilder: (context, index) => PostCardHorizontalScreen(
                  NoOfFaculties:
                      allUniversitiesModel!.data[index].collegesCount!,
                  type: 'Colleges',
                  URLUniversityimage: allUniversitiesModel!.data[index].photo!,
                  UniversityName: allUniversitiesModel!.data[index].name!,
                  buttonaction: () {},
                ),
              ),
            ),
    );
  }
}
