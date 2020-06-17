import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_http_sample/models/todo.dart';
import 'package:http/http.dart' as http;

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  Future<List<Todo>> fetchData() async {
    http.Response response = await http
        .get('https://my-json-server.typicode.com/meandni/demo/todos');

    if (response.statusCode == 200) {
      return parseTodos(response.body.toString());
    } else {
      throw Exception('请求失败！');
    }
  }

  List<Todo> parseTodos(String responseBody) {
    List<dynamic> parsed = jsonDecode(responseBody);

    return parsed.map<Todo>((json) => Todo.fromJson(json)).toList();
  }

  Widget getTodoListView(List<Todo> todos) {
    return ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Checkbox(value: todos[index].completed, onChanged: null),
            title: Text(todos[index].title),
          );
        });
  }

//  Future<Todo> updateTodo(Todo todo, bool isCompleted) async {
//    todo.completed = isCompleted;
//    return await services.updateTodo(todo);
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JSON SAMPLE'),
      ),
      body: Center(
        child: FutureBuilder<List<Todo>>(
          future: fetchData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);

            if (snapshot.hasData) {
              List<Todo> todos = snapshot.data;
              return ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Checkbox(value: todos[index].completed, onChanged: null),
                      title: Text(todos[index].title),
                    );
                  });
            }

            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
