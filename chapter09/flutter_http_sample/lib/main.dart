import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_http_sample/todo_list.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TodoList(),
    );
  }
}

class HttpSample extends StatefulWidget {
  @override
  _HttpSampleState createState() => _HttpSampleState();
}

class _HttpSampleState extends State<HttpSample> {

  Future<String> fetchData() async {
    http.Response response = await http.get('https://meandni.com/');

    if (response.statusCode == 200) {
      return response.body.toString();
    } else {
      throw Exception('请求失败！');
    }
  }

  Future<http.Response> postData(String data) {
    return http.post(
      'https://jsonplaceholder.typicode.com/albums',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: data
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HTTP SAMPLE'),
      ),
      body: Center(
        child: FutureBuilder<String>(
          future: fetchData(),
          builder: (context, snapshot) {

            if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            if (snapshot.hasData) {
              return Text(snapshot.data);
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

class FutureSample extends StatefulWidget {
  @override
  _FutureSampleState createState() => _FutureSampleState();
}

class _FutureSampleState extends State<FutureSample> {
  Future<String> _calculation = Future<String>.delayed(
  Duration(seconds: 2),
  () => '完成啦！',
  );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _calculation, // a previously-obtained Future<String> or null
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        List<Widget> children;
        if (snapshot.hasData) {
          children = <Widget>[
            Icon(
              Icons.check_circle_outline,
              color: Colors.green,
              size: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text('数据: ${snapshot.data}'),
            )
          ];
        } else {
          children = <Widget>[
            SizedBox(
              child: CircularProgressIndicator(),
              width: 60,
              height: 60,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text('等待异步事件完成...'),
            )
          ];
        }
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: children,
          ),
        );
      },
    );
  }
}
