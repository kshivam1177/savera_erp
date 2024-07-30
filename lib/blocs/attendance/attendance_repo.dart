import 'package:savera_erp/models/api_response.model.dart';
import 'package:savera_erp/models/attendance/rm_list_attendance_item.dart';
import 'package:savera_erp/models/auth_result.model.dart';
import 'package:savera_erp/services/rest_client/app_urls.dart';
import 'package:savera_erp/services/rest_client/rest_client_dio.dart';
import 'package:savera_erp/services/storage/preference/preference_handler.dart';
import 'package:savera_erp/shared/dx_date_utils.dart';
import 'package:savera_erp/shared/helpers.dart';

class AttendanceRepo {
  Future<ApiResponse<List<RmListAttendanceItem>>> getAll({
    required DateTime date,
  }) async {
    if (await Helpers.isInternetPresent()) {
      final result = await RestClientDio().request(
        url: AppUrls.getRmListForAttendance,
        params: {
          'date': DxDateUtils.getFormattedDate(
            date,
            isYMD: true,
            isSlashed: false,
          )
        },
      );

      if (result.status.success) {
        final items = result.data!["rm_list"] as List<dynamic>;
        return ApiResponse.success(
          items.map((e) => RmListAttendanceItem.fromMap(e)).toList(),
        );
      } else {
        return ApiResponse.fromResponse(result);
      }
    } else {
      return ApiResponse.noInternet();
    }
  }

  Future<ApiResponse<List<LocationItem>>> getLocations({
    required int empId,
    required int routePlanId,
    required DateTime fromDate,
    required DateTime toDate,
  }) async {
    if (await Helpers.isInternetPresent()) {
      final fromDateStr = DxDateUtils.getFormattedDate(
        fromDate,
        isYMD: true,
        isSlashed: false,
      );

      final toDateStr = DxDateUtils.getFormattedDate(
        toDate,
        isYMD: true,
        isSlashed: false,
      );

      final result = await RestClientDio().request(
        url: AppUrls.getLocations,
        params: {
          'emp_id': empId,
          'route_plan_id': routePlanId,
          'from_date': "$fromDateStr 00:00:00",
          'to_date': "$toDateStr 23:59:59"
        },
      );

      if (result.status.success) {
        final items = result.data!["locations"] as List<dynamic>;
        return ApiResponse.success(
          items.map((e) => LocationItem.fromMap(e)).toList(),
        );
      } else {
        return ApiResponse.fromResponse(result);
      }
    } else {
      return ApiResponse.noInternet();
    }
  }
}
