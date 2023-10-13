import 'package:app/agent_page/agent_controller.dart';
import 'package:app/widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AgentPage extends GetView<AgentController> {
  const AgentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Agents',
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontFamily: 'Valorant',
            ),
          ),
        ),
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
                return InkWell(
                  onTap: () {
                    Get.toNamed(
                      "/agent_details",
                      arguments: {"agentName": agent.displayName},
                    );
                  },
                  child: Card(
                    elevation: 4, // Ajouter une ombre à la carte
                    margin: const EdgeInsets.all(8), // Marge autour de la carte
                    child: ListTile(
                      leading: Image.network(
                        agent.displayIcon,
                        width: 80,
                        height: 80,
                      ),
                      title: Text(
                        agent.displayName,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'Valorant',
                        ),
                      ),
                      subtitle: Text(agent.description),
                    ),
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
