// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_serializable.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoSerializable _$TodoSerializableFromJson(Map<String, dynamic> json) {
  return TodoSerializable(
    json['userId'] as int,
    json['id'] as int,
    json['title'] as String,
    json['completed'] as bool,
  );
}

Map<String, dynamic> _$TodoSerializableToJson(TodoSerializable instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
      'completed': instance.completed,
    };
