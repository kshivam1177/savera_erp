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
}
