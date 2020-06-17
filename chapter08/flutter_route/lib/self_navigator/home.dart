import 'package:flutter/material.dart';
import 'package:flutter_route/self_navigator/screen/favorites.dart';
import 'package:flutter_route/self_navigator/screen/list.dart';
import 'package:flutter_route/self_navigator/screen/search.dart';
import 'package:flutter_route/self_navigator/screen/settings.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  Widget _getBody(int index) {
    if (index == 0) {
      return ListScreen();
    } else if (index == 1) {
      return FavoritesScreen();
    } else if (index == 2) {
      return SearchScreen();
    } else if (index == 3) {
      return SettingsScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getBody(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
          BottomNavigationBarItem(icon: Icon(Icons.book), title: Text('收藏')),
          BottomNavigationBarItem(icon: Icon(Icons.search), title: Text('搜索')),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), title: Text('设置')),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
