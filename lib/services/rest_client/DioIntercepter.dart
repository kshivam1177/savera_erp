import 'dart:io';

import 'package:dio/dio.dart';
import 'package:savera_erp/services/storage/preferance/preference_handler.dart';
import 'package:savera_erp/shared/app_info.dart';
import 'package:savera_erp/shared/device_info.dart';

class DioInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final authResult = await PrefHandler.getAuthResult();
    if (authResult.token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer ${authResult.token}';
    }
    options.contentType = ContentType.json.toString();
    options.headers['x-device-info'] = "";
    options.headers['x-platform'] = DeviceInfo.platformName;
    options.headers['x-app-version'] = AppInfo.appVersion;
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // if (err.response?.statusCode == 401) {
    //   handler.reject(err);
    // } else {
    //   handler.next(err);
    // }
    super.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
  }
}
