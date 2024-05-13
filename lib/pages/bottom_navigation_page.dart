import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:valorant_documentation/provider/bottom_navigator_provider.dart';

import '../constant/color_constant.dart';

class BottomNavigations extends StatelessWidget {
  const BottomNavigations({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomNavigationProvider =
        Provider.of<BottomNavigatorProvider>(context);
    return FloatingNavbar(
      backgroundColor: ColorConstant.red,
      items: [
        FloatingNavbarItem(icon: Icons.home, title: 'Home'),
        FloatingNavbarItem(icon: Icons.explore, title: 'Explore'),
        FloatingNavbarItem(icon: Icons.analytics, title: 'Analysis'),
        FloatingNavbarItem(icon: Icons.logout, title: 'Logout'),
      ],
      currentIndex: bottomNavigationProvider.currentIndex,
      onTap: (val) {
        bottomNavigationProvider.setIndex(val);
      },
    );
  }
}
