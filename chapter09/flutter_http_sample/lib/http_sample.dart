import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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