import 'package:app/agent_details/agent_details_controller.dart';
import 'package:get/get.dart';

class AgentDBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AgentDController());
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
