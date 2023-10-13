import 'package:app/map_page/map_controller.dart';
import 'package:app/widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MapPage extends GetView<MapController> {
  const MapPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'Map',
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontFamily: 'Valorant',
          ),
        )),
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
                return Card(
                  elevation: 4, // Ajouter une ombre à la carte
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    leading: Image.network(map.splash),
                    title: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SplitPage()),
                        );
                      },
                      child: Text(
                        map.displayName,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'Valorant',
                        ),
                      ),
                    ),
                    subtitle: Text(map.narrativeDescription),
                  ),
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

class SplitPage extends StatelessWidget {
  const SplitPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Split'),
      ),
      body: const Center(
        child: Text('This is the Split page'),
      ),
    );
  }
} 
