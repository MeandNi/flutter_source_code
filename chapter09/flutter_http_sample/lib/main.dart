import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_http_sample/future_sample.dart';
import 'package:flutter_http_sample/http_sample.dart';
import 'package:flutter_http_sample/todo_list.dart';

void main() => runApp(MyApp());

const ITEMS = [
  {'title': 'Http Sample', 'route': '/http'},
  {'title': 'Future Sample', 'route': '/future'},
  {'title': 'Todo List', 'route': '/todolist'},
];

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/http': (context) => HttpSample(),
        '/future': (context) => FutureSample(),
        '/todolist': (context) => TodoList(),
      },
      home: MyHomePage(title: 'Flutter Animation'),
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
        title: Text("网络请求样例"),
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



