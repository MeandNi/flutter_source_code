import 'package:flutter/material.dart';

class DrawPoint {
  final Offset position;
  final Color color;

  DrawPoint({@required this.position, this.color = Colors.black});
}

class CanvasWithGesture extends StatefulWidget {
  @override
  _CanvasWithGestureState createState() => new _CanvasWithGestureState();
}

class _CanvasWithGestureState extends State<CanvasWithGesture> {
  List<DrawPoint> _points = <DrawPoint>[];
  Color painterColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text('交互式画板')),
      body: new Container(
        child: new GestureDetector(
          // 使用二维推拽手势的相关属性获取用户手势的位置
          onPanUpdate: (DragUpdateDetails details) {
            setState(() {
              Offset _localPosition = details.localPosition;
              _points = new List.from(_points)
                ..add(new DrawPoint(
                  position: _localPosition,
                  color: painterColor,
                ));
            });
          },
          onPanEnd: (DragEndDetails details) => _points.add(null),
          child: new CustomPaint(
            painter: new Drawer(points: _points),
            size: Size.infinite,
          ),
        ),
      ),
      // 清除按钮
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.clear),
        onPressed: () {
          setState(() {
            _points.clear();
          });
        },
      ),
      // 取色板
      persistentFooterButtons: <Widget>[
        FlatButton(
          onPressed: () {
            painterColor = Colors.black;
          },
          child: Container(
            width: 50,
            height: 50,
            color: Colors.black,
          ),
        ),
        FlatButton(
          onPressed: () {
            painterColor = Colors.red;
          },
          child: Container(
            width: 50,
            height: 50,
            color: Colors.red,
          ),
        ),
        FlatButton(
          onPressed: () {
            painterColor = Colors.yellow;
          },
          child: Container(
            width: 50,
            height: 50,
            color: Colors.yellow,
          ),
        ),
        FlatButton(
          onPressed: () {
            painterColor = Colors.blue;
          },
          child: Container(
            width: 50,
            height: 50,
            color: Colors.blue,
          ),
        ),
        FlatButton(
          onPressed: () {
            painterColor = Colors.pink;
          },
          child: Container(
            width: 50,
            height: 50,
            color: Colors.pink,
          ),
        ),
      ],
    );
  }
}

class Drawer extends CustomPainter {
  List<DrawPoint> points;

  Drawer({this.points});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10.0;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        paint.color = points[i + 1].color;
        Offset preOffent = points[i].position;
        Offset offset = points[i + 1].position;
        canvas.drawLine(preOffent, offset, paint);
      }
    }
  }

  @override
  bool shouldRepaint(Drawer oldDelegate) => oldDelegate.points != points;
}
