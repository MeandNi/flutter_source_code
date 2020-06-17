import 'package:flutter/material.dart';

class AnimationSample extends StatefulWidget {
  @override
  _AnimationSampleState createState() => _AnimationSampleState();
}

// 混入 SingleTickerProviderStateMixin 使对象实现 Ticker 功能
class _AnimationSampleState extends State<AnimationSample>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> curveAnimation;
  Animatable animatable;
  Animation<Color> tweenAnimation;
  ColorTween tween;

  @override
  void initState() {
    super.initState();
    // 创建 AnimationController 动画
    _controller = AnimationController(
      vsync: this, // 传入 Ticker 对象
      duration: new Duration(milliseconds: 1000), // 传入动画持续的时间
    );
    _controller.addListener(() {
      setState(() {});
    });
    curveAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
      reverseCurve: Curves.easeInOut,
    );
    tween =  ColorTween(begin: Colors.red, end: Colors.blue);
    tweenAnimation = tween.animate(_controller);
  }

  void startAnimation() {
    if (_controller.status == AnimationStatus.completed) {
      _controller.reverse();
    } else {
      // 调用 AnimationController 的 forward 方法启动动画
      _controller.forward();
    }
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: curveAnimation.value * 200,
              height: curveAnimation.value * 100,
              color: Colors.green,
            ),
            Container(
              width: _controller.value * 200,
              height: _controller.value * 100,
              color: Colors.blue,
            ),
            Container(
              width: 100,
              height: 100,
              color: tweenAnimation.value,
            ),
          ],
        ),
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
