import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

import 'components/debug_navigation_modal.dart';

// enum ViewMode { list, schedule, ...(IconData, View) }

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
          onPressed: _onMenuButtonPressed,
          icon: const Icon(Icons.keyboard_arrow_down),
        ),

        title: const Text('Schedule'),

        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => const DebugNavigationModal(),
              );
            },
            icon: const Icon(Icons.bug_report),
          ),
          IconButton(
            onPressed: _onToggleView,
            icon: const Icon(Icons.view_list),
          ),
          IconButton(onPressed: () => {}, icon: const Icon(Icons.more_vert)),
        ],
      ),

      body: const Center(child: Text('Welcome to the Home Page!')),

      floatingActionButton: FloatingActionButton(
        onPressed: _onAddButtonPressed,
        child: const Icon(Icons.add),
      ),
    );
  }
}
