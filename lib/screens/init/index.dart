import 'package:flutter/material.dart';

import 'package:mangadex_mobile/screens/home/index.dart';
import 'package:mangadex_mobile/screens/init/local_widgets/bottom_nav_bar.dart';
import 'package:mangadex_mobile/screens/init/local_widgets/init_app_bar.dart';
import 'package:mangadex_mobile/screens/likes/index.dart';
import 'package:mangadex_mobile/screens/profile/index.dart';
import 'package:mangadex_mobile/screens/search/index.dart';

class InitScreen extends StatefulWidget {
  const InitScreen({Key? key}) : super(key: key);

  @override
  State<InitScreen> createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  int _selectedIndex = 0;
  final _pageController = PageController(initialPage: 0);

  final List<Widget> _pages = [
    const HomeScreen(),
    const LikesScreen(),
    const SearchScreen(),
    const ProfileScreen(),
  ];

  void _updatePage(int index) => setState(() => _selectedIndex = index);

  void _updatePageFromBottomNav(int index) {
    _updatePage(index);
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: initAppBar(),
      body: PageView(
        children: _pages,
        controller: _pageController,
        onPageChanged: _updatePage,
      ),
      extendBody: true,
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onChange: _updatePageFromBottomNav,
      ),
    );
  }
}
