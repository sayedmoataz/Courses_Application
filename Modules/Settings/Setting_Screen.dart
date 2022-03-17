// ignore_for_file: file_names

import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Setting'),
          centerTitle: true,
          backgroundColor: Colors.orange,
        ),
      );
}
