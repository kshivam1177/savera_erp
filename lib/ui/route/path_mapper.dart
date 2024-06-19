import 'package:flutter/material.dart';
import 'package:savera_erp/ui/pages/auth/pg_login.dart';
import 'package:savera_erp/ui/pages/home/pg_home.dart';

class PathMapper {
  static const String login = '/login';
  static const String home = '/home';

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
      case '/login':
        return MaterialPageRoute(builder: (_) => const PgLogin());
      case '/home':
        // final someArg = settings.arguments as SomeArgType;
        return MaterialPageRoute(builder: (_) => const PgHome());
      default:
        return null;
    }
  }
}
