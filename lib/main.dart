import 'package:app/Pages/map_bindinds.dart';
import 'package:app/Pages/map_page.dart';

import 'package:app/home_page/home2_page.dart';
import 'package:app/home_page/home_bindinds.dart';
import 'package:app/home_page/home_page.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      getPages: [
        GetPage(
            name: '/home', page: () => const BottomNavigationBarExampleApp()),
        GetPage(
          name: '/home2_page',
          page: () => const Home2Page(),
          binding: HomeBindings(),
          title: 'Home2 Page',
        ),
        GetPage(
            name: '/map_page',
            page: () => const MapPage(),
            binding: MapBindings(),
            title: 'Map'),
      ],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "/home",
    );
  }
}
