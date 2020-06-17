part 'todo.g.dart';

class Todo {
	final int id;
	final String title;
	bool completed;

	Todo(this.id, this.title, this.completed);

	factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);

	Map<String, dynamic> toJson() => _$TodoToJson(this);
}

class AllTodos {
	final List<Todo> todos;

	AllTodos(this.todos);

	factory AllTodos.fromJson(List<dynamic> json) {
		List<Todo> todos = List<Todo>();
		todos = json.map((i) => Todo.fromJson(i)).toList();
		return AllTodos(todos);
	}

	factory AllTodos.fromSnapshot(dynamic s) {
		List<Todo> todos = s.documents.map((dynamic ds) {
			return Todo.fromJson(ds.data);
		}).toList();
		return AllTodos(todos);
	}

	Map<String, dynamic> toJson() => _$AllTodosToJson(this);
}









