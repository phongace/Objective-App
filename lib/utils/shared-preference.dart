import 'dart:convert';

import 'package:objective/models/common/token.dart';
import 'package:objective/models/user/user-login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsService {
  static TokenObj tokenObj;

  static Future<TokenObj> setTokenObj(String str) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', str);
    Map map = jsonDecode(str);
    tokenObj = TokenObj.fromJson(map);
    return tokenObj;
  }

  static Future<TokenObj> getTokenObj() async {
    try {
      if (tokenObj?.accessToken == null) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        String token = prefs.getString('token');
        if (token == null || token == '') {
          return null;
        }
        Map map = jsonDecode(token);
        tokenObj = TokenObj.fromJson(map);
        return tokenObj;
      } else {
        return tokenObj;
      }
    } catch (e) {
      return null;
    }
  }

  static removeToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
  }

  static Future<void> setUserCredential(UserLoginForm user) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString('userCredential', jsonEncode(user));
  }

  static Future<UserLoginForm> getUserCredential() async {
    try {
      var prefs = await SharedPreferences.getInstance();
      String user = prefs.getString('userCredential');
      Map<String, dynamic> str = jsonDecode(user);
      return UserLoginForm.fromJson(str);
    } catch (e) {
      return new UserLoginForm();
    }
  }
}
