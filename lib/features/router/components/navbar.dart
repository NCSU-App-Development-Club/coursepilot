import 'package:coursepilot/features/router/components/nav_button.dart';
import 'package:coursepilot/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Navbar extends ConsumerStatefulWidget {
  const Navbar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NavbarState();
}

class _NavbarState extends ConsumerState<Navbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Theme.of(context).custom.colorTheme.foreground,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [NavbarButton()],
      ),
    );
  }
}
