import 'package:flutter/material.dart';

class NavButton extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final void Function()? onTap;

  const NavButton({
    super.key,
    required this.icon,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        color:
            isSelected ? Theme.of(context).colorScheme.onPrimary : null,
        child: Icon(icon),
      ),
    );
  }
}
