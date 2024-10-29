import 'package:savera_erp/models/api_response.dart';
import 'package:savera_erp/models/rm/rm_list_for_login_item.dart';
import 'package:savera_erp/services/rest_client/app_urls.dart';
import 'package:savera_erp/services/rest_client/rest_client_dio.dart';
import 'package:savera_erp/shared/helpers.dart';

class RMRepo {
  Future<ApiResponse<List<RmListLoginItem>>> getAllRMs() async {
    if (await Helpers.isInternetPresent()) {
      final result = await RestClientDio().request(
        url: AppUrls.getRmListForMobileLogin,
        method: HttpMethods.get,
        params: {},
      );

      if (result.status.success) {
        final items = result.data!["rm-list"] as List<dynamic>;
        return ApiResponse.success(
          items.map((e) => RmListLoginItem.fromMap(e)).toList(),
        );
      } else {
        return ApiResponse.fromResponse(result);
      }

    } else {
      return ApiResponse.noInternet();
    }
  }
}
