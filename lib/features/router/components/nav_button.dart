import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavbarButton extends ConsumerStatefulWidget {
  const NavbarButton({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NavbarButtonState();
}

class _NavbarButtonState extends ConsumerState<NavbarButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // ref.read(routerController).go('/schedule');
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        child: const Icon(Icons.home),
      ),
    );
  }
}
