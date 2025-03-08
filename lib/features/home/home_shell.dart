import 'package:flutter/material.dart';
import 'package:mobiliz/features/home/map/map_view.dart';

final views = [
  Scaffold(
    body: Center(
      child: Text('a'),
    ),
  ),
  Scaffold(
    body: Center(
      child: Text('a'),
    ),
  ),
  MapView(),
  Scaffold(
    body: Center(
      child: Text('a'),
    ),
  ),
  Scaffold(
    body: Center(
      child: Text('a'),
    ),
  ),
];

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: views[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: 'f',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'd',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'e',
            icon: Icon(Icons.map),
          ),
          BottomNavigationBarItem(
            label: 'c',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 's',
            icon: Icon(Icons.home),
          ),
        ],
      ),
    );
  }
}
