import 'package:app/Pages/map_controller.dart';
import 'package:app/widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MapPage extends GetView<MapController> {
  const MapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Map')),
      ),
      body: GetBuilder<MapController>(
        builder: (controller) {
          if (controller.maps.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: controller.maps.length,
              itemBuilder: (context, index) {
                final map = controller.maps[index];
                return ListTile(
                  leading: Image.network(map.splash),
                  title: Text(map.displayName),
                  subtitle: Text(map.narrativeDescription),
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
