
import 'package:savera_erp/app_utilities/app_messages.dart';

enum StatusDescriptor {
  success,
  update_required,
  param_missing,
  media_type_not_supported,
  account_deleted,
  account_deleted_request,
  common_error
}

class ApiResponse<T> {
  T? data;
  bool isSuccess;
  StatusDescriptor statusDescriptor;
  String msg;
  String? trace;

  ApiResponse({
    required this.isSuccess,
    this.data,
    required this.msg,
    this.statusDescriptor = StatusDescriptor.success,
    this.trace,
  });

  factory ApiResponse.success(T data, {String msg = ""}) {
    return ApiResponse<T>(
      isSuccess: true,
      msg: msg,
      data: data,
    );
  }

  factory ApiResponse.failure(String reason, [String? trace = null]) {
    return ApiResponse<T>(
      isSuccess: false,
      msg: reason,
      trace: trace,
    );
  }

  factory ApiResponse.noInternet() {
    return ApiResponse.failure(AppMessages.getNoInternetMsg);
  }

  factory ApiResponse.somethingWentWrong([Exception? e]) {
    return ApiResponse.failure(AppMessages.somethingWentWrong, e.toString());
  }

  factory ApiResponse.fromResponse(ApiResponse response) {
    return ApiResponse.failure(response.msg)
      ..statusDescriptor = response.statusDescriptor
      ..isSuccess = response.isSuccess;
  }
}