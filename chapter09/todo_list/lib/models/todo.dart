
class Todo {

	int id;
	String title;
	String description;
	String date;

	Todo({this.title, this.date, this.description});

	Todo.withId(this.id, this.title, this.date, [this.description]);

	Map<String, dynamic> toMap() {

		var map = Map<String, dynamic>();
		if (id != null) {
			map['id'] = id;
		}
		map['title'] = title;
		map['description'] = description;
		map['date'] = date;

		return map;
	}

	Todo.fromMapObject(Map<String, dynamic> map) {
		this.id = map['id'];
		this.title = map['title'];
		this.description = map['description'];
		this.date = map['date'];
	}
}









