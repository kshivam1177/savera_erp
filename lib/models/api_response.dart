import 'package:savera_erp/shared/app_messages.dart';

enum TxnStatus {
  SUCCESS,
  FAILED,
  UPDATE_REQUIRED,
  PARAM_MISSING,
  MEDIA_TYPE_NOT_SUPPORTED,
  ACCOUNT_DELETED,
  ACCOUNT_DELETED_REQUEST,
  INVALID_REQUEST_HEADER;

  bool get isFailed => this == TxnStatus.FAILED;

  bool get success => this == TxnStatus.SUCCESS;

  bool get updateRequired => this == TxnStatus.UPDATE_REQUIRED;

  bool get accountDeleted => this == TxnStatus.ACCOUNT_DELETED;
}

class ApiResponse<T> {
  T? data;
  TxnStatus status;
  String msg;
  String? trace;

  ApiResponse({
    required this.status,
    required this.msg,
    this.data,
    this.trace,
  });

  factory ApiResponse.success(T data, {String msg = ""}) {
    return ApiResponse<T>(
      status: TxnStatus.SUCCESS,
      msg: msg,
      data: data,
    );
  }

  factory ApiResponse.failure(String reason, [String? trace = null]) {
    return ApiResponse<T>(
      status: TxnStatus.FAILED,
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
    return ApiResponse.failure(response.msg)..status = response.status;
  }
}
