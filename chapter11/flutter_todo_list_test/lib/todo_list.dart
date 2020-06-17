import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final todos = <String>[];
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('ListView'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              TextField(
                key: Key("todo-text_field"),
                controller: controller,
              ),
              Expanded(
                  child: ListView.builder(
                key: Key("list-view"),
                itemCount: todos.length,
                itemBuilder: (BuildContext context, int index) {
                  final todo = todos[index];

                  return Dismissible(
                      background: Container(
                        color: Colors.red,
                      ),
                      key: Key('dismissible $todo'),
                      onDismissed: (direction) {
                        setState(() {
                          todos.removeAt(index);
                        });
                      },
                      child: ListTile(
                          title: Text(
                        todo,
                        key: Key('$todo'),
                      )));
                },
              ))
            ])),
        floatingActionButton: FloatingActionButton(
          key: Key("add-button"),
          onPressed: () {
            setState(() {
              todos.add(controller.text);
              controller.clear();
            });
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
