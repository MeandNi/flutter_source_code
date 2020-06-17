import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math' as math;

class CustomMultiChildLayoutSample extends StatefulWidget {
  @override
  _CustomMultiChildLayoutSampleState createState() =>
      _CustomMultiChildLayoutSampleState();
}

class _CustomMultiChildLayoutSampleState
    extends State<CustomMultiChildLayoutSample> {
  List<Widget> items = [];
  int count = 0;

  Widget _buildBody() {
    final List<Widget> childs = <Widget>[];
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double outerRadius = math.min(width * 3 / 4, height * 3 / 4);

    for (int i = 0; i < items.length; i++) {
      childs.add(_buildChild(i));
    }

    return Center(
      child: Container(
        width: width,
        height: height,
        padding: EdgeInsets.all(10.0),
        child: new CustomMultiChildLayout(
          delegate: new _CircularLayoutDelegate(
            itemCount: items.length,
            radius: outerRadius / 2,
          ),
          children: childs,
        ),
      ),
    );
  }

  Widget _buildChild(int index) {
    return new LayoutId(
      id: 'CHILD${index}',
      child: new Container(
        decoration: new BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.lightBlueAccent,
        ),
        width: 50.0,
        height: 50.0,
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text('sample')),
      body: _buildBody(),
      persistentFooterButtons: <Widget>[
        new FlatButton(
          onPressed: () {
            if (items.isEmpty) return;
            setState(() {
              items.removeLast();
            });
          },
          child: new Text("less"),
        ),
        FlatButton(
          onPressed: () {
            if (items.length > 20) return;
            setState(() {
              int index = items.length;
              items.add(_buildChild(index + 1));
            });
          },
          child: Text("add"),
        ),
      ],
    );
  }
}

const double _radiansPerDegree = math.pi / 180;

class _CircularLayoutDelegate extends MultiChildLayoutDelegate {
  static const String actionChild = 'CHILD';

  final double _startAngle = -90.0 * _radiansPerDegree;

  // 子组件数量
  final int itemCount;

  // 圆半径
  final double radius;

  _CircularLayoutDelegate({
    @required this.itemCount,
    @required this.radius,
  });

  Offset center;

  double _calculateItemAngle(int index) {
    double _itemSpacing = 360.0 / itemCount;
    return _startAngle + index * _itemSpacing * _radiansPerDegree;
  }

  @override
  void performLayout(Size size) {
    center = new Offset(size.width / 2, size.height / 2);
    for (int i = 0; i < itemCount; i++) {
      final String layoutId = '$actionChild$i';

      // 判断是否存在对应 layoutId 的子组件
      if (hasChild(layoutId)) {
        final Size childSize =
            layoutChild(layoutId, new BoxConstraints.loose(size));

        // 计算子组件的偏移角度
        final double itemAngle = _calculateItemAngle(i);

        // 放置子组件
        positionChild(
          layoutId,
          new Offset(
            (center.dx - childSize.width / 2) + (radius) * math.cos(itemAngle),
            (center.dy - childSize.height / 2) + (radius) * math.sin(itemAngle),
          ),
        );
      }
    }
  }

  @override
  bool shouldRelayout(_CircularLayoutDelegate oldDelegate) =>
      itemCount != oldDelegate.itemCount || radius != oldDelegate.radius;
}
