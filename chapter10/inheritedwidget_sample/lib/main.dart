import 'package:flutter/material.dart';
import 'package:inheritedwidget_sample/app_state.dart';
import 'package:inheritedwidget_sample/screens/add_screen.dart';
import 'package:inheritedwidget_sample/screens/home_screen.dart';
import 'package:inheritedwidget_sample/state_container.dart';

void main() {
  runApp(
    new StateContainer(
      state: AppState(),
      child: HomeApp()
    ),
  );
}
 
class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Inherited Widget Demo',
      routes: {
        '/': (context) => HomeScreen(),
        '/addItem': (context) => AddScreen(),
      }
    );
  }
}