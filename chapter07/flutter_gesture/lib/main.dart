import 'package:flutter/material.dart';
import 'package:flutter_gesture/canvas/canvas_sample.dart';
import 'package:flutter_gesture/gesture/gesture_sample.dart';
import 'package:flutter_gesture/gesture/listener_sample.dart';
import 'package:flutter_gesture/gesture/win_gesture.dart';
import 'package:flutter_gesture/gesturewithcanvas/canvas_with_animation.dart';
import 'package:flutter_gesture/gesturewithcanvas/canvas_with_gesture.dart';

void main() => runApp(MyApp());

const ITEMS = [
  {'title': 'Gesture Sample', 'route': '/gesture'},
  {'title': '拖拽手势', 'route': '/draggesture'},
  {'title': 'WinGestureSample', 'route': '/wingesture'},
  {'title': 'Listener Sample', 'route': '/listener'},
  {'title': 'Canvas Sample', 'route': '/canvas'},
  {'title': '画布与手势结合', 'route': '/canvaswithgesture'},
  {'title': '画布与手势结合', 'route': '/canvaswithanimation'},
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
        '/gesture': (context) => GestureSample(),
        '/draggesture': (context) => DragGestureSample(),
        '/wingesture': (context) => WinGestureSample(),
        '/listener': (context) => ListenerSample(),
        '/canvas': (context) => CanvasSample(),
        '/canvaswithgesture': (context) => CanvasWithGesture(),
        '/canvaswithanimation': (context) => CanvasWithAnimation(),
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
        title: Text("Geature 和 Canvas"),
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
