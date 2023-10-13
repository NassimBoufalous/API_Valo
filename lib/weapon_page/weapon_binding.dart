import 'package:app/weapon_page/weapon_controller.dart';
import 'package:get/get.dart';

class WeaponBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(WeaponController());
  }
}

class Weapon {
  final String displayName;
  final String displayIcon;

  Weapon({
    required this.displayName,
    required this.displayIcon,
  });
}
