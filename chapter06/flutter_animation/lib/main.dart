import 'package:flutter/material.dart';
import 'package:flutter_animation/animation/animated_container.dart';
import 'package:flutter_animation/animation/animated_widget.dart';
import 'package:flutter_animation/animation/implicitly_animated_widget.dart';
import 'package:flutter_animation/animation/tweens.dart';

void main() => runApp(MyApp());


const ITEMS = [
  {'title': 'Animation Sample', 'route': '/animation'},
  {'title': 'Tween Sample', 'route': '/tween'},
  {'title': 'AnimatedWidget Sample', 'route': '/animatedwidget'},
  {'title': 'ImplicitlyAnimatedWidget Sample', 'route': '/implicitlyanimatedwidget'},
];

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/animation': (context) => AnimationSample(),
        '/tween': (context) => TweenSample(),
        '/animatedwidget': (context) => AnimatedWidgetSample(),
        '/implicitlyanimatedwidget': (context) => ImplicitlyAnimatedWidgetSample(),
      },
      home: MyHomePage(title: 'Flutter Animation'),
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
        title: Text("动画样例"),
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
    return Card(
      elevation: 5.0,
      child: ListTile(
        onTap: () {
          Navigator.of(context).pushNamed('${ITEMS[index]['route']}');
        },
        title: Text(
          ITEMS[index]['title'],
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
          ),
        ),
        trailing: Icon(Icons.keyboard_arrow_right),
      ),
    );
  }
}
