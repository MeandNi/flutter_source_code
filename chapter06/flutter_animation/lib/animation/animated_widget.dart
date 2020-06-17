import 'package:flutter/material.dart';

class AnimatedWidgetSample extends StatefulWidget {
  @override
  _AnimatedWidgetSampleState createState() => _AnimatedWidgetSampleState();
}

class _AnimatedWidgetSampleState extends State<AnimatedWidgetSample>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Alignment> alignmentAnimation;
  Animation<Offset> offsetAnimation;


  @override
  void initState() {
    super.initState();
    // 创建 AnimationController 动画
    _controller = AnimationController(
        vsync: this, duration: new Duration(seconds: 1));
    AlignmentTween alignmentTween = AlignmentTween(begin: Alignment.topLeft, end: Alignment.bottomRight);
    alignmentAnimation = alignmentTween.animate(_controller);
    offsetAnimation = Tween<Offset>(begin: Offset(0, 0), end: Offset(0.5, 1))
        .animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animated Widget')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
//            ScaleTransition(
//              scale: _controller,
//              child: Container(
//                color: Colors.blue,
//                width: 200,
//                height: 100,
//              ),
//            ),
//            Container(
//              height: 300.0,
//              color: Colors.green,
//              child: AlignTransition(
//                alignment: alignmentAnimation,
//                child: Container(
//                  color: Colors.red,
//                  width: 200,
//                  height: 100,
//                ),
//              ),
//            ),
            MoonTransition(animation: _controller),
            AnimatedBuilder(
              animation: _controller,
              builder: (BuildContext context, Widget child) {
                return Container(
                  height: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.yellow,
                        Colors.transparent,
                      ],
                      stops: [0, _controller.value],
                    ),
                  ),
                );
              },
            )
//            BeamTransition(animation: _controller),

//            SlideTransition(
//              position: offsetAnimation,
//              child: Container(
//                color: Colors.red,
//                width: 200,
//                height: 100,
//              ),
//            )
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

class MoonTransition extends AnimatedWidget {
  MoonTransition({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Container(
      height: 200,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.yellow,
            Colors.transparent,
          ],
          stops: [0, animation.value],
        ),
      ),
    );
  }
}

class BeamClipper extends CustomClipper<Path> {
  const BeamClipper();

  @override
  getClip(Size size) {
    return Path()
      ..lineTo(size.width / 2, size.height / 2)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..lineTo(size.width / 2, size.height / 2)
      ..close();
  }

  /// Return false always because we always clip the same area.
  @override
  bool shouldReclip(CustomClipper oldClipper) => false;
}
