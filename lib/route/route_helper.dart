import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:savera_erp/ui/pages/auth/pg_login.dart';
import 'package:savera_erp/ui/pages/home/pg_home.dart';

abstract class RouteHelper {
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
}