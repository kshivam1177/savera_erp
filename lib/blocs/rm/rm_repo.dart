import 'package:savera_erp/models/api_response.model.dart';
import 'package:savera_erp/models/rm/rm_list_for_login_item.dart';
import 'package:savera_erp/services/rest_client/app_urls.dart';
import 'package:savera_erp/services/rest_client/rest_client_dio.dart';
import 'package:savera_erp/shared/helpers.dart';

class RMRepo {
  Future<ApiResponse<List<RmListLoginItem>>> getAllRMs() async {
    if (await Helpers.isInternetPresent()) {
      // final result = await RestClientDio().request(
      //   url: AppUrls.getRmListForMobileLogin,
      //   method: HttpMethods.get,
      //   params: {},
      // );

      // if (result.status.success) {
      //   final items = result.data!["rm-list"] as List<dynamic>;
      //   return ApiResponse.success(
      //     items.map((e) => RmListLoginItem.fromMap(e)).toList(),
      //   );
      // } else {
      //   return ApiResponse.fromResponse(result);
      // }

      List<Map<String, dynamic>> staffData = [
        {
          "staff_id": 1,
          "staff_name": "John Doe",
          "staff_location": "HQ",
          "staff_designation": "Relationship Manager",
          "join_date": "2020-01-15",
          "staff_phone": "+1234567890",
          "user_type_id": 5,
          "user_type_name": "RELATIONSHIP_MANAGER",
          "login_user_name": "johndoe",
          "login_device_info": "PC",
          "login_inactive_on": "",
          "login_deleted_on": "",
          "last_login_date": "2024-08-01",
          "login_created_on": "2020-01-15"
        },
        {
          "staff_id": 2,
          "staff_name": "Jane Smith",
          "staff_location": "Branch A",
          "staff_designation": "Customer Support",
          "join_date": "2019-03-22",
          "staff_phone": "+0987654321",
          "user_type_id": 4,
          "user_type_name": "CUSTOMER_SUPPORT",
          "login_user_name": "",
          "login_device_info": "",
          "login_inactive_on": "",
          "login_deleted_on": "",
          "last_login_date": "2024-07-30",
          "login_created_on": "2019-03-22"
        },
        {
          "staff_id": 3,
          "staff_name": "Alice Johnson",
          "staff_location": "Branch B",
          "staff_designation": "Sales Executive",
          "join_date": "2021-06-10",
          "staff_phone": "+1122334455",
          "user_type_id": 6,
          "user_type_name": "SALES_EXECUTIVE",
          "login_user_name": "alicejohnson",
          "login_device_info": "Laptop",
          "login_inactive_on": "",
          "login_deleted_on": "",
          "last_login_date": "2024-08-02",
          "login_created_on": "2021-06-10"
        },
        {
          "staff_id": 4,
          "staff_name": "Bob Brown",
          "staff_location": "HQ",
          "staff_designation": "IT Manager",
          "join_date": "2018-11-20",
          "staff_phone": "+2233445566",
          "user_type_id": 7,
          "user_type_name": "IT_MANAGER",
          "login_user_name": "",
          "login_device_info": "Desktop",
          "login_inactive_on": "",
          "login_deleted_on": "",
          "last_login_date": "2024-07-29",
          "login_created_on": "2018-11-20"
        }
      ];

      return ApiResponse.success(
        staffData.map((e) => RmListLoginItem.fromMap(e)).toList(),
      );
    } else {
      return ApiResponse.noInternet();
    }
  }
}
