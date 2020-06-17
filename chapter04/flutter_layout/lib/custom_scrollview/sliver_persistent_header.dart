import 'package:flutter/material.dart';
import 'dart:math' as math;

class SliverPersistentHeaderSample extends StatefulWidget {
  @override
  _SliverPersistentHeaderSampleState createState() =>
      _SliverPersistentHeaderSampleState();
}

class _SliverPersistentHeaderSampleState
    extends State<SliverPersistentHeaderSample> {


  SliverPersistentHeader makeHeader(String headerText) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverAppBarDelegate(
        minHeight: 60.0,
        maxHeight: 200.0,
        child: Container(
            color: Colors.green, child: Center(child:
        Text(headerText, style: TextStyle(color: Colors.white),))),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            automaticallyImplyLeading: false,
            title: Text(''),
            pinned: true,
            floating: true,
            expandedHeight: 120.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('SliverPersistentHeader'),
            ),
          ),
          makeHeader('SliverPersistentHeader 1'),
          SliverGrid.count(
            crossAxisCount: 3,
            children: [
              Container(color: Colors.red, height: 150.0),
            ],
          ),
          makeHeader('SliverPersistentHeader 2'),
          SliverGrid(
            gridDelegate: new SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 4.0,
            ),
            delegate: new SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return new Container(
                  alignment: Alignment.center,
                  color: Colors.teal[100 * (index % 9)],
                  child: new Text('grid item $index'),
                );
              },
              childCount: 20,
            ),
          ),
          makeHeader('SliverPersistentHeader 3'),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(color: Colors.pink, height: 150.0),
                Container(color: Colors.cyan, height: 150.0),
                Container(color: Colors.indigo, height: 150.0),
                Container(color: Colors.blue, height: 150.0),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(color: Colors.pink, height: 150.0),
                Container(color: Colors.cyan, height: 150.0),
                Container(color: Colors.indigo, height: 150.0),
                Container(color: Colors.blue, height: 150.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });
  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context,
      double shrinkOffset,
      bool overlapsContent)
  {
    return new SizedBox.expand(child: child);
  }
  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}