import 'package:objective/config/constant.dart';
import 'package:objective/plugin/dio.dart';
import 'package:objective/response/response-data.dart';

class AuthService {
  static Future<ResponseData> login(Map data) async {
    try {
      var repsonse = await http.post(Constant.apiUrl + 'login', data: data);
      ResponseData responseData = repsonse.data;
      return responseData;
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future<ResponseData> register(Map data) async {
    try {
      var repsonse = await http.post(Constant.apiUrl + 'register', data: data);
      ResponseData responseData = repsonse.data;
      return responseData;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
