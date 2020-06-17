import 'package:json_annotation/json_annotation.dart';

/*
* 允许 Todo 类访问生成的文件中的私有成员，
* 以 *.g.dart 结尾的文件为自动生成的文件。
*/
part 'todo_serializable.g.dart';  // 1

// 注解，用于标识该类需要自动生成代码
@JsonSerializable()  // 2
class TodoSerializable {
  final int userId;
  final int id;
  final String title;
  bool completed;
  
  TodoSerializable(this.userId, this.id, this.title, this.completed);
  
  // 工厂构造函数，用于根据 map 生成对应的类对象，这里，会调用自动生成的一个方法 _$TodoFromJson
  factory TodoSerializable.fromJson(Map<String, dynamic> json) => _$TodoSerializableFromJson(json);  // 3
  
  Map<String, dynamic> toJson() => _$TodoSerializableToJson(this); // 4
}