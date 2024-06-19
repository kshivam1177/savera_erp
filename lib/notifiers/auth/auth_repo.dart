import 'package:savera_erp/app_utilities/app_constants.dart';
import 'package:savera_erp/app_utilities/helpers.dart';
import 'package:savera_erp/local_storage/preference_handler.dart';
import 'package:savera_erp/models/auth_result.model.dart';
import 'package:savera_erp/services/rest_client/rest_client_dio.dart';

import '../../models/api_response.model.dart';

class AuthRepo {
  Future<ApiResponse<AuthResult>> doLogin({
    required String username,
    required String password,
  }) async {
    if (await Helpers.isInternetPresent()) {
      final loginData = await RestClientDio().request(
        url: AppConstants.loginUrl,
        params: {'user_name': username, 'password': password},
      );

      if (loginData.isSuccess) {
        loginData.data!.putIfAbsent("password", () => password);

        final user = AuthResult.fromMap(loginData.data!);

        await PrefHandler.setUserId(user.userId);
        await PrefHandler.setLoginId(user.loginId);
        await PrefHandler.setAuthResult(user);
        return ApiResponse.success(user)
          ..statusDescriptor = loginData.statusDescriptor;
      } else {
        return ApiResponse.fromResponse(loginData);
      }
    } else {
      return ApiResponse.noInternet();
    }
  }
}
