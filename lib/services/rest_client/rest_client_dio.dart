import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:savera_erp/models/api_response.dart';
import 'package:savera_erp/shared/app_messages.dart';
import 'package:savera_erp/shared/helpers.dart';
import 'DioIntercepter.dart';
import 'package:dio/browser.dart';

enum HttpMethods { get, post, put, delete, byte, bytePost }

class RestClientDio {
  static final RestClientDio _instance = RestClientDio._();
  late final Dio _dioObj;

  RestClientDio._() {
    _dioObj = Dio(options);
    _dioObj.interceptors.add(DioInterceptor());
    if (kIsWeb) {
      _dioObj.httpClientAdapter = BrowserHttpClientAdapter();
    } else {
      _dioObj.httpClientAdapter = IOHttpClientAdapter()
        ..createHttpClient = () {
          return HttpClient()
            ..badCertificateCallback = (x509, host, port) => true;
        };
    }
  }

  factory RestClientDio() => _instance;

  BaseOptions get options {
    return BaseOptions(
      responseType: ResponseType.json,
      connectTimeout: const Duration(minutes: 1),
      receiveTimeout: const Duration(minutes: 1),
      sendTimeout: const Duration(minutes: 1),
    );
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
      // if (!await Helpers.isInternetPresent()) {
      //   return ApiResponse.noInternet();
      // }

      final options = Options(headers: {...headers ?? {}});

      switch (method) {
        case HttpMethods.get:
          response = await _dioObj.get(url, options: options);
          break;
        case HttpMethods.post:
          response = await _dioObj.post(url, data: params, options: options);
          break;
        case HttpMethods.put:
          response = await _dioObj.put(url, data: params, options: options);
          break;
        case HttpMethods.delete:
          response = await _dioObj.delete(url, data: params, options: options);
          break;
        case HttpMethods.byte:
          response = await _dioObj.get(
            url,
            options: options..responseType = ResponseType.bytes,
          );
          break;
        case HttpMethods.bytePost:
          response = await _dioObj.post(
            url,
            data: params,
            options: options..responseType = ResponseType.bytes,
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
        final status = Helpers.enumFromString(
              TxnStatus.values,
              resultData["status"].toString(),
            ) ??
            TxnStatus.FAILED;

        if (status.updateRequired || status.accountDeleted) {
          // todo(shivam) : need to handle this case - overlay
          // CoreInitializers.updateValueProvider.value = OverLayInfo(
          //   status: status,
          //   msg: resultData["msg"],
          // );
          return ApiResponse.failure(resultData["msg"]);
        }

        return ApiResponse(
          status: status,
          msg: "${resultData["msg"]}",
          data: resultData["data"],
        );
      } else {
        /// Added Error case if status 200 and still response null. Added extra parameter in email for better understanding of issue for backend developer.

        return ApiResponse.failure(AppMessages.serverHavingIssue);
      }
    } on DioException catch (error, stacktrace) {
      print("dio-exception :: $error \n stacktrace :: $stacktrace");

      /// Added extra parameter in email for better understanding of issue for backend developer.
      final errorResp = _ErrorHandler.response(error);
      String errorMsg = AppMessages.serverHavingIssue;
      TxnStatus? status = null;
      if (errorResp is String) {
        errorMsg = errorResp;
      } else if (errorResp is Map<String, dynamic>) {
        errorMsg = errorResp["msg"];
        status = Helpers.enumFromString(
          TxnStatus.values,
          errorResp["status"].toString(),
        );
      }

      // ErrorLogger.logApiError(
      //   targetURL: url,
      //   headers: headers,
      //   params: params,
      //   errorDetails: "data :: ${error.response?.data} \n error :: $error",
      //   stackTrace: stacktrace,
      //   errorDisplayMsg: errorMsg,
      //   errorFileDescriptor: "client_dio.dart",
      // );

      return ApiResponse.failure(errorMsg)..status = status ?? TxnStatus.FAILED;
    }
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
