import 'package:app/widget.dart';
import 'package:flutter/material.dart';

void main() => runApp(const BottomNavigationBarExampleApp());

class BottomNavigationBarExampleApp extends StatelessWidget {
  const BottomNavigationBarExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:
          BottomNavigationBarExample(), // Utilisez BottomNavigationBarExample ici
    );
  }
}
