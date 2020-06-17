
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ListenerSample extends StatefulWidget {
  @override
  _ListenerSampleState createState() => _ListenerSampleState();
}

class _ListenerSampleState extends State<ListenerSample> {

  int _downCounter = 0;
  int _upCounter = 0;
  double x = 0.0;
  double y = 0.0;

  void _incrementDown(PointerEvent details) {
    _updateLocation(details);
    setState(() {
      _downCounter++;
    });
  }
  void _incrementUp(PointerEvent details) {
    _updateLocation(details);
    setState(() {
      _upCounter++;
    });
  }
  void _updateLocation(PointerEvent details) {
    setState(() {
      x = details.position.dx;
      y = details.position.dy;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Listener'),),
      body: Center(
        child: ConstrainedBox(
          constraints: new BoxConstraints.tight(Size(300.0, 200.0)),
          child: Listener(
            onPointerDown: _incrementDown,
            onPointerMove: _updateLocation,
            onPointerUp: _incrementUp,
            child: Container(
              color: Colors.lightBlueAccent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('手势按下并且抬起的次数:'),
                  Text(
                    '$_downCounter 按下\n$_upCounter 抬起',
                    style: Theme.of(context).textTheme.display1,
                  ),
                  Text(
                    '手指正处于这个位置: (${x.toStringAsFixed(2)}, ${y.toStringAsFixed(2)})',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
