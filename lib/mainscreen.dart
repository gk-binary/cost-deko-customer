import 'package:costdeko/pages/fragments/homeFragment.dart';
import 'package:costdeko/pages/fragments/sellFragment.dart';
import 'package:floating_navbar/floating_navbar.dart';
import 'package:floating_navbar/floating_navbar_item.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingNavBar(
      resizeToAvoidBottomInset: false,
      color: Vx.black,
      selectedIconColor: Colors.white,
      unselectedIconColor: Colors.white.withOpacity(0.6),
      items: [
        FloatingNavBarItem(
            iconData: Icons.home_outlined,
            page: const HomeFragment(),
            title: 'Buy'),
        FloatingNavBarItem(
            iconData: Icons.local_hospital_outlined,
            page: SellFragment(),
            title: 'Sell'),
        FloatingNavBarItem(
            iconData: Icons.account_circle,
            page: HomeFragment(),
            title: 'Account'),
      ],
      horizontalPadding: 40.0,
      hapticFeedback: true,
      showTitle: true,
    );
  }
}
