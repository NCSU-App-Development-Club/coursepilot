import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _onMenuButtonPressed() {
    // TODO: Implement menu button action
  }

  void _onToggleView() {
    // TODO: Implement toggle view action
  }

  void _onAddButtonPressed() {
    // TODO: Implement add button action
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => {},
          icon: const Icon(Icons.keyboard_arrow_down),
        ),

        title: const Text('Schedule'),

        actions: [
          IconButton(
            onPressed: () => {},
            icon: const Icon(Icons.calendar_month),
          ),
          IconButton(onPressed: () => {}, icon: const Icon(Icons.more_vert)),
        ],
      ),

      body: const Center(child: Text('Welcome to the Home Page!')),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your action here
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
