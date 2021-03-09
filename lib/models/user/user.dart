class User {
  String name;

  bool isNewUser;

  String birthday;

  String gender;

  User({this.birthday, this.gender, this.name, this.isNewUser});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      isNewUser: json['isNewUser'],
      birthday: json['birthday'],
      gender: json['gender'],
    );
  }
}
