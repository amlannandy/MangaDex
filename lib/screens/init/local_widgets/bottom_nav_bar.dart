import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onChange;

  const BottomNavBar({
    required this.selectedIndex,
    required this.onChange,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DotNavigationBar(
      currentIndex: selectedIndex,
      backgroundColor: Colors.white,
      selectedItemColor: Theme.of(context).colorScheme.primary,
      dotIndicatorColor: Theme.of(context).colorScheme.tertiary,
      unselectedItemColor: Theme.of(context).colorScheme.secondary,
      enableFloatingNavBar: true,
      onTap: onChange,
      items: [
        DotNavigationBarItem(
          icon: const Icon(LineIcons.home),
        ),
        DotNavigationBarItem(
          icon: const Icon(LineIcons.heart),
        ),
        DotNavigationBarItem(
          icon: const Icon(LineIcons.search),
        ),
        DotNavigationBarItem(
          icon: const Icon(LineIcons.user),
        ),
      ],
    );
  }
}
