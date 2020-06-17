import 'package:flutter/material.dart';
import 'package:flutter_route/route_animation/app.dart';
import 'package:flutter_route/route_data/app.dart';
import 'package:flutter_route/route_dialog/dialog_sample.dart';
import 'package:flutter_route/route_onserver/app.dart';
import 'package:flutter_route/self_navigator/app.dart';

void main() => runApp(MyApp());

const ITEMS = [
  {'title': '嵌套路由', 'route': '/selfnavigator'},
  {'title': '路由动画', 'route': '/routeanimation'},
  {'title': '路由数据', 'route': '/routedata'},
  {'title': '路由监听', 'route': '/routeobserver'},
  {'title': '路由弹窗', 'route': '/routedialog'},
];

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/selfnavigator': (context) => SelfApp(),
        '/routeanimation': (context) => RouteAnimationApp(),
        '/routedata': (context) => RouteDataApp(),
        '/routeobserver': (context) => RouteObserverApp(),
        '/routedialog': (context) => DialogSample(),
      },
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Layout 样例"),
      ),
      body: ListView.builder(
          itemCount: ITEMS.length,
          shrinkWrap: true,
          itemBuilder: (builder, index) {
            return ItemView(
              index: index,
            );
          }),
    );
  }
}

class ItemView extends StatelessWidget {

  final int index;

  const ItemView({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context)
              .pushNamed('${ITEMS[index]['route']}');
        },
        child: Card(
          elevation: 5.0,
          child: new Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: <Widget>[
                  Text(
                    ITEMS[index]['title'],
                    style:
                    TextStyle(color: Colors.black, fontSize: 20.0),
                  ),
                  Icon(Icons.keyboard_arrow_right)
                ],
              )),
        ),
      ),
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
                  new MaterialPageRoute(builder: (context) => Screen2('screen2')),
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

class Screen2 extends StatefulWidget {
  final String title;

  Screen2(this.title);
  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen2'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              'Screen2',
              style: TextStyle(fontSize: 20.0),
            ),
            RaisedButton(
              onPressed: () {},
              child: Text('打开Screen3'),
            ),
          ],
        ),
      ),
    );
  }
}

class Screen3 extends StatefulWidget {
  @override
  _Screen3State createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen3'),
      ),
      body: Center(
        child: Text(
          'Screen3',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}
