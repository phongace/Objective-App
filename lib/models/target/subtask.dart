import 'package:json_annotation/json_annotation.dart';

part 'subtask.g.dart';

@JsonSerializable()
class Subtask {
  String title;

  String description;

  bool isDone;

  Subtask({
    this.title,
    this.description,
    this.isDone,
  });

  factory Subtask.fromJson(Map<String, dynamic> json) => _$SubtaskFromJson(json);

  Map<String, dynamic> toJson() => _$SubtaskToJson(this);
}
