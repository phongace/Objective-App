class User {
  String name;

  bool isNewUser;

  String birthday;

  bool gender;

  User({
    this.name,
    this.gender,
    this.birthday,
    this.isNewUser,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      isNewUser: json['isNewUser'],
      birthday: json['birthday'],
      gender: json['gender'],
    );
  }

  @override
  String toString() {
    return 'name: $name, isNewUser: $isNewUser, gender: $gender';
  }
}
