import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class GestureSample extends StatefulWidget {
  @override
  _GestureSampleState createState() => _GestureSampleState();
}

class _GestureSampleState extends State<GestureSample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gesture'),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                print("点按");
              },
              child: Container(
                height: 100.0,
                color: Colors.green,
                child: Center(child: Text('点按')),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            GestureDetector(
              onLongPress: () {
                print("长按");
              },
              onLongPressStart: (LongPressStartDetails details) {
                print("长按在" + details.globalPosition.toString() + "位置上开始发生");
              },
              child: Container(
                height: 100.0,
                color: Colors.green,
                child: Center(child: Text('长按')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DragGestureSample extends StatefulWidget {
  @override
  _DragGestureSampleState createState() => _DragGestureSampleState();
}

class _DragGestureSampleState extends State<DragGestureSample> {
  double _top = 0;
  double _left = 0;

  double _width = 100;
  double _height = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drag Gesture'),
      ),
      body: Center(
        child: GestureDetector(
          child: Container(
            width: _width,
            height: _height,
            color: Colors.green,
            child: Center(child: Text('缩放')),
          ),
          onScaleStart: (ScaleStartDetails details) {
            print("用户手指在${details.localFocalPoint.toString()}处开始缩放");
          },
          onScaleUpdate: (ScaleUpdateDetails details) {
            setState(() {
              //缩放倍数在0.8到10倍之间
              _width = _width * details.scale.clamp(.8, 10.0);
              _height = _height * details.scale.clamp(.8, 10.0);
            });
          },
          onScaleEnd: (ScaleEndDetails details) {
            print("缩放以 ${details.velocity.toString()} 速度移动结束");
          },
        ),
      ),
//      body: Stack(
//        children: <Widget>[
//          Positioned(
//            top: _top,
//            left: _left,
//            child: GestureDetector(
//              child: CircleAvatar(child: Text("A")),
//              //手指按下时会触发此回调
//              onPanDown: (DragDownDetails details) {
//                // 打印手指按下的位置(相对于屏幕)
//                print("用户手指在${details.globalPosition}处按下");
//              },
//              onPanStart: (DragStartDetails details) {
//                print("用户手指在${details.globalPosition}处开始移动");
//              },
//              // 手指滑动时会触发此回调
//              onPanUpdate: (DragUpdateDetails details) {
//                // 用户手指滑动时，更新偏移，重新构建
//                setState(() {
//                  _left += details.delta.dx;
//                  _top += details.delta.dy;
//                });
//              },
//              onPanEnd: (DragEndDetails details) {
//                // 打印滑动结束时在x、y轴上的速度
//                print("拖动以 ${details.velocity.toString()} 速度移动结束");
//              },
//            ),
//          )
//        ],
//      ),
//      body: Stack(
//        alignment: Alignment.topCenter,
//        children: <Widget>[
//          Positioned(
//            top: _top,
//            child: GestureDetector(
//              child: Container(
//                height: 100.0,
//                width: 100.0,
//                color: Colors.green,
//                child: Center(child: Text('垂直拖拽')),
//              ),
//              onVerticalDragDown: (DragDownDetails details) {
//                print("拖动在" + details.globalPosition.toString() + "处准备开始");
//              },
//              onVerticalDragStart: (DragStartDetails details) {
//                print("拖动在" + details.globalPosition.toString() + "处开始");
//              },
//              //垂直方向拖动事件
//              onVerticalDragUpdate: (DragUpdateDetails details) {
//                setState(() {
//                  _top += details.delta.dy;
//                });
//              },
//              onVerticalDragEnd: (DragEndDetails details) {
//                print("拖动以" + details.velocity.toString() + "速度结束");
//              },
//            ),
//          )
//        ],
//      ),
    );
  }
}
