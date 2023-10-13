import 'package:app/weapon_page/weapon_page.dart';
import 'package:app/widget.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarExampleApp extends StatelessWidget {
  const BottomNavigationBarExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BottomNavigationBarExample(),
    );
  }
}
