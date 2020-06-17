import 'dart:convert';

import 'package:flutter_todo_list_test/models/todo.dart';
import 'package:http/http.dart';


class HttpServices {
  Future<List<Todo>> getTodos(Client client) async {
    final response =
    await client.get('https://jsonplaceholder.typicode.com/todos');

    if (response.statusCode == 200) {
      // 请求成功，解析 JSON 字符串
      var all = AllTodos.fromJson(json.decode(response.body));
      return all.todos;
    } else {
      throw Exception('请求失败');
    }
  }
}
