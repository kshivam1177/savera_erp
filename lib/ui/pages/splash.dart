import 'package:flutter/material.dart';
import 'package:savera_erp/route/route_helper.dart';
import 'package:savera_erp/services/storage/preferance/preference_handler.dart';

class PgSplashScreen extends StatefulWidget {
  static const String routeName = '/';

  @override
  State<PgSplashScreen> createState() => _PgSplashScreenState();
}

class _PgSplashScreenState extends State<PgSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<bool>(
        future: PrefHandler.isLoggedIn(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data == true) {
              RouteHelper.toHomePage(context);
            } else {
              RouteHelper.toLoginPage(context);
            }
          }
          return Center(
            child: SizedBox(
              height: 40.0,
              width: 40.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                strokeWidth: 2,
              ),
            ),
          );
        },
      ),
    );
  }
}
