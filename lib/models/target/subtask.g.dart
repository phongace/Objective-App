// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subtask.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Subtask _$SubtaskFromJson(Map<String, dynamic> json) {
  return Subtask(
    title: json['title'],
    description: json['description'],
    isDone: json['isDone'],
  );
}

Map<String, dynamic> _$SubtaskToJson(Subtask instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'isDone': instance.isDone,
    };
