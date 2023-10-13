import 'package:app/Pages/map_page.dart';
import 'package:app/agent_page/agent_page.dart';
import 'package:app/weapon_page/weapon_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationBarExampleController extends GetxController {
  RxInt selectedIndex = 0.obs;

  List<Widget> pages = [
    const MapPage(),
    const WeaponPage(),
    const AgentPage(),
  ];

  void onItemTapped(int index) {
    selectedIndex.value = index;
    switch (index) {
      case 0:
        Get.toNamed('/home');
        break;
      case 1:
        Get.toNamed('/agent_page');
        break;
      case 2:
        Get.toNamed('/map_page');
        break;
      case 3:
        Get.toNamed('/weapon_page');
        break;
    }
  }
}

class BottomNavigationBarExample extends StatelessWidget {
  final BottomNavigationBarExampleController controller =
      Get.put(BottomNavigationBarExampleController());

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  BottomNavigationBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('assets/agent_icon.png')),
          label: 'Agents',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          label: 'Map',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('assets/weapons_icon.png')),
          label: 'Armes',
        ),
      ],
      currentIndex: controller.selectedIndex.value,
      selectedItemColor: Color.fromARGB(255, 255, 70, 85),
      unselectedItemColor: Color.fromARGB(215, 0, 0, 0),
      onTap: controller.onItemTapped,
    );
  }
}
