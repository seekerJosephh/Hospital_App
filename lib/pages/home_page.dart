// // lib/pages/home/home_page.dart
// import 'package:flutter/material.dart';

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Home')),
//       body: Center(child: Text('Welcome to the Home Page!')),
//     );
//   }
// }import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:hospital/core/constants/app_colors.dart';
import 'package:hospital/features/auth/views/home_screen.dart';
import 'package:hospital/pages/history_page.dart';
import 'package:hospital/pages/profile_page.dart';
import 'package:hospital/pages/schedule_page.dart';
import 'package:hospital/pages/todolist_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:remixicon/remixicon.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 2);
  }

  // List of screens for each tab
  final List<Widget> _screens = [
    const HomeScreen(),
    const SchedulePage(),
    const TodolistPage(),
    const HistoryPage(),
    const ProfilePage(),
  ];

  // List of bottom navigation bar items
  final List<PersistentBottomNavBarItem> _navBarItems = [
    PersistentBottomNavBarItem(
      icon: const Icon(Remix.home_4_line),
      title: "Home",
      activeColorPrimary: AppColors.primary,
      inactiveColorPrimary: AppColors.secondary,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Remix.calendar_2_line),
      title: "Schedule",
      activeColorPrimary: AppColors.primary,
      inactiveColorPrimary: AppColors.secondary,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Remix.todo_line, color: Colors.white),
      title: "Todo List",
      activeColorPrimary: AppColors.primary,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Remix.history_line),
      title: "History",
      activeColorPrimary: AppColors.primary,
      inactiveColorPrimary: AppColors.secondary,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Remix.account_circle_line),
      title: "Profile",
      activeColorPrimary: AppColors.primary,
      inactiveColorPrimary: AppColors.secondary,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _screens,
        items: _navBarItems,
        backgroundColor: AppColors.background,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(20.0),
          colorBehindNavBar: AppColors.background,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
        ),
        navBarStyle: NavBarStyle.style15, // Style of the NavBar
      ),
    );
  }
}
