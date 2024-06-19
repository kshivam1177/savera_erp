import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:savera_erp/ui/route/path_mapper.dart';

abstract class AppRouter {
  static Future<dynamic> toLoginPage(BuildContext context) {
    return Navigator.of(context).pushNamed(PathMapper.login);
  }

//=============================================================================

  static Future<dynamic> toHomePage(BuildContext context) {
    return Navigator.of(context).pushNamedAndRemoveUntil(
      PathMapper.home,
      (route) => false,
    );
  }
}
