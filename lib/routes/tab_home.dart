import 'package:flutter/material.dart';
import 'package:movies_app/screens/account/account.dart';
import 'package:movies_app/screens/favorite/favorite.dart';
import 'package:movies_app/screens/home/home.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:movies_app/screens/search/search.dart';
import 'package:movies_app/utils/palettes.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

int _currentIndex = 0;

class _HomeTabState extends State<HomeTab> {
  void changePage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final pages = [
    const Home(),
    const Favorite(),
    const Search(),
    const Account()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: pages[_currentIndex],
      bottomNavigationBar: DotNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Palettes.background?.withOpacity(0.8),
        dotIndicatorColor: Colors.transparent,
        marginR: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
        paddingR: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
        borderRadius: 30,
        onTap: changePage,
        items: [
          /// Home
          DotNavigationBarItem(
            icon: const Icon(Icons.home),
            selectedColor: Palettes.primary,
            unselectedColor: Palettes.text,
          ),

          /// Likes
          DotNavigationBarItem(
            icon: const Icon(Icons.favorite_border),
            selectedColor: Palettes.primary,
            unselectedColor: Palettes.text,
          ),

          /// Search
          DotNavigationBarItem(
            icon: const Icon(Icons.search),
            selectedColor: Palettes.primary,
            unselectedColor: Palettes.text,
          ),

          /// Profile
          DotNavigationBarItem(
            icon: const Icon(Icons.person),
            selectedColor: Palettes.primary,
            unselectedColor: Palettes.text,
          ),
        ],
      ),
    );
  }
}
