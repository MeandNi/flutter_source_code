import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class ScaffoldSample extends StatefulWidget {
  @override
  _ScaffoldSampleState createState() => _ScaffoldSampleState();
}

class _ScaffoldSampleState extends State<ScaffoldSample> {
  var _counter = 0;
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _incrementCounter() {
    setState((){
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar 顶部菜单栏
      appBar: AppBar(
        title: Text('AppBar Title'),
      ),
      // Scaffold 中的主体布局
      body: Center(
        child: Text('You have pressed the button $_counter times.'),
      ),
      backgroundColor: Colors.green,
      bottomNavigationBar: BottomNavigationBar( // 底部导航
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(icon: Icon(Icons.format_list_bulleted), title: Text('List')),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('Me')),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ),
      // BottomAppBar 底部菜单栏
//      bottomNavigationBar: BottomAppBar(
//        color: Colors.grey,
//        shape: const CircularNotchedRectangle(),
//        child: Container(height: 50.0,),
//      ),
      // FloatingActionButton 悬浮按钮
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment Counter',
        child: Icon(Icons.add),
      ),
      // 指定悬浮按钮的位置
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop
    );
  }
}