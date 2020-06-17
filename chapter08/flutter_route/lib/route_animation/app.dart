import 'package:flutter/material.dart';
import 'package:flutter_route/route_animation/custom_route.dart';

class RouteAnimationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '路由动画',
      home: Screen1(),
    );
  }
}

class Screen1 extends StatefulWidget {
  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  void open() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('screen1'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              'Screen1',
              style: TextStyle(fontSize: 20.0),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  new CustomRoute(
                    builder: (context) => Screen2(),
                    barrierColor: Colors.green,
                    fullscreenDialog: true,
                  ),
                );
              },
              child: Text('打开Screen2'),
            ),
          ],
        ),
      ),
    );
  }
}

class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen2'),
      ),
      body: AnimatedPadding(
        padding: MediaQuery.of(context).viewInsets +
            EdgeInsets.symmetric(vertical: 30.0, horizontal: 24.0),
        curve: Curves.ease,
        duration: const Duration(milliseconds: 100),
        child: Material(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              24.0,
            ),
          ),
          color: Colors.blueAccent,
          child: Center(child: Text('ddd')),
        ),
      ),
    );
  }
}

class Screen2 extends StatefulWidget {

  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  ListView listView;
  WidgetBuilder builder;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: Text('Screen2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Screen2',
              style: TextStyle(fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }
}
