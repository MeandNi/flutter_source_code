import 'package:flutter/material.dart';
import 'package:flutter_layout/built_in_layout/expanded_sample.dart';
import 'package:flutter_layout/built_in_layout/row_column_sample.dart';
import 'package:flutter_layout/built_in_layout/stack_sample.dart';
import 'package:flutter_layout/built_in_layout/table_sample.dart';
import 'package:flutter_layout/constrained_box/constrained_box_sample.dart';
import 'package:flutter_layout/custom_multi_child_layout/custom_multichild_layout.dart';
import 'package:flutter_layout/custom_scrollview/sliver_persistent_header.dart';
import 'package:flutter_layout/custom_scrollview/slivers_basic_page.dart';
import 'package:flutter_layout/custom_single_child_layout/custom_center.dart';

void main() => runApp(MyApp());

const ITEMS = [
  {'title': 'ConstrainedBox Sample', 'route': '/constraintsbox'},
  {'title': 'CustomCenter Sample', 'route': '/customcenter'},
  {
    'title': 'CustomMultiChildLayout Sample',
    'route': '/custommultichildlayout'
  },
  {'title': 'Sliver Sample', 'route': '/sliver'},
  {
    'title': 'SliverPersistentHeader Sample',
    'route': '/sliverpersistentheader'
  },
  {'title': 'Row、Column Sample', 'route': '/rowcolumn'},
  {'title': 'Stack Sample', 'route': '/stack'},
  {'title': 'Expanded Sample', 'route': '/expanded'},
  {'title': 'Table Sample', 'route': '/table'},
];

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/constraintsbox': (context) => ConstrainedBoxSample(),
        '/customcenter': (context) => CustomCenterSample(),
        '/custommultichildlayout': (context) => CustomMultiChildLayoutSample(),
        '/sliver': (context) => SliversBasicPage(),
        '/sliverpersistentheader': (context) => SliverPersistentHeaderSample(),
        '/rowcolumn': (context) => RowColumnSample(),
        '/stack': (context) => StackSample(),
        '/expanded': (context) => ExpandedSample(),
        '/table': (context) => TableSample(),
      },
      home: MyHomePage(title: 'Flutter Layout'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Layout 样例"),
      ),
      body: ListView.builder(
          itemCount: ITEMS.length,
          shrinkWrap: true,
          itemBuilder: (builder, index) {
            return ItemView(
              index: index,
            );
          }),
    );
  }
}

class ItemView extends StatelessWidget {
  final int index;

  const ItemView({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: ListTile(
        onTap: () {
          Navigator.of(context).pushNamed('${ITEMS[index]['route']}');
        },
        title: Text(
          ITEMS[index]['title'],
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
          ),
        ),
        trailing: Icon(Icons.keyboard_arrow_right),
      ),
    );
  }
}
