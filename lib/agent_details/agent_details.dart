import 'package:app/agent_details/agent_details_controller.dart';
import 'package:app/agent_page/agent_controller.dart';
import 'package:app/widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AgentDetails extends GetView<AgentDController> {
  AgentDetails({Key? key}) : super(key: key);
  @override
  final AgentDController controller = Get.put(AgentDController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Center(
              child: Text(
                controller.agent.displayName,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontFamily: 'Valorant',
                ),
              ),
            ),
            Hero(
              tag: "iconAnim",
              child: Image.network(
                controller.agent.displayIcon,
                width: 80,
                height: 80,
              ),
            ),
          ],
        ),
      ),
      body: GetBuilder<AgentController>(
        builder: (controller) {
          if (controller.agents.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBarExample(),
    );
  }
}