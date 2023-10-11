import 'package:app/agent_page/agent_controller.dart';
import 'package:get/get.dart';

class AgentBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AgentController());
  }
}

class Agent {
  final String displayName;
  final String description;
  final String displayIcon;

  Agent({
    required this.displayName,
    required this.description,
    required this.displayIcon,
  });
}
