import 'package:coursepilot/features/router/components/nav_button.dart';
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
  Uri? _selectedPath;

  void go(String route) {
    // temporary solution to navigate to a route
    context.go(route);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateSelectedPath();
      GoRouter.of(context).routerDelegate.addListener(_updateSelectedPath);
    });
  }

  @override
  void dispose() {
    GoRouter.of(context).routerDelegate.removeListener(_updateSelectedPath);
    super.dispose();
  }

  void _updateSelectedPath() {
    final Uri currentLocation = GoRouter.of(
      context,
    ).routeInformationProvider.value.uri;
    setState(() {
      _selectedPath = currentLocation;
    });
  }

  @override
  Widget build(BuildContext context) {
    var seg = _selectedPath?.pathSegments;

    bool isHome = true;
    bool isSearch = false;
    bool isAdd = false;

    if (seg != null && seg.isNotEmpty) {
      isHome = seg[0] == 'schedule';
      isSearch = seg[0] == 'search';
      isAdd = seg[0] == 'add-class';
    }

    return Container(
      height: 40,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 20,
        children: [
          NavButton(icon: Icons.home, isSelected: isHome, onTap: () => go('/')),
          NavButton(icon: Icons.search, isSelected: isSearch, onTap: () => go('/search')),
          NavButton(icon: Icons.add, isSelected: isAdd, onTap: () => go('/add-class')),
        ],
      ),
    );
  }
}
