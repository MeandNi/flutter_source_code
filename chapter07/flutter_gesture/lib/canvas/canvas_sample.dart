import 'package:flutter/material.dart';
import 'dart:math';

class CanvasSample extends StatefulWidget {
  @override
  _CanvasSampleState createState() => _CanvasSampleState();
}

class _CanvasSampleState extends State<CanvasSample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Canvas'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(32.0),
          child: CusTomCanvas(),
        ),
      ),
    );
  }
}

class CusTomCanvas extends StatefulWidget {
  @override
  _CusTomCanvasState createState() => _CusTomCanvasState();
}

class _CusTomCanvasState extends State<CusTomCanvas> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: MyCustomPainter(),
      size: Size(200.0, 200.0),
//      size: Size(400.0, 400.0),
//      child: Container(
//        width: 300.0,
//        height: 300.0,
//        alignment: Alignment.center,
//        child: Text(
//          'MeandNi',
//          style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic),
//        ),
//      ),
    );
  }
}

class MyCustomPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10.0
      ..strokeCap = StrokeCap.round;


    canvas.drawLine(Offset(0.0, 0.0), Offset(size.width, size.height), paint);

    canvas.drawCircle(
        Offset(size.width / 2, size.height / 2),
        sqrt(pow(size.width, 2) + pow(size.width, 2))/2,
        paint
    );

    var path = Path();
    path.moveTo(0, size.height / 2);
    path.lineTo(size.width / 2, size.height * 5 / 6);
    path.lineTo(size.width, 0);
    path.close();

    paint.color = Colors.green;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5.0;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

