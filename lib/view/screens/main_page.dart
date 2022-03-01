import 'package:flutter/material.dart';
import 'package:prac28/core/constants/consts.dart';
import 'package:prac28/view/pages/bookmark_page.dart';
import 'package:prac28/view/pages/home_page.dart';
import 'package:prac28/view/pages/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  List<Widget>? _pages;
  final keyHomePage = const PageStorageKey('home_value');
  final keySearchPage = const PageStorageKey('search_value');
  final keyBookmarkPage = const PageStorageKey('bookmark_value');

  @override
  void initState() {
    super.initState();
    _pages = [
      HomePage(key: keyHomePage),
      SearchPage(key: keySearchPage),
      BookmarkPage(key: keyBookmarkPage),
    ];
  }

  List<String> pages = [];

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      backgroundColor: ColorConst.kPrimaryBlack,
      
      body: _pages![_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        selectedItemColor: ColorConst.kPrimaryBlack,
        unselectedItemColor: ColorConst.kPrimaryGrey,
        
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_border), label: 'Bookmark'),
        ],
        type: BottomNavigationBarType.shifting,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
