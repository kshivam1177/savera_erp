import 'package:savera_erp/models/api_response.model.dart';
import 'package:savera_erp/models/auth_result.model.dart';
import 'package:savera_erp/services/rest_client/app_urls.dart';
import 'package:savera_erp/services/rest_client/rest_client_dio.dart';
import 'package:savera_erp/services/storage/preference/preference_handler.dart';
import 'package:savera_erp/shared/helpers.dart';

class AuthRepo {
  Future<ApiResponse<AuthResult>> doLogin({
    required String username,
    required String password,
  }) async {
    if (await Helpers.isInternetPresent()) {
      final loginData = await RestClientDio().request(
        url: AppUrls.login,
        params: {'user_name': username, 'password': password},
      );

      if (loginData.status.success) {
        loginData.data!.putIfAbsent("password", () => password);

        final user = AuthResult.fromMap(loginData.data!);

        await PrefHandler.setUserId(user.userId);
        await PrefHandler.setLoginId(user.loginId);
        await PrefHandler.setAuthResult(user);
        return ApiResponse.success(user);
      } else {
        return ApiResponse.fromResponse(loginData);
      }
    } else {
      return ApiResponse.noInternet();
    }
  }

  Future<ApiResponse<bool>> createMobileUser({
    required String phone,
    required String username,
    required String password,
    required int userTypeId,
  }) async {
    // possible value of userTypeId = RELATIONSHIP_MANAGER(5)
    if (await Helpers.isInternetPresent()) {
      final loginData = await RestClientDio().request(
        url: AppUrls.createUser,
        params: {
          'phone': phone,
          'user_name': username,
          'password': password,
          'user_type_id': userTypeId,
        },
      );

      if (loginData.status.success) {
        return ApiResponse.success(true, msg: loginData.msg);
      } else {
        return ApiResponse.fromResponse(loginData);
      }
    } else {
      return ApiResponse.noInternet();
    }
  }

  Future<ApiResponse<bool>> toggleUserActiveStatus({
    required int userId,
    required int userTypeId,
    required bool markActive,
  }) async {
    // possible value of userTypeId = RELATIONSHIP_MANAGER(5)
    if (await Helpers.isInternetPresent()) {
      final loginData = await RestClientDio().request(
        url: AppUrls.setInactive,
        method: HttpMethods.put,
        params: {
          'user_id': userId,
          'user_type_id': userTypeId,
          'markActive': markActive,
        },
      );

      if (loginData.status.success) {
        return ApiResponse.success(true, msg: loginData.msg);
      } else {
        return ApiResponse.fromResponse(loginData);
      }
    } else {
      return ApiResponse.noInternet();
    }
  }
}
