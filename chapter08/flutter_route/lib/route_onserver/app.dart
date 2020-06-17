import 'package:flutter/material.dart';
import 'package:flutter_route/route_onserver/my_observer.dart';

void main() => runApp(RouteObserverApp());

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();


class RouteObserverApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      navigatorObservers: [MyRouteObserver()],
      home: Screen1(),
      routes: {
        'screen2': (context) => Screen2(),
        'screen3': (context) => Screen3(),
      },
    );
  }
}

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Screen 1'),
            SizedBox(height: 30.0),
            RaisedButton(
              child: Text('Screen 2'),
              onPressed: () => Navigator.of(context).pushNamed('screen2'),
            ),
            RaisedButton(
              child: Text('Screen 3'),
              onPressed: () => Navigator.of(context).pushNamed('screen3'),
            ),
            RaisedButton(
              child: Text('Screen 4'),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Screen4())),
            )
          ],
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: Center(child: Text('Screen 2')));
  }
}

class Screen3 extends StatefulWidget {
  @override
  _Screen3State createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: Center(child: Text('Screen 3')));
  }
}

class Screen4 extends StatefulWidget {
  @override
  _Screen4State createState() => _Screen4State();
}

class _Screen4State extends State<Screen4> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: Center(child: Text('Screen 4')));
  }
}