import 'package:dio/dio.dart';
import 'package:objective/config/constant.dart';
import 'package:objective/models/user/user-login.dart';

class AuthService {
  static Future<Response> login(UserLoginForm user) async {
    try {
      final repsonse = await Dio().post(Constant.apiUrl + 'login', data: user.toJson());
      print(user);
      print(repsonse);
      return repsonse;
    } catch (e) {
      return null;
    }
  }
}
