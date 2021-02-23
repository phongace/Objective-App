class User {
  String name;

  String birthday;

  String gender;

  User({this.birthday, this.gender, this.name});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      birthday: json['birthday'],
      gender: json['gender'],
      name: json['name'],
    );
  }
}
