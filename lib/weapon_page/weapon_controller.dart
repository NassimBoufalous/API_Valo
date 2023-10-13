import 'package:app/weapon_page/weapon_binding.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class WeaponController extends GetxController with StateMixin {
  RxList<Weapon> weapons = RxList<Weapon>();

  @override
  void onInit() async {
    change(null, status: RxStatus.loading());
    await _fetchAgentData();
    change(null, status: RxStatus.success());
    super.onInit();
  }

  Future<void> _fetchAgentData() async {
    try {
      final dio = Dio();
      final response =
          await dio.get('https://valorant-api.com/v1/weapons/?langage=fr-FR');

      if (response.statusCode == 200) {
        final responseData = response.data;
        final List<Weapon> data =
            (responseData['data'] as List).map<Weapon>((item) {
          return Weapon(
            displayIcon: item['displayIcon'],
            displayName: item['displayName'],
          );
        }).toList();

        weapons.assignAll(data);
      } else {
        throw Exception(
            'Erreur lors de la récupération des données, statut : ${response.statusCode}');
      }
    } catch (e) {
      print('Erreur lors de la récupération des données : $e');
    }
  }
}
