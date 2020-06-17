// https://medium.com/flutter/flutter-animation-basics-with-implicit-animations-95db481c5916
import 'dart:math';

import 'package:flutter/animation.dart';

class CustomCurve extends Curve {
  final double count;
  CustomCurve({this.count = 1});

  Curve curve = Curves.easeInOutQuart;

  @override
  double transformInternal(double t) {
    return sin(count * 2 * pi * t) * 0.5 + 0.5;
  }
}