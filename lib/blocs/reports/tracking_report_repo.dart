import 'package:savera_erp/models/api_response.dart';
import 'package:savera_erp/models/reports/from_date_to_date.dart';
import 'package:savera_erp/models/reports/tracking_report/tracking_report_item.dart';
import 'package:savera_erp/services/rest_client/app_urls.dart';
import 'package:savera_erp/services/rest_client/rest_client_dio.dart';
import 'package:savera_erp/shared/dx_date_utils.dart';
import 'package:savera_erp/shared/helpers.dart';

class TrackingReportRepo {
  Future<ApiResponse<List<VisitTrackingItem>>> getRmWiseVisits(
    DateRangeFilter filter,
  ) async {
    if (await Helpers.isInternetPresent()) {
      final result = await RestClientDio().request(
        url: AppUrls.getRmWiseVisits,
        method: HttpMethods.post,
        params: {
          "from_date": DxDateUtils.getFormattedDate(
            filter.from,
            isYMD: true,
            isSlashed: false,
          ),
          "to_date": DxDateUtils.getFormattedDate(
            filter.to,
            isYMD: true,
            isSlashed: false,
          )
        },
      );

      if (result.status.success) {
        final items = result.data!["total_travel"] as List<dynamic>;
        return ApiResponse.success(
          items.map((e) => VisitTrackingItem.fromMap(e)).toList(),
        );
      } else {
        return ApiResponse.fromResponse(result);
      }
    } else {
      return ApiResponse.noInternet();
    }
  }

  Future<ApiResponse<List<VisitTrackingDetailItem>>> getRmVisitsDetail(
    DateRangeFilter filter,
    int empId,
  ) async {
    if (await Helpers.isInternetPresent()) {
      final result = await RestClientDio().request(
        url: AppUrls.getRmVisitsDetail,
        method: HttpMethods.post,
        params: {
          "emp_id": empId,
          "from_date": DxDateUtils.getFormattedDate(
            filter.from,
            isYMD: true,
            isSlashed: false,
          ),
          "to_date": DxDateUtils.getFormattedDate(
            filter.to,
            isYMD: true,
            isSlashed: false,
          )
        },
      );

      if (result.status.success) {
        final items = result.data!["visits"] as List<dynamic>;
        return ApiResponse.success(
          items.map((e) => VisitTrackingDetailItem.fromMap(e)).toList(),
        );
      } else {
        return ApiResponse.fromResponse(result);
      }
    } else {
      return ApiResponse.noInternet();
    }
  }
}
