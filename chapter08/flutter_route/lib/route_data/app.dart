import 'package:flutter/material.dart';

class RouteDataApp extends StatelessWidget {


  final RouteObserver<PageRoute> routeObserver = new RouteObserver<PageRoute>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '路由数据',
      home: Screen1(),
      routes: {
        '/screen3': (context) => Screen3(),
      },
      navigatorObservers: [routeObserver],
    );
  }
}

class Screen1 extends StatefulWidget {
  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {

  String receive = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('screen1'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Screen1',
              style: TextStyle(fontSize: 20.0),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => Screen2('meandni')),
                );
              },
              child: Text('组件路由打开Screen2'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(
                    context,
                    '/screen3',
                    arguments: {"username": 'meandni'});
              },
              child: Text('命名路由打开Screen3'),
            ),
            RaisedButton(
              onPressed: () async{
                Future<String> value = Navigator.push<String>(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => Screen4()),
                );
                value.then((result) {
                  receive = result;
                });
              },
              child: Text('打开并接受 Screen4 的数据'),
            ),
            Text("接受的数据：$receive")
          ],
        ),
      ),
    );
  }
}

class Screen2 extends StatelessWidget {
  final String data;

  Screen2(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen2'),
      ),
      body: Center(
        child: Text(
          'data: $data',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}

class Screen3 extends StatelessWidget {
  String username;

  @override
  Widget build(BuildContext context) {
    dynamic obj = ModalRoute.of(context).settings.arguments;
    if (obj != null && obj["username"] != null) {
      username = obj["username"];
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen3'),
      ),
      body: Center(
        child: Text(
          'username: $username',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}

class Screen4 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen4'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () async{
            Navigator.pop(context, "hello");
          },
          child: Text('返回数据'),
        ),
      ),
    );
  }
}


