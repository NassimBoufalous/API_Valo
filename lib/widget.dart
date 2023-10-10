import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationBarExampleController extends GetxController {
  RxInt selectedIndex = 0.obs;

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }
}

class BottomNavigationBarExample extends StatelessWidget {
  final BottomNavigationBarExampleController controller =
      Get.put(BottomNavigationBarExampleController());

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  // Déclarer ici vos widgets pour chaque onglet
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'VALORANT',
      style: optionStyle,
    ),
    Text(
      'AGENTS',
      style: optionStyle,
    ),
    Text(
      'MAP',
      style: optionStyle,
    ),
    Text(
      'ARMES',
      style: optionStyle,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return Center(
          child: _widgetOptions.elementAt(controller.selectedIndex.value),
        );
      }),
      bottomNavigationBar: Obx(() {
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
          selectedItemColor: Colors.orange,
          unselectedItemColor: Color.fromARGB(215, 0, 0, 0),
          onTap: controller.onItemTapped,
        );
      }),
    );
  }
}
