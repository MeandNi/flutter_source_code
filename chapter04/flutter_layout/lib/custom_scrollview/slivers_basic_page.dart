import 'package:flutter/material.dart';
import 'dart:math' as math;

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
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class SliversBasicPage extends StatelessWidget {
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
//          stretch: true,
            expandedHeight: 120.0,
            flexibleSpace: FlexibleSpaceBar(
//            background: Image.asset(
//              'assets/ronnie-mayo-361348-unsplash.jpg',
//              fit: BoxFit.cover,
//            ),
              title: Text('Slivers'),
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 50,
            delegate: SliverChildListDelegate([
              Container(color: Colors.blue),
              Container(color: Colors.orange),
              Container(color: Colors.red),
              Container(color: Colors.green),
              Container(color: Colors.blue),
            ]),
          ),
//        SliverList(
//          delegate: SliverChildBuilderDelegate(
//            (context, index) {
//
//              if (index > 3) {
//                return null;
//              }
//
//              return Container(
//                height: 50,
//                alignment: Alignment.center,
//                color: Colors.orange[100 * (index % 9)],
//                child: Text('orange $index'),
//              );
//            },
//            childCount: 9,
//          ),
//        ),
          SliverPersistentHeader(
            pinned: true,
            delegate: _SliverAppBarDelegate(
              minHeight: 100.0,
              maxHeight: 200.0,
              child: Container(
                  color: Colors.lightBlue,
                  child: Center(
                      child: Text(
                    "SliverPersistentHeader",
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ))),
            ),
          ),

          SliverFixedExtentList(
            itemExtent: 50,
            delegate: SliverChildListDelegate([
              Container(color: Colors.blue),
              Container(color: Colors.orange),
              Container(color: Colors.red),
              Container(color: Colors.green),
              Container(color: Colors.blue),
            ]),
          ),
//        SliverAppBar(
//          title: Text(''),
//          pinned: true,
//          floating: true,
////          stretch: true,
//          expandedHeight: 120.0,
//          flexibleSpace: FlexibleSpaceBar(
//            background: Image.asset(
//              'assets/ronnie-mayo-361348-unsplash.jpg',
//              fit: BoxFit.cover,
//            ),
//            title: Text('Basic Slivers'),
//          ),
//        ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.green[100 * (index % 9)],
//                child: Text('grid item $index'),
                );
              },
              childCount: 30,
            ),
//           gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//             maxCrossAxisExtent: 200.0,
//             mainAxisSpacing: 10.0,
//             crossAxisSpacing: 10.0,
//             childAspectRatio: 4.0,
//           ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              childAspectRatio: 2.0,
            ),
          ),

          SliverFixedExtentList(
            itemExtent: 50,
            delegate: SliverChildListDelegate([
              Container(color: Colors.blue),
              Container(color: Colors.orange),
              Container(color: Colors.red),
              Container(color: Colors.green),
              Container(color: Colors.blue),
            ]),
          ),
          SliverFixedExtentList(
            itemExtent: 50,
            delegate: SliverChildListDelegate([
              Container(color: Colors.blue),
              Container(color: Colors.orange),
              Container(color: Colors.red),
              Container(color: Colors.green),
              Container(color: Colors.blue),
            ]),
          ),
          SliverFixedExtentList(
            itemExtent: 50,
            delegate: SliverChildListDelegate([
              Container(color: Colors.blue),
              Container(color: Colors.orange),
              Container(color: Colors.red),
              Container(color: Colors.green),
              Container(color: Colors.blue),
            ]),
          ),
//          SliverToBoxAdapter(
//            child: Container(
//              color: Colors.yellow,
//              padding: const EdgeInsets.all(8.0),
//              child: Text('Grid Header', style: TextStyle(fontSize: 24)),
//            ),
//          ),
//          SliverGrid.count(
//            crossAxisCount: 3,
//            mainAxisSpacing: 10.0,
//            crossAxisSpacing: 10.0,
//            childAspectRatio: 4.0,
//            children: <Widget>[
//              Container(color: Colors.red),
//              Container(color: Colors.green),
//              Container(color: Colors.blue),
//              Container(color: Colors.red),
//              Container(color: Colors.green),
//              Container(color: Colors.blue),
//            ],
//          ),
//          SliverGrid.extent(
//            maxCrossAxisExtent: 200,
//            mainAxisSpacing: 10.0,
//            crossAxisSpacing: 10.0,
//            childAspectRatio: 4.0,
//            children: <Widget>[
//              Container(color: Colors.pink),
//              Container(color: Colors.indigo),
//              Container(color: Colors.orange),
//              Container(color: Colors.pink),
//              Container(color: Colors.indigo),
//              Container(color: Colors.orange),
//            ],
//          ),
        ],
      ),
    );
  }
}
