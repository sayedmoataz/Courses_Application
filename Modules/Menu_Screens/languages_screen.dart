import 'package:flutter/material.dart';

class LanguagesScreen extends StatelessWidget {
  const LanguagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Languages'),
          centerTitle: true,
          backgroundColor: Colors.teal,
        ),
      );
}
