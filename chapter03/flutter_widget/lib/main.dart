import 'package:flutter/material.dart';
import 'package:flutter_widget/widgets/align/align_sample.dart';
import 'package:flutter_widget/widgets/button/button_sample.dart';
import 'package:flutter_widget/widgets/checkbox/checkbox_switch_radio_sample.dart';
import 'package:flutter_widget/widgets/container/container_sample.dart';
import 'package:flutter_widget/widgets/form/form_sample.dart';
import 'package:flutter_widget/widgets/gridview/gridview_sample.dart';
import 'package:flutter_widget/widgets/icon/icon_sample.dart';
import 'package:flutter_widget/widgets/image/image_sample.dart';
import 'package:flutter_widget/widgets/listview/listview_sample.dart';
import 'package:flutter_widget/widgets/scaffold/appbar_sample.dart';
import 'package:flutter_widget/widgets/scaffold/drawer_sample.dart';
import 'package:flutter_widget/widgets/scaffold/scaffold_sample.dart';
import 'package:flutter_widget/widgets/text/text_sample.dart';
import 'package:flutter_widget/widgets/textfield/textfield_sample.dart';

void main() => runApp(MyApp());

const ITEMS = [
  {'title': 'Text Sample', 'route': '/text'},
  {'title': 'Image Sample', 'route': '/image'},
  {'title': 'Button Sample', 'route': '/button'},
  {'title': 'Icon Sample', 'route': '/icon'},
  {'title': 'TextField Sample', 'route': '/textfield'},
  {'title': 'Form Sample', 'route': '/form'},
  {'title': 'CheckBox Sample', 'route': '/checkbox'},
  {'title': 'Container Sample', 'route': '/container'},
  {'title': 'Align Sample', 'route': '/align'},
  {'title': 'ListView Sample', 'route': '/listview'},
  {'title': 'GridView Sample', 'route': '/gridview'},
  {'title': 'Scaffold Sample', 'route': '/scaffold'},
  {'title': 'AppBar Sample', 'route': '/appbar'},
  {'title': 'Drawer Sample', 'route': '/drawer'}
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
        '/text': (context) => TextSample(),
        '/image': (context) => ImageSample(),
        '/button': (context) => ButtonSample(),
        '/icon': (context) => IconSample(),
        '/textfield': (context) => TextFieldSample(),
        '/form': (context) => FormSample(),
        '/checkbox': (context) => CheckBoxSample(),
        '/container': (context) => ContainerSample(),
        '/align': (context) => AlignSample(),
        '/listview': (context) => ListViewSample(),
        '/gridview': (context) => GridViewSample(),
        '/scaffold': (context) => ScaffoldSample(),
        '/appbar': (context) => AppBarSample(),
        '/drawer': (context) => DrawerSample()
      },
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
    return Padding(
      padding:
      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context)
              .pushNamed('${ITEMS[index]['route']}');
        },
        child: Card(
          elevation: 5.0,
          child: new Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: <Widget>[
                  Text(
                    ITEMS[index]['title'],
                    style:
                    TextStyle(color: Colors.black, fontSize: 20.0),
                  ),
                  Icon(Icons.keyboard_arrow_right)
                ],
              )),
        ),
      ),
    );
  }
}
