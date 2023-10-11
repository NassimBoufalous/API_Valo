import 'package:app/agent_page/agent_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AgentPage extends StatelessWidget {
  final AgentController agentController = Get.find<AgentController>();

  AgentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Agents')),
      ),
      body: GetBuilder<AgentController>(
        builder: (controller) {
          if (controller.agents.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: controller.agents.length,
              itemBuilder: (context, index) {
                final agent = controller.agents[index];
                return ListTile(
                  leading: Image.network(agent.displayIcon),
                  title: Text(agent.displayName),
                  subtitle: Text(agent.description),
                );
              },
            );
          }
        },
      ),
    );
  }
}
