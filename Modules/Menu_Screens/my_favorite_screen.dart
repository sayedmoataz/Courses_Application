import 'package:flutter/material.dart';

class MyFavoriteScreen extends StatelessWidget {
  const MyFavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('My Favorite'),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
      );
}
