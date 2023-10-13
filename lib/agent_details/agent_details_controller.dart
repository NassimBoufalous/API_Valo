import 'package:app/agent_page/agent_bindings.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class AgentDController extends GetxController with StateMixin {
  late Agent agent;

  @override
  void onInit() {
    change(null, status: RxStatus.loading());
    if (Get.arguments != null && Get.arguments.containsKey("agent")) {
      agent = Get.arguments["agent"];
    }
    change(null, status: RxStatus.success());
    super.onInit();
  }
}
