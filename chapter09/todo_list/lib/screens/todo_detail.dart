import 'dart:async';
import 'package:flutter/material.dart';
import 'package:todo_list/models/todo.dart';
import 'package:todo_list/utils/database_helper.dart';

class AddTodo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AddTodoState();
  }
}

class AddTodoState extends State<AddTodo> {
  DatabaseHelper helper = DatabaseHelper();

  Todo todo = new Todo();
  String title = '';
  String description = '';

  void _save() async {
    todo.title = title;
    todo.description = description;
    todo.date = DateTime.now().toString();

    await helper.insertTodo(todo);
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('添加待办事项'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(children: <Widget>[
          TextField(
            onChanged: (value) {
              title = value;
            },
            decoration: InputDecoration(labelText: '请输入标题'),
          ),
          TextField(
            onChanged: (value) {
              description = value;
            },
            decoration: InputDecoration(labelText: '请输入描述'),
          ),
          RaisedButton(
            child: Text(
              '保存',
            ),
            onPressed: () {
              _save();
            },
          )
        ]),
      ),
    );
  }
}
