// ignore_for_file: file_names

import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Notification'),
          centerTitle: true,
          backgroundColor: Colors.orange,
        ),
      );
}
