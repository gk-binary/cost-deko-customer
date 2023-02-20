import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:costdeko/pages/fragments/accountFragment.dart';
import 'package:costdeko/pages/fragments/homeFragment.dart';
import 'package:costdeko/pages/fragments/sellFragment.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _pageController = PageController(initialPage: 0);

  int maxCount = 3;

  /// widget list
  final List<Widget> bottomBarPages = [
    const HomeFragment(),
    const SellFragment(),
    const AccountFragment(),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
            bottomBarPages.length, (index) => bottomBarPages[index]),
      ),
      extendBody: true,
      bottomNavigationBar: (bottomBarPages.length <= maxCount)
          ? AnimatedNotchBottomBar(
              pageController: _pageController,
              color: Colors.white,
              showLabel: false,
              notchColor: Colors.black87,
              bottomBarItems: const [
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.home_filled,
                    color: Colors.blueGrey,
                  ),
                  activeItem: Icon(
                    Icons.home_filled,
                    color: Colors.blueAccent,
                  ),
                  itemLabel: 'Buy',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.sell,
                    color: Colors.blueGrey,
                  ),
                  activeItem: Icon(
                    Icons.sell,
                    color: Colors.blueAccent,
                  ),
                  itemLabel: 'Sell',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.account_circle,
                    color: Colors.blueGrey,
                  ),
                  activeItem: Icon(
                    Icons.account_circle,
                    color: Colors.blueAccent,
                  ),
                  itemLabel: 'Settings',
                ),
              ],
              onTap: (index) {
                _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeIn,
                );
              },
            )
          : null,
    );
  }
}
