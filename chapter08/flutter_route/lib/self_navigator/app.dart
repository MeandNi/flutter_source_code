import 'package:flutter/material.dart';
import 'package:flutter_route/self_navigator/home.dart';

class SelfApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '自定义路由',
      home: HomeScreen(),
    );
  }
}

