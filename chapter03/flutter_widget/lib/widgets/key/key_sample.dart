import 'dart:math';

import 'package:flutter/material.dart';

class KeySample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => KeySampleState();
}

class KeySampleState extends State<KeySample> {
  List<Widget> containers = [
    ColorfulContainer(key: UniqueKey()),
    ColorfulContainer(key: UniqueKey()),
//    ColorfulContainer(key: ValueKey("colorfulcontainer1")),
//    ColorfulContainer(key: ValueKey("colorfulcontainer2")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Key Sample"),),
      body: Row(children: containers),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.swap_horiz), onPressed: swapContainers),
    );
  }

  swapContainers() {
    setState(() {
      containers.insert(1, containers.removeAt(0));
    });
  }
}

class ColorfulContainer extends StatefulWidget {
  ColorfulContainer({Key key}) : super(key: key);

  @override
  _ColorfulContainerState createState() => _ColorfulContainerState();
}

class _ColorfulContainerState extends State<ColorfulContainer> {

  Color myColor;

  @override
  void initState() {

    super.initState();
    myColor = UniqueColorGenerator.getColor();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: myColor,
        child: Padding(
          padding: EdgeInsets.all(70.0),
        ));
  }
}

class UniqueColorGenerator {
  static Random random = new Random();

  static Color getColor() {
    return Color.fromARGB(
        255, random.nextInt(255), random.nextInt(255), random.nextInt(255));
  }
}


class PageStorageKeySample extends StatefulWidget {
  @override
  _PageStorageKeySampleState createState() => _PageStorageKeySampleState();
}

class _PageStorageKeySampleState extends State<PageStorageKeySample> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("PageStorageKey"),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.looks_one), text: "List1"),
              Tab(icon: Icon(Icons.looks_two), text: "List2"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildList(key: "key1", string: "List1: "),
            _buildList(key: "key2", string: "List2: "),
          ],
        ),
      ),
    );
  }

  Widget _buildList({String key, String string}) {
    return ListView.builder(
      key: PageStorageKey(key),
      itemBuilder: (_, i) => ListTile(title: Text("${string} ${i}")),
    );
  }
}