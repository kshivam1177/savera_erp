import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:savera_erp/ui/pages/attendance/pg_attendance.dart';
import 'package:savera_erp/ui/pages/auth/pg_login.dart';
import 'package:savera_erp/ui/pages/home/pg_home.dart';
import 'package:savera_erp/ui/pages/pg_map_view.dart';

abstract class RouteHelper {
  static void toAny(
    BuildContext context,
    String route, {
    Map<String, String>? args,
  }) {
    context.goNamed(
      route,
      queryParameters: args ?? {},
    );
  }

  static void toLoginPage(BuildContext context) {
    while (context.canPop()) {
      context.pop();
    }
    context.pushReplacement(PgLogin.routeName);
  }

  static void toHomePage(BuildContext context) {
    context.goNamed(
      PgHome.routeName,
      queryParameters: {
        "arg1": "queryValue",
        "arg2": "queryValue2",
        "arg3": "queryValue3"
      },
    );
  }

  static void toAttendanceList(BuildContext context) {
    context.goNamed(
      PgAttendance.routeName,
      queryParameters: {
        "arg1": "queryValue",
        "arg2": "queryValue2",
        "arg3": "queryValue3"
      },
    );
  }

  static void toMapView(
    BuildContext context, {
    required int empId,
    required int routePlanId,
    required DateTime fromDate,
    required DateTime toDate,
    required String empName,
  }) {
    context.goNamed(
      PgMapView.routeName,
      queryParameters: {
        "routePlanId": routePlanId.toString(),
        "empName": empName,
        "empId": empId.toString(),
        "fromDate": fromDate.toIso8601String(),
        "toDate": toDate.toIso8601String(),
      },
    );
  }
}
