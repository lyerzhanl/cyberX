import 'package:flutter/material.dart';

import '../screens/courses_screen.dart';
import '../screens/home_screen.dart';
import '../screens/messages_screen.dart';
import '../screens/profile_screen.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const CoursesScreen(),
    const MessagesScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xFF003096),
        unselectedItemColor: const Color(0xFFD9D9D9),
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Image.asset('assets/images/home.png', width: 45),
            label: '',
            activeIcon: Image.asset(
              'assets/images/home1.png',
              width: 45,
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Image.asset('assets/images/courses.png', width: 45),
            label: '',
            activeIcon: Image.asset(
              'assets/images/courses1.png',
              width: 45,
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Image.asset('assets/images/messages.png', width: 45),
            label: '',
            activeIcon: Image.asset(
              'assets/images/messages1.png',
              width: 45,
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Image.asset('assets/images/profile.png', width: 45),
            label: '',
            activeIcon: Image.asset(
              'assets/images/profile1.png',
              width: 45,
            ),
          ),
        ],
      ),
    );
  }
}