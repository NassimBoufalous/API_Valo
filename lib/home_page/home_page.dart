import 'package:app/widget.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarExampleApp extends StatelessWidget {
  const BottomNavigationBarExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Image.asset(
          'assets/android_icon.png',
          width: 40,
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          'Valorant API',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontFamily: 'Valorant',
          ),
        ),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Text(
                'Bienvenue sur l\'aide de Valorant',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 70, 85),
                  fontSize: 25,
                  fontFamily: 'Valorant',
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBarExample(),
    );
  }
}
