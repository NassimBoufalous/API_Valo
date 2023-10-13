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
        automaticallyImplyLeading: false,
        leading: Image.asset(
          'assets/android_icon.png', 
          width: 40, 
        ),
        title: const Text(
          'Agents',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontFamily: 'Valorant',
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
             
            },
          ),
        ],
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
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Card(
                    elevation: 4,
                    margin: const EdgeInsets.all(8),
                    child: ListTile(
                      leading: Image.network(
                        agent.displayIcon,
                        width: 80,
                        height: 80,
                      ),
                      title: Text(
                        agent.displayName,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: 'Valorant',
                        ),
                      ),
                      subtitle: Text(
                        agent.description,
                        style: const TextStyle(fontSize: 16),
                      ),
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
