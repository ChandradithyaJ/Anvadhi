import 'package:flutter/material.dart';
import 'package:anvadhi/customWidgets/HomePage.dart';
import 'package:anvadhi/customWidgets/MapPage.dart';
import 'package:anvadhi/customWidgets/StoriesPage.dart';
import 'package:anvadhi/customWidgets/ProfilePage.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _Navbar();
}

class _Navbar extends State<Navbar> {
  int currentIndex = 0;
  final screens = [
    // const Center(child: Text('Home',style: TextStyle(fontSize: 60))),
    // const Center(child: Text('Stories',style: TextStyle(fontSize: 60))),
    // const Center(child: Text('Profile',style: TextStyle(fontSize: 60))),
    const HomePage(),
    // const MapPage(),
    // const Center(child: Text('Map', style: TextStyle(fontSize: 60))),
    const StoriesPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        selectedFontSize: 17,
        showUnselectedLabels: false,
        unselectedFontSize: 14,
        unselectedItemColor: Colors.white70,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.location_pin), label: 'Map'),
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Stories'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
