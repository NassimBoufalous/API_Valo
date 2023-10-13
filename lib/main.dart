import 'package:app/Pages/map_bindinds.dart';
import 'package:app/Pages/map_page.dart';

import 'package:app/home_page/home_page.dart';

import 'package:app/weapon_page/weapon_binding.dart';
import 'package:app/weapon_page/weapon_page.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      getPages: [
        GetPage(
            name: '/home', page: () => const BottomNavigationBarExampleApp()),
        GetPage(
            name: '/map_page',
            page: () => const MapPage(),
            binding: MapBindings(),
            title: 'Map'),
        GetPage(
            name: '/weapon_page',
            page: () => const WeaponPage(),
            binding: WeaponBindings(),
            title: 'Armes'),
      ],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "/home",
    );
  }
}
