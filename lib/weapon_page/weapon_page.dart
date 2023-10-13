import 'package:app/weapon_page/weapon_controller.dart';
import 'package:app/widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WeaponPage extends GetView<WeaponController> {
  const WeaponPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Armes')),
      ),
      body: GetBuilder<WeaponController>(
        builder: (controller) {
          if (controller.weapons.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: controller.weapons.length,
              itemBuilder: (context, index) {
                final weapons = controller.weapons[index];
                return ListTile(
                  leading: Image.network(weapons.displayIcon),
                  title: Text(weapons.displayName),
                );
              },
            );
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBarExample(),
    );
  }
}
