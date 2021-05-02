import 'package:objective/config/constant.dart';
import 'package:objective/models/target/target.dart';
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

  static Future<List<Target>> getTarget() async {
    try {
      var response = await http.get(Constant.apiUrl + 'target');
      ResponseData responseData = response.data;
      if (responseData.status) {
        List<dynamic> listTarget = new List.from(responseData.data);
        List<Target> target = listTarget.map((item) => Target.fromJson(item)).toList();
        return target;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
