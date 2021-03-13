import 'package:objective/config/constant.dart';
import 'package:objective/models/user/user.dart';
import 'package:objective/plugin/dio.dart';
import 'package:objective/response/response-data.dart';

abstract class UserService {
  static Future<User> getUser() async {
    try {
      final response = await http.get(Constant.apiUrl + 'user');
      ResponseData responseData = response.data;
      dynamic map = responseData.data;
      User user = User.fromJson(map);
      return user;
    } catch (e) {
      return null;
    }
  }

  static Future<User> updateName(Map data) async {
    try {
      final response = await http.put(Constant.apiUrl + 'user/updateName', data: data);
      ResponseData responseData = response.data;
      dynamic map = responseData.data;
      User user = User.fromJson(map);
      return user;
    } catch (e) {
      return null;
    }
  }
}
