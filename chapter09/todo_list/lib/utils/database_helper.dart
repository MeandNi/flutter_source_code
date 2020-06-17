import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:todo_list/models/todo.dart';

class DatabaseHelper {

	static DatabaseHelper _databaseHelper;    // Singleton DatabaseHelper
	static Database _database;                // Singleton Database

	String todoTable = 'todo_table';
	String colId = 'id';
	String colTitle = 'title';
	String colDescription = 'description';
	String colDate = 'date';

	DatabaseHelper._createInstance(); // 命名构造函数

	factory DatabaseHelper() {

		if (_databaseHelper == null) {
			_databaseHelper = DatabaseHelper._createInstance(); // This is executed only once, singleton object
		}
		return _databaseHelper;
	}

	Future<Database> get database async {

		if (_database == null) {
			_database = await initializeDatabase();
		}
		return _database;
	}

	Future<Database> initializeDatabase() async {
		// 设置数据库路径，这里使用 path 包下的 join 方法拼接路径字符串
    String path = join(await getDatabasesPath(), 'todos.db');

		// 创建并打开数据库并且拿到该数据库的引用
		Future<Database> todosDatabase = openDatabase(path, version: 1, onCreate: _createDb);
		return todosDatabase;
	}

	void _createDb(Database db, int newVersion) async {
    // 在数据库中执行该 sql 语句
		await db.execute('CREATE TABLE $todoTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colTitle TEXT, '
				'$colDescription TEXT, $colDate TEXT)');
	}

	Future<List<Map<String, dynamic>>> getTodoMapList() async {
		Database db = await this.database;

		var result = await db.query(todoTable, orderBy: '$colTitle ASC');
		return result;
	}

	Future<int> insertTodo(Todo todo) async {
		Database db = await this.database;
		var result = await db.insert(todoTable, todo.toMap());
		return result;
	}

	Future<int> updateTodo(Todo todo) async {
		var db = await this.database;
		var result = await db.update(todoTable, todo.toMap(), where: '$colId = ?', whereArgs: [todo.id]);
		return result;
	}

  	Future<int> updateTodoCompleted(Todo todo) async {
		var db = await this.database;
		var result = await db.update(todoTable, todo.toMap(), where: '$colId = ?', whereArgs: [todo.id]);
		return result;
	}

	Future<int> deleteTodo(int id) async {
		var db = await this.database;
//		int result = await db.rawDelete('DELETE FROM $todoTable WHERE $colId = $id');
		int result = await db.delete(todoTable, where: '$colId = ?', whereArgs: [id]);
		return result;
	}

	Future<int> getCount() async {
		Database db = await this.database;
		List<Map<String, dynamic>> x = await db.rawQuery('SELECT COUNT (*) from $todoTable');
		int result = Sqflite.firstIntValue(x);
		return result;
	}

	Future<List<Todo>> getTodoList() async {

		var todoMapList = await getTodoMapList(); // Get 'Map List' from database
		int count = todoMapList.length;         // Count the number of map entries in db table

		List<Todo> todoList = List<Todo>();
		for (int i = 0; i < count; i++) {
			todoList.add(Todo.fromMapObject(todoMapList[i]));
		}

		return todoList;
	}

}







