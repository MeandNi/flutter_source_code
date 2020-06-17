import 'dart:math';
import 'package:flutter/material.dart';

class CanvasWithAnimation extends StatefulWidget {
  @override
  _CanvasWithAnimationState createState() => new _CanvasWithAnimationState();
}

class _CanvasWithAnimationState extends State<CanvasWithAnimation>
    with TickerProviderStateMixin {
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    var controller = AnimationController(
        duration: Duration(milliseconds: 2000), vsync: this);


    animation = Tween(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('画布与动画')),
      body: Center(
        child: CustomPaint(
          painter: MyCustomPainter(animation.value),
          size: Size(100.0, 100.0),
        ),
      ),
    );
  }
}

class MyCustomPainter extends CustomPainter {
  double _animationValue;

  MyCustomPainter(this._animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke //画笔样式：填充
      ..strokeWidth = 10.0
      ..strokeCap = StrokeCap.round;

    double leftLineFraction, rightLineFraction;

    if (_animationValue < .5) {
      leftLineFraction = _animationValue / .5;
      rightLineFraction = 0.0;
    } else {
      leftLineFraction = 1.0;
      rightLineFraction = (_animationValue - .5) / .5;
    }

    canvas.drawLine(
        Offset(0.0, 0.0),
        Offset(size.width * leftLineFraction, size.height * leftLineFraction),
        paint);

    canvas.drawLine(
        Offset(size.width, 0.0),
        Offset(size.width - size.width * rightLineFraction,
            size.height * rightLineFraction),
        paint);

    var rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: (sqrt(pow(size.width, 2) + pow(size.width, 2)) / 2),
    );
    canvas.drawArc(rect, -pi / 2, pi * 2 * _animationValue, false, paint);
  }

  @override
  bool shouldRepaint(MyCustomPainter oldDelegate) {
    return oldDelegate._animationValue != _animationValue;
  }
}
