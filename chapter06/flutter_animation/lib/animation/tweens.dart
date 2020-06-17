import 'package:flutter/material.dart';

class TweenSample extends StatefulWidget {
  _TweenSampleState createState() => _TweenSampleState();
}

class _TweenSampleState extends State<TweenSample>
    with SingleTickerProviderStateMixin {
  static const Duration _duration = Duration(seconds: 1);
  AnimationController controller;
  Animation<double> tweenAnimation;

  ColorTween colorTween = ColorTween(begin: Colors.red, end: Colors.black);
  SizeTween sizeTween = SizeTween(begin: Size(10.0, 10.0), end: Size(100.0, 100.0));
  AlignmentTween alignmentTween = AlignmentTween(begin: Alignment.topLeft, end: Alignment.bottomRight);

  void initState() {
    super.initState();

    controller = AnimationController(vsync: this, duration: _duration)
      ..addListener(() {
        // Marks the widget tree as dirty
        setState(() {});
      });
    tweenAnimation = Tween(begin: 0.0, end: 1000000.0).animate(controller);


  }

  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 200),
              child: Text('\$${tweenAnimation.value.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 24)),
            ),
            RaisedButton(
              child: Text(
                controller.status == AnimationStatus.completed
                    ? '启动'
                    : '回滚',
              ),
              onPressed: () {
                if (controller.status == AnimationStatus.completed) {
                  controller.reverse();
                } else {
                  controller.forward();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
