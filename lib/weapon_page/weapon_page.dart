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
        automaticallyImplyLeading: false,
        leading: Image.asset(
          'assets/android_icon.png',
          width: 40,
        ),
        title: const Text(
          "Armes",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontFamily: 'Valorant',
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: GetBuilder<WeaponController>(
        builder: (controller) {
          if (controller.weapons.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Container(
              color: Color.fromARGB(255, 200, 200, 200),
              child: ListView.builder(
                itemCount: controller.weapons.length,
                itemBuilder: (context, index) {
                  final weapons = controller.weapons[index];
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 118, 118, 118),
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 0, 0, 0)
                                .withOpacity(0.8),
                            spreadRadius: 2,
                            blurRadius: 3,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            weapons.displayIcon,
                            height: 100,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            weapons.displayName,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontFamily: 'Valorant',
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBarExample(),
    );
  }
}
