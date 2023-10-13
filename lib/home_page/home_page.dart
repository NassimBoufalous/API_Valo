import 'package:app/widget.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarExampleApp extends StatelessWidget {
  const BottomNavigationBarExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(child: Text('Valorant API')),
      ),
      bottomNavigationBar: BottomNavigationBarExample(),
    );
  }
}
