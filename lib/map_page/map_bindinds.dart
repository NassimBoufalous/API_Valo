import 'package:app/map_page/map_controller.dart';
import 'package:get/get.dart';

class MapBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(MapController());
  }
}

class Map {
  final String displayName;
  final String splash;
  final String narrativeDescription;

  Map({
    required this.displayName,
    required this.splash,
    required this.narrativeDescription,
  });

  static fromJson(item) {}
}
