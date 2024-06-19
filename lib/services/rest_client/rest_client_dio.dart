import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:http_parser/http_parser.dart';
import 'package:savera_erp/app_utilities/app_info.dart';
import 'package:savera_erp/app_utilities/app_messages.dart';
import 'package:savera_erp/app_utilities/device_info.dart';
import 'package:savera_erp/app_utilities/helpers.dart';
import 'package:savera_erp/local_storage/preference_handler.dart';
import 'package:savera_erp/models/api_response.model.dart';

enum HttpMethods { get, post, put, delete, byte, bytePost }

class RestClientDio {
  static final RestClientDio _instance = RestClientDio._();

  late final _dioObj = addInterceptors(Dio(options));

  Dio get dio => _dioObj;

  RestClientDio._();

  factory RestClientDio() => _instance;

  BaseOptions get options {
    return BaseOptions(
      responseType: ResponseType.json,
      connectTimeout: const Duration(minutes: 1),
      receiveTimeout: const Duration(minutes: 1),
      sendTimeout: const Duration(minutes: 1),
      headers: {
        'Content-Type': 'application/json',
        'X-Device-Info': "",
        'X-Platform': DeviceInfo.platformName,
        'X-App-Version': AppInfo.appVersion,
      },
    );
  }

  Dio addInterceptors(
    Dio dio, {
    bool withAdapter = false,
  }) {
    if (withAdapter) {
      final defaultAdapter = dio.httpClientAdapter as IOHttpClientAdapter;
      defaultAdapter.onHttpClientCreate = _onCreateClient;
    }
    return dio;
  }

  HttpClient? _onCreateClient(HttpClient hc) {
    hc.badCertificateCallback = (X509Certificate cert, String host, int port) {
      return true;
    };
    return hc;
  }

  Future<ApiResponse<Map<String, dynamic>>> request<T>({
    required String url,
    required Map<String, dynamic> params,
    HttpMethods method = HttpMethods.post,
    Map<String, dynamic>? headers,
  }) async {
    Response? response;

    try {
      if (url.isEmpty) {
        return ApiResponse.failure("Invalid URL");
      }

      /// Check For Network
      if (!await Helpers.isInternetPresent()) {
        return ApiResponse.noInternet();
      }
      final authResult = await PrefHandler.getAuthResult();

      final basicHeaders = {
        'Content-Type': 'application/json',
        'X-Device-Info': "",
        'X-Platform': DeviceInfo.platformName,
        'X-App-Version': AppInfo.appVersion,
        if (authResult.token.isNotEmpty)
          'Authorization': "Bearer ${authResult.token}",
      };

      _dioObj.options.headers.addAll(headers ?? {});
      _dioObj.options.headers.addAll(basicHeaders);

      switch (method) {
        case HttpMethods.get:
          response = await _dioObj.get(
            url,
            options: Options(headers: options.headers),
          );
          break;
        case HttpMethods.post:
          response = await _dioObj.post(
            url,
            data: params,
            options: Options(headers: options.headers),
          );
          break;
        case HttpMethods.put:
          response = await _dioObj.put(
            url,
            data: params,
            options: Options(headers: options.headers),
          );
          break;
        case HttpMethods.delete:
          response = await _dioObj.delete(
            url,
            data: params,
            options: Options(headers: options.headers),
          );
          break;
        case HttpMethods.byte:
          response = await _dioObj.get(
            url,
            options: Options(
              headers: options.headers,
              responseType: ResponseType.bytes,
            ),
          );
          break;
        case HttpMethods.bytePost:
          response = await _dioObj.post(
            url,
            data: params,
            options: Options(
              headers: options.headers,
              responseType: ResponseType.bytes,
            ),
          );
          break;
        default:
      }

      /// Added check if response or response.data coming null in 200m success.
      if (response?.statusCode == 200 && response?.data != null) {
        final resultData = Map<String, dynamic>.from(response!.data);
        if (kDebugMode) {
          print("response_data: $resultData");
        }
        return ApiResponse(
          isSuccess: int.tryParse("${resultData["status"]}") == 1,
          msg: "${resultData["msg"]}",
          data: resultData["data"],
          statusDescriptor: Helpers.enumFromString(
                StatusDescriptor.values,
                resultData["status_descriptor"].toString(),
              ) ??
              StatusDescriptor.success,
          // todo: status descriptor dynamic
        );
      } else {
        /// Added Error case if status 200 and still response null. Added extra parameter in email for better understanding of issue for backend developer.

        return ApiResponse.failure(AppMessages.serverHavingIssue);
      }
    } on DioException catch (error, stacktrace) {
      /// Added extra parameter in email for better understanding of issue for backend developer.
      final getError = _ErrorHandler.response(error);
      final displayError =
          getError is String ? getError : AppMessages.serverHavingIssue;
      return ApiResponse.failure(displayError);
    }
  }

  Future<Map<String, dynamic>> uploadFile(
    String destinationURL,
    String fileLocalPath,
    String userId,
    String userType,
  ) async {
    final multipartFile = await MultipartFile.fromFile(
      fileLocalPath,
      filename: "${userId}upload.jpg",
      contentType: MediaType('image', 'jpg'),
    );

    var formData = FormData.fromMap({
      // 'files': [
      //   await MultipartFile.fromFile('./text1.txt', filename: 'text1.txt'),
      // ]
      "file": multipartFile,
      "entityId": userId,
      "fileName": "profile-pic-$userId",
      "entityType": "PROFILE_PIC",
      "description": "",
      "responseAsBase64": true
    });
    Response response = await Dio().post(destinationURL, data: formData);

    Map<String, dynamic> responseMap = {
      'status': '0',
      'msg': 'unable to communicate with server'
    };

    if (response.statusCode == 200) {
      responseMap = (response.data as Map<String, dynamic>);
    }

    return responseMap;
  }

  Future<Map<String, dynamic>> uploadFileByte({
    required String destinationURL,
    required List<int> imageByte,
    required String pFileName,
    required String userId,
    required String userType,
  }) async {
    final multipartFile = MultipartFile.fromBytes(
      imageByte,
      filename: pFileName,
      contentType: MediaType('image', 'jpg'),
    );

    var formData = FormData.fromMap({
      'userType': userType,
      'userId': userId,
      'fileKey': multipartFile,
      // 'files': [
      //   await MultipartFile.fromFile('./text1.txt', filename: 'text1.txt'),
      // ]
    });
    Response response = await Dio().post(destinationURL, data: formData);

    Map<String, dynamic> responseMap = {
      'status': '0',
      'msg': 'unable to communicate with server'
    };

    if (response.statusCode == 200) {
      responseMap = (response.data as Map<String, dynamic>);
    }

    return responseMap;
  }
}

class _ErrorHandler {
  static dynamic response(DioException exception) {
    try {
      switch (exception.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return AppMessages.getNoInternetMsg;
        case DioExceptionType.badResponse:
          switch (exception.response!.statusCode) {
            case 400:
              return exception.response!.data;
            case 401:
              return exception.response!.data;
            case 404:
              return exception.response!.data;
            case 417:
              return exception.response!.data;
            case 500:
              return exception.response!.data;
            default:
              if (exception.response != null) {
                return exception.response!.statusMessage != null
                    ? AppMessages.pleaseTryAgain
                    : AppMessages.serverHavingIssueV2;
              } else {
                return AppMessages.serverHavingIssueV2;
              }
          }
        case DioExceptionType.cancel:
          return AppMessages.requestCancelled;
        case DioExceptionType.badCertificate:
        case DioExceptionType.connectionError:
        case DioExceptionType.unknown:
          return AppMessages.connectionFailed;
      }
    } on Exception {
      return AppMessages.somethingWentWrong;
    }
  }
}
