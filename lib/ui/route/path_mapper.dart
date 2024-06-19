import 'package:flutter/material.dart';
import 'package:savera_erp/ui/pages/auth/pg_login.dart';
import 'package:savera_erp/ui/pages/home/pg_home.dart';

class PathMapper {
  static const String login = '/login';
  static const String home = '/home';

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
      case login:
        return MaterialPageRoute(builder: (_) => const PgLogin());
      case home:
        // final someArg = settings.arguments as SomeArgType;
        return MaterialPageRoute(builder: (_) => const PgHome());
      default:
        return null;
    }
  }

  static Map<String, WidgetBuilder> routes = {
    login: (context) {
      final args = ModalRoute.of(context)!.settings.arguments as String;
      print("args is: login $args");
      return const PgLogin();
    },
    home: (context) {
      final args = ModalRoute.of(context)!.settings.arguments as String;
      print("args is: home $args");
      return const PgHome();
    }
  };
}
