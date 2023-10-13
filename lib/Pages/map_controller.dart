import 'package:app/Pages/map_bindinds.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class MapController extends GetxController with StateMixin {
  RxList<Map> maps = RxList<Map>();

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
      final response = await dio.get('https://valorant-api.com/v1/maps');

      if (response.statusCode == 200) {
        final responseData = response.data;
        final List<Map> data = (responseData['data'] as List).map<Map>((item) {
          return Map(
            displayName: item['displayName'] ?? 'Sans Nom',
            splash: item['splash'] ?? 'Sans Image',
            narrativeDescription:
                item['narrativeDescription'] ?? 'Sans Description',
          );
        }).toList();
        maps.assignAll(data);
      } else {
        throw Exception(
            'Erreur lors de la récupération des données, statut : ${response.statusCode}');
      }
    } catch (e) {
      print('Erreur lors de la récupération des données : $e');
    }
  }
}
