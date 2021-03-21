class Target {
  String title;

  String description;

  bool isDone;

  bool isPriority;

  Target({
    this.title,
    this.description,
    this.isDone,
    this.isPriority,
  });

  factory Target.fromJson(Map<String, dynamic> json) {
    return Target(
      title: json['title'],
      description: json['description'],
      isDone: json['isDone'],
      isPriority: json['isPriority'],
    );
  }

  @override
  String toString() {
    return 'title: $title, isDone: $isDone, isPriority: $isPriority';
  }
}
