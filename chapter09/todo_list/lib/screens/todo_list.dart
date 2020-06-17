import 'dart:async';
import 'package:flutter/material.dart';
import 'package:todo_list/models/todo.dart';
import 'package:todo_list/utils/database_helper.dart';
import 'package:todo_list/screens/todo_detail.dart';
import 'package:sqflite/sqflite.dart';

class TodoList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TodoListState();
  }
}

class TodoListState extends State<TodoList> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Todo> todos;

  @override
  void initState() {
    super.initState();

    todos = List<Todo>();
    updateListView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('待办事项'),
      ),
      body: getTodoListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateToAdd();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  ListView getTodoListView() {
    return ListView.builder(
        itemCount: todos.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
              title: Text(
                this.todos[index].title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(this.todos[index].description),
              trailing: IconButton(icon: Icon(Icons.delete_outline), onPressed: (){
                _delete(todos[index]);
              }));
        });
  }

  void _delete(Todo todo) async {
    int result = await databaseHelper.deleteTodo(todo.id);
    if (result != 0) {
      updateListView();
    }
  }

  void navigateToAdd() async {
    bool result =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return AddTodo();
    }));

    if (result == true) {
      updateListView();
    }
  }

  void updateListView() {
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) {
      Future<List<Todo>> todoListFuture = databaseHelper.getTodoList();
      todoListFuture.then((todoList) {
        setState(() {
          this.todos = todoList;
        });
      });
    });
  }
}
