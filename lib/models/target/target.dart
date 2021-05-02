import 'package:json_annotation/json_annotation.dart';

part 'target.g.dart';

@JsonSerializable()
class Target {
  String title;

  String description;

  String time;

  bool isDone;

  bool isPriority;

  List<dynamic> subTask;

  Target({this.title, this.description, this.time, this.isDone, this.isPriority, this.subTask});

  factory Target.fromJson(Map<String, dynamic> json) => _$TargetFromJson(json);

  Map<String, dynamic> toJson() => _$TargetToJson(this);

  @override
  String toString() {
    return 'title: $title, time: $time, isDone: $isDone, isPriority: $isPriority, subTask: $subTask';
  }
}
