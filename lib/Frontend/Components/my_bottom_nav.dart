import 'package:flutter/material.dart';
import 'package:geopulse/Frontend/Components/my_card_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';

class MyBottomNav extends StatefulWidget {
  const MyBottomNav({super.key});

  @override
  _MyBottomNavState createState() => _MyBottomNavState();
}

class _MyBottomNavState extends State<MyBottomNav> with TickerProviderStateMixin {
  MotionTabBarController? _motionTabBarController;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _motionTabBarController = MotionTabBarController(
      initialIndex: 1, // Start with the first page
      length: 3, // Total number of tabs
      vsync: this,
    );
  }

  @override
  void dispose() {
    _motionTabBarController!.dispose();
    _pageController.dispose();
    super.dispose();
  }

  void _onTabSelected(int index) {
      _motionTabBarController!.index = index;
      _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          CardPage(),
          Center(child: Text("Profile", style: TextStyle(fontSize: 24))),
          Center(child: Text("Settings Page", style: TextStyle(fontSize: 24))),
        ],
      ),
      bottomNavigationBar: MotionTabBar(
        controller: _motionTabBarController!,
        labels: const ["Home", "Profile", "Settings"], // Center label is empty
        icons: const [Icons.home, Icons.person, Icons.settings],
        initialSelectedTab: "Home",
        tabSize: 50,
        tabBarHeight: 55,
        textStyle: GoogleFonts.poppins(
          fontSize: 15,
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.w500,
        ),
        tabIconColor: Theme.of(context).colorScheme.primary,
        tabIconSelectedColor: Colors.white,
        tabSelectedColor: Theme.of(context).colorScheme.primary,
        tabBarColor: Colors.white,
        onTabItemSelected: _onTabSelected,
      ),
    );
  }
}