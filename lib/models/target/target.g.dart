// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'target.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Target _$TargetFromJson(Map<String, dynamic> json) {
  return Target(
    title: json['title'],
    description: json['description'],
    time: json['time'],
    isDone: json['isDone'],
    isPriority: json['isPriority'],
    subTask: json['subTask'] as List,
  );
}

Map<String, dynamic> _$TargetToJson(Target instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'time': instance.time,
      'isDone': instance.isDone,
      'isPriority': instance.isPriority,
      'subTask:': instance.subTask,
    };
