import 'package:flutter/cupertino.dart';
import 'package:objective/models/user/user.dart';
import 'package:objective/services/user-service.dart';

class UserProvider extends ChangeNotifier {
  User user;

  Future<User> getUser() async {
    user = await UserService.getUser();
    notifyListeners();
    return user;
  }
}
