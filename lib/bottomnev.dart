import 'package:flutter/material.dart';

import 'explore_screen.dart';
import 'homescreen.dart';
// import 'match_details.dart';
import 'profile_screen.dart';
import 'search_screen.dart';
import 'standing_screen.dart';

class Bottomnev extends StatefulWidget {
  const Bottomnev({super.key});

  @override
  State<Bottomnev> createState() => _BottomnevState();
}

class _BottomnevState extends State<Bottomnev> {
  int currentIndex = 0;

  final List<Widget> screens = [
    Homescreen(),
    ExplorePage(),
    StandingsPage(),
    MyProfilePage(),
   
    // const Center(child: Text('Stats')),
    // const Center(child: Text('Profile')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,

      body: screens[currentIndex],

      bottomNavigationBar: Container(
        height: 95,
        decoration: const BoxDecoration(
          color: Color(0xFF222131),
        ),
        child: BottomNavigationBar(
          backgroundColor: const Color(0xFF222131),
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          selectedItemColor: const Color(0xFF2962FF),
          unselectedItemColor: Colors.grey,
          selectedFontSize: 16,
          unselectedFontSize: 12,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined, size: 27),
              activeIcon: Icon(Icons.home, size: 27),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore_outlined, size: 27),
              activeIcon: Icon(Icons.explore, size: 27),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart_rounded, size: 27),
              activeIcon: Icon(Icons.bar_chart, size: 27),
              label: 'Staqnding',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_rounded, size: 29),
              activeIcon: Icon(Icons.person, size: 29),
              label: 'My Profile',
            ),
          ],
        ),
      ),
    );
  }
}