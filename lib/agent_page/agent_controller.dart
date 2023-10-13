import 'package:app/agent_page/agent_bindings.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class AgentController extends GetxController with StateMixin {
  RxList<Agent> agents = RxList<Agent>();

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
      final response = await dio.get(
          'https://valorant-api.com/v1/agents/?language=fr-FR&isPlayableCharacter=true');

      if (response.statusCode == 200) {
        final responseData = response.data;
        final List<Agent> data =
            (responseData['data'] as List).map<Agent>((item) {
          return Agent(
            displayIcon: item['displayIcon'],
            displayName: item['displayName'],
            description: item['description'],
          );
        }).toList();

        agents.assignAll(data);
      } else {
        throw Exception(
            'Erreur lors de la récupération des données, statut : ${response.statusCode}');
      }
    } catch (e) {
      print('Erreur lors de la récupération des données : $e');
    }
  }
}
