import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// A view that wraps the page with a navigation bar
class NavigationScopeView extends StatelessWidget {
  final Widget child;
  const NavigationScopeView({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final currentLocation = GoRouterState.of(context).uri.path;

    int currentIndex = 0;
    if (currentLocation.startsWith('/schedule')) {
      currentIndex = 0;
    } else if (currentLocation.startsWith('/add-class')) {
      currentIndex = 1;
    } else if (currentLocation.startsWith('/search')) {
      currentIndex = 2;
    }

    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (index) {
          switch (index) {
            case 0:
              context.go('/schedule');
              break;
            case 1:
              context.go('/add-class');
              break;
            case 2:
              context.go('/search');
              break;
          }
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.calendar_today),
            label: 'Schedule',
          ),
          NavigationDestination(icon: Icon(Icons.add), label: 'Add Class'),
          NavigationDestination(icon: Icon(Icons.search), label: 'Search'),
        ],
      ),
    );
  }
}
