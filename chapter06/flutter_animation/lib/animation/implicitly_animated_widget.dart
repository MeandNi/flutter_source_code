import 'package:flutter/material.dart';
import 'dart:math' as math;

class ImplicitlyAnimatedWidgetSample extends StatefulWidget {
  @override
  _ImplicitlyAnimatedWidgetSampleState createState() =>
      _ImplicitlyAnimatedWidgetSampleState();
}

class _ImplicitlyAnimatedWidgetSampleState
    extends State<ImplicitlyAnimatedWidgetSample> {
  ImplicitlyAnimatedWidget implicitlyAnimatedWidget;

  double width = 100;
  double height = 100;
  Color backgroundColor = Colors.blue;
  Alignment alignment = Alignment.topLeft;
  double opacity = 0.0;
  Color color = Colors.red;
  double angle = 0;

  void startAnimation() {
    setState(() {
      width = 300;
      height = 200;
      backgroundColor = Colors.green;
      alignment = Alignment.bottomRight;
      opacity = 1.0;
      color = Colors.blue;
      angle = math.pi;
    });
  }

  @override
  Widget build(BuildContext context) {
    List widgets = <Widget>[
      AnimatedContainer(
        duration: Duration(milliseconds: 2000),
        curve: Curves.easeInOut,
        width: width,
        height: height,
        color: backgroundColor,
      ),
      AnimatedContainer(
        duration: Duration(milliseconds: 2000),
        curve: Curves.easeInOut,
        alignment: alignment,
        width: 300,
        height: 200,
        color: Colors.green,
        child: Container(
          width: 100,
          height: 100,
          color: Colors.red,
        ),
      ),
      AnimatedOpacity(
        duration: Duration(milliseconds: 2000),
        opacity: opacity,
        child: Container(
          width: 100.0,
          height: 100.0,
          color: Colors.green,
        ),
      ),
      Container(
        width: 200.0,
        height: 200.0,
        child: MyAnimatedWidget(
          duration: Duration(milliseconds: 2000),
          color: color,
          child: Image.asset('images/flutter.png'),
        ),
      ),
      TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 0, end: angle),
        duration: Duration(seconds: 2),
        builder: (BuildContext context, double angle, Widget child) {
          return Transform.rotate(
            angle: angle,
            child: Image.asset('images/flutter.png'),
          );
        },
      )
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Implicitly Animated Widget')),
      body: ListView(
        children: widgets,
      ),
      persistentFooterButtons: <Widget>[
        FlatButton(
          onPressed: startAnimation,
          child: Text('启动动画'),
        ),
      ],
    );
  }
}

class MyAnimatedWidget extends ImplicitlyAnimatedWidget {
  MyAnimatedWidget({
    Key key,
    this.color, // 初始过滤颜色
    this.child,
    Curve curve = Curves.linear,
    @required Duration duration,
  }) : super(key: key, curve: curve, duration: duration);

  final Color color;
  final Widget child;

  @override
  _MyAnimatedWidgetState createState() => _MyAnimatedWidgetState();
}

class _MyAnimatedWidgetState extends AnimatedWidgetBaseState<MyAnimatedWidget> {
  ColorTween _colorTween;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _colorTween =
        visitor(_colorTween, widget.color, (value) => ColorTween(begin: value));
  }

  @override
  Widget build(BuildContext context) {
    //return a widget built on a parameter
    return ColorFiltered(
      child: widget.child,
      colorFilter:
          ColorFilter.mode(_colorTween.evaluate(animation), BlendMode.modulate),
    );
  }
}
