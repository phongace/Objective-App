import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:objective/config/constant.dart';
import 'package:objective/models/common/token.dart';
import 'package:objective/plugin/locator.dart';
import 'package:objective/plugin/navigator.dart';
import 'package:objective/response/response-data.dart';
import 'package:objective/router/routing-name.dart';
import 'package:objective/utils/shared-preference.dart';
import 'package:objective/utils/snackbar-builder.dart';

final NavigationService _navigationService = locator<NavigationService>();

Dio http = Dio(
  BaseOptions(
    connectTimeout: 10000,
    responseType: ResponseType.json,
    contentType: ContentType.json.toString(),
  ),
)..interceptors.addAll([buildInterceptorsWrapper()]);

buildInterceptorsWrapper() {
  return InterceptorsWrapper(
    onRequest: (RequestOptions requestOptions) async {
      http.interceptors.requestLock.lock();
      TokenObj tokenObj = await SharedPrefsService.getTokenObj();
      if (tokenObj != null && tokenObj.accessToken != null && tokenObj.accessToken != '') {
        requestOptions.headers[HttpHeaders.authorizationHeader] = 'Bearer ' + tokenObj.accessToken;
        http.interceptors.requestLock.unlock();
        return requestOptions;
      }
      http.interceptors.requestLock.unlock();
      return requestOptions;
    },
    onResponse: (Response response) async {
      // Do something with response data
      if (response != null && response.data != null) {
        if (response.data['status'] != null) {
          if (response.data['status'] == 'FAILED') {
            response.data['status'] = Constant.failStatus;
          } else {
            response.data['status'] = Constant.sucessStatus;
          }
        }
        ResponseData responseData = ResponseData.fromJson(response.data);
        String message = responseData.message ?? null;
        bool status = responseData.status;
        if (message != null && status != null) {
          String msg;
          Color color = status ? Colors.blue[600] : Colors.red;
          msg = message;
          SnackbarBuilder.showSnackbar(msg, color);
        }
        response.data = responseData;
        return response;
      }
      return response; // continue
    },
    onError: (DioError error) async {
      try {
        switch (error.type) {
          case DioErrorType.CANCEL:
            print('Request Cancelled');
            break;
          case DioErrorType.CONNECT_TIMEOUT:
            print('DioErrorType.CONNECT_TIMEOUT');
            break;
          case DioErrorType.DEFAULT:
            print('DioErrorType.DEFAULT');
            break;
          case DioErrorType.RECEIVE_TIMEOUT:
            print('DioErrorType.RECEIVE_TIMEOUT');
            break;
          case DioErrorType.RESPONSE:
            print('Request with response error ${error.response}');
            if ((error.response?.statusCode == 401 || error.response?.statusCode == 403)) {
              _navigationService.navigatePushAndRemoveUntil(RoutingNameConstant.loginScreen);
              SnackbarBuilder.showSnackbar(
                'You need to login to continue',
                Colors.red,
              );
            }
            break;
          case DioErrorType.SEND_TIMEOUT:
            break;
        }
      } catch (e) {}
    },
  );
}
