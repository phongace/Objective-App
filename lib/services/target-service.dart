import 'package:objective/config/constant.dart';
import 'package:objective/plugin/dio.dart';
import 'package:objective/response/response-data.dart';

abstract class TargetService {
  static Future<ResponseData> addTarget(Map data) async {
    try {
      var response = await http.post(Constant.apiUrl + 'target', data: data);
      ResponseData responseData = response.data;
      return responseData;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
