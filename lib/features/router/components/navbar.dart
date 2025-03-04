import 'package:coursepilot/features/router/components/nav_button.dart';
import 'package:coursepilot/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// A navigation bar that appears at the bottom of the screen
// Currently non-functional
class Navbar extends ConsumerStatefulWidget {
  const Navbar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NavbarState();
}

class _NavbarState extends ConsumerState<Navbar> {
  void go(String route) {
    // temporary solution to navigate to a route
    context.go(route);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).custom.colorTheme.foreground,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 20,
        children: [
          NavButton(icon: Icons.home, isSelected: true, onTap: () => go('/')),
          NavButton(icon: Icons.search, onTap: () => go('/search')),
          NavButton(icon: Icons.add, onTap: () => go('/add-class')),
        ],
      ),
    );
  }
}
