import 'package:coursepilot/features/router/components/navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavigationScopeView extends ConsumerStatefulWidget {
  final Widget child;
  const NavigationScopeView({super.key, required this.child});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NavigationScopeViewState();
}

class _NavigationScopeViewState extends ConsumerState<NavigationScopeView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: widget.child),
        const SizedBox(height: 50, child: Navbar()),
      ],
    );
  }
}
