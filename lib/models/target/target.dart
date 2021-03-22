class Target {
  String title;

  String description;

  String time;

  bool isDone;

  bool isPriority;

  Target({
    this.title,
    this.description,
    this.time,
    this.isDone,
    this.isPriority,
  });

  factory Target.fromJson(Map<String, dynamic> json) {
    return Target(
      title: json['title'],
      description: json['description'],
      time: json['time'],
      isDone: json['isDone'],
      isPriority: json['isPriority'],
    );
  }

  @override
  String toString() {
    return 'title: $title, time: $time, isDone: $isDone, isPriority: $isPriority';
  }
}
