import 'package:flutter/material.dart';

class Home2Page extends StatelessWidget {
  const Home2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Bonjour, voici un texte.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
